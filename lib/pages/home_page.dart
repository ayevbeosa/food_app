import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:food_app/models/category_response.dart';
import 'package:food_app/models/restaurant.dart';
import 'package:food_app/models/restaurants_response.dart';
import 'package:food_app/models/section.dart';
import 'package:food_app/pages/restaurant_list_page.dart';
import 'package:food_app/rest/api/api_repository.dart';
import 'package:food_app/rest/api/result_state.dart';
import 'package:food_app/rest/bloc/category_bloc.dart';
import 'package:food_app/rest/bloc/restaurant_bloc.dart';
import 'package:food_app/rest/event/category_event.dart';
import 'package:food_app/rest/event/restaurant_event.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/utils/constants.dart';
import 'package:food_app/utils/custom_search_hint_delegate.dart';
import 'package:food_app/widgets/category_container.dart';
import 'package:food_app/widgets/category_loading_widget.dart';
import 'package:food_app/widgets/restaurant_list_loading_widget.dart';
import 'package:food_app/widgets/restaurant_sub_list_container.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Restaurant> restaurants = [];
  late Section _section;

  late CategoryBloc _categoryBloc;
  late RestaurantBloc _restaurantBloc;
  int _retryDurationInSeconds = 1;

  @override
  void initState() {
    _categoryBloc = CategoryBloc(context.read<ApiRepository>());
    _restaurantBloc = RestaurantBloc(context.read<ApiRepository>());
    _categoryBloc.add(CategoryEvent.fetchAllCategories());
    _restaurantBloc.add(RestaurantEvent.fetchAllRestaurants());

    super.initState();
  }

  @override
  void dispose() {
    _restaurantBloc.close();
    _categoryBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 40.0,
                left: 16.0,
                right: 16.0,
              ),
              child: ListTile(
                leading: Icon(AntDesign.search1, color: kSearchBarTextColor),
                title: Text(
                  'Dishes, restaurants or cuisines',
                  style: TextStyle(
                    color: kSearchBarTextColor,
                  ),
                ),
                tileColor: kSearchBarBackgroundColor,
                onTap: () {
                  showSearch(
                    context: context,
                    delegate: CustomSearchHintDelegate(
                      hintText: 'Dishes, restaurants or cuisines',
                    ),
                  );
                },
              ),
            ),
            BlocBuilder<CategoryBloc, ResultState<CategoryResponse>>(
              bloc: _categoryBloc,
              builder: (context, state) {
                return state.when(
                  idle: () => CategoryLoadingWidget(),
                  loading: () => CategoryLoadingWidget(),
                  data: (response) {
                    if (response.data.isNotEmpty) {
                      final categories = response.data;
                      return Container(
                        height: 130.0,
                        child: ListView.builder(
                          padding: kPadding8,
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            return CategoryContainer(
                              category: categories[index],
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => RestaurantListPage(
                                      categoryName:
                                          categories[index].categoryName,
                                      restaurantList: [],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                  error: (ne) {
                    Future.delayed(
                      Duration(seconds: _retryDurationInSeconds),
                      () {
                        _retryDurationInSeconds *= 3;
                        _categoryBloc.add(CategoryEvent.fetchAllCategories());
                      },
                    );
                    return CategoryLoadingWidget();
                  },
                );
              },
            ),
            BlocBuilder<RestaurantBloc, ResultState<RestaurantsResponse>>(
              bloc: _restaurantBloc,
              builder: (context, state) {
                return state.when(
                  idle: () => RestaurantListLoadingWidget(),
                  loading: () => RestaurantListLoadingWidget(),
                  data: (response) {
                    _section = response.data;

                    return Column(
                      children: List.generate(
                        _section.names.length,
                        (index) {
                          final name = _section.names[index];
                          return RestaurantSubListContainer(
                            sectionName: _section.names[index],
                            sectionList: _section.restaurants
                                .where((e) => e.section.contains(name))
                                .toList(),
                          );
                        },
                      ),
                    );
                  },
                  error: (ne) {
                    Future.delayed(
                      Duration(seconds: 5),
                      () {
                        _restaurantBloc
                            .add(RestaurantEvent.fetchAllRestaurants());
                      },
                    );
                    return RestaurantListLoadingWidget();
                  },
                );
              },
            ),
            // Padding(
            //   padding: kPaddingHorizontal16,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text(
            //         'Featured',
            //         style: TextStyle(
            //           fontWeight: FontWeight.bold,
            //           fontSize: 20,
            //         ),
            //       ),
            //       IconButton(
            //         icon: Icon(
            //           AntDesign.arrowright,
            //           color: kPrimaryColor,
            //         ),
            //         onPressed: () {
            //           Navigator.of(context).push(
            //             MaterialPageRoute(
            //               builder: (context) => RestaurantListPage(
            //                 categoryName: 'Featured',
            //               ),
            //             ),
            //           );
            //         },
            //       ),
            //     ],
            //   ),
            // ),
            // Container(
            //   height: 260.0,
            //   child: ListView.builder(
            //     padding: kPadding8,
            //     scrollDirection: Axis.horizontal,
            //     itemCount: 4,
            //     itemBuilder: (context, index) {
            //       final i = 9 + index;
            //       return RestaurantContainer(
            //         restaurant: restaurants[i],
            //         width: 280.0,
            //         onTap: () {
            //           _navigateToDetailsPage(restaurants[i]);
            //         },
            //       );
            //     },
            //   ),
            // ),
            // Padding(
            //   padding: kPaddingHorizontal8,
            //   child: Column(
            //     children: List.generate(
            //       3,
            //       (index) {
            //         final i = 6 + index;
            //         return RestaurantContainer(
            //           restaurant: restaurants[i],
            //           onTap: () {
            //             Navigator.of(context).push(
            //               MaterialPageRoute(
            //                 builder: (context) => RestaurantDetailsPage(
            //                   restaurant: restaurants[i],
            //                 ),
            //               ),
            //             );
            //           },
            //         );
            //       },
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: kPaddingHorizontal16,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text(
            //         'Top Rated',
            //         style: TextStyle(
            //           fontWeight: FontWeight.bold,
            //           fontSize: 20,
            //         ),
            //       ),
            //       IconButton(
            //         icon: Icon(
            //           AntDesign.arrowright,
            //           color: kPrimaryColor,
            //         ),
            //         onPressed: () {
            //           Navigator.of(context).push(
            //             MaterialPageRoute(
            //               builder: (context) => RestaurantListPage(
            //                 categoryName: 'Top Rated',
            //               ),
            //             ),
            //           );
            //         },
            //       ),
            //     ],
            //   ),
            // ),
            // Container(
            //   height: 260.0,
            //   child: Padding(
            //     padding: kPadding8,
            //     child: ListView.builder(
            //       padding: kPaddingVertical8,
            //       scrollDirection: Axis.horizontal,
            //       itemCount: 3,
            //       itemBuilder: (context, index) {
            //         final i = 3 + index;
            //         return RestaurantContainer(
            //           restaurant: restaurants[i],
            //           width: 280.0,
            //           onTap: () {
            //             Navigator.of(context).push(
            //               MaterialPageRoute(
            //                 builder: (context) => RestaurantDetailsPage(
            //                   restaurant: restaurants[i],
            //                 ),
            //               ),
            //             );
            //           },
            //         );
            //       },
            //     ),
            //   ),
            // ),
            // Column(
            //   children: List.generate(
            //     3,
            //     (index) {
            //       return RestaurantContainer(
            //         restaurant: restaurants[index],
            //         onTap: () {
            //           Navigator.of(context).push(
            //             MaterialPageRoute(
            //               builder: (context) => RestaurantDetailsPage(
            //                 restaurant: restaurants[index],
            //               ),
            //             ),
            //           );
            //         },
            //       );
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
