import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:food_app/models/restaurant.dart';
import 'package:food_app/pages/restaurant_details_page.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/utils/constants.dart';
import 'package:food_app/widgets/restaurant_container.dart';

class RestaurantListPage extends StatefulWidget {
  final String categoryName;
  final List<Restaurant> restaurantList;

  RestaurantListPage({
    required this.categoryName,
    required this.restaurantList,
  });

  @override
  _RestaurantListPageState createState() => _RestaurantListPageState(
        this.categoryName,
        this.restaurantList,
      );
}

class _RestaurantListPageState extends State<RestaurantListPage> {
  final String _categoryName;
  final List<Restaurant> _restaurantList;

  _RestaurantListPageState(this._categoryName, this._restaurantList);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            AntDesign.arrowleft,
            color: kPrimaryColor,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          _categoryName,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: kPadding8,
        itemCount: _restaurantList.length,
        itemBuilder: (context, index) {
          return RestaurantContainer(
            restaurant: _restaurantList[index],
            width: 280.0,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => RestaurantDetailsPage(
                    restaurant: _restaurantList[index],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
