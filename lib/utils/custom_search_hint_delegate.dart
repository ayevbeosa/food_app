import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:food_app/dummy/search.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/widgets/search_result_container.dart';

class CustomSearchHintDelegate extends SearchDelegate {
  List<Search> searchResults = [];
  List<Search> searchList = [];
  List<Search> restaurantsList = [];
  List<Search> dishesList = [];

  CustomSearchHintDelegate({
    required String hintText,
  }) : super(
          searchFieldLabel: hintText,
          searchFieldStyle: TextStyle(
            fontSize: 16.0,
            color: Colors.grey,
          ),
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.search,
        );

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(
        AntDesign.arrowleft,
        color: kPrimaryColor,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          Visibility(
            visible: restaurantsList.isNotEmpty,
            child: Text(
              'Restaurants',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              restaurantsList.length,
              (index) {
                final restaurant = restaurantsList[index];
                return SearchResultContainer(
                  order: restaurant.order,
                  rating: restaurant.rating,
                  noOfReviews: restaurant.noOfReviews,
                  price: restaurant.price,
                  restaurantName: restaurant.restaurantName,
                );
              },
            ),
          ),
          Visibility(
            visible: restaurantsList.isNotEmpty,
            child: Text(
              'Dishes',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              dishesList.length,
              (index) {
                final dish = dishesList[index];
                return SearchResultContainer(
                  order: dish.order,
                  rating: dish.rating,
                  noOfReviews: dish.noOfReviews,
                  price: dish.price,
                  restaurantName: dish.restaurantName,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) => Text('results');

  @override
  void showResults(BuildContext context) {
    super.showResults(context);
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(
          AntDesign.close,
          color: kPrimaryColor,
        ),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }
}
