import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:food_app/models/restaurant.dart';
import 'package:food_app/pages/restaurant_details_page.dart';
import 'package:food_app/pages/restaurant_list_page.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/utils/constants.dart';
import 'package:food_app/widgets/restaurant_container.dart';

class RestaurantSubListContainer extends StatelessWidget {
  final String sectionName;
  final List<Restaurant> sectionList;

  static const opacityCurve = const Interval(
    0.0,
    0.75,
    curve: Curves.fastOutSlowIn,
  );

  RestaurantSubListContainer({
    required this.sectionName,
    required this.sectionList,
  });

  @override
  Widget build(BuildContext context) {
    return sectionName != 'All'
        ? Column(
            children: [
              Padding(
                padding: kPaddingHorizontal16,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      sectionName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        AntDesign.arrowright,
                        color: kPrimaryColor,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => RestaurantListPage(
                              categoryName: sectionName,
                              restaurantList: sectionList,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Container(
                height: 260.0,
                child: ListView.builder(
                  padding: kPadding8,
                  scrollDirection: Axis.horizontal,
                  itemCount: sectionList.length,
                  itemBuilder: (context, index) {
                    return RestaurantContainer(
                      restaurant: sectionList[index],
                      width: 280.0,
                      onTap: () {
                        _navigateToDetailsPage(context, sectionList[index]);
                      },
                    );
                  },
                ),
              ),
            ],
          )
        : Padding(
            padding: kPaddingHorizontal8,
            child: Column(
              children: List.generate(
                sectionList.length,
                (index) {
                  return RestaurantContainer(
                    restaurant: sectionList[index],
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => RestaurantDetailsPage(
                            restaurant: sectionList[index],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          );
  }

  void _navigateToDetailsPage(BuildContext context, Restaurant restaurant) {
    Navigator.of(context).push(
      PageRouteBuilder<void>(
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return AnimatedBuilder(
              animation: animation,
              builder: (BuildContext context, Widget? child) {
                return Opacity(
                  opacity: opacityCurve.transform(animation.value),
                  child: RestaurantDetailsPage(restaurant: restaurant),
                );
              });
        },
      ),
    );
  }
}
