import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:food_app/models/restaurant.dart';
import 'package:food_app/rest/api/api_repository.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/utils/constants.dart';

class RestaurantContainer extends StatelessWidget {
  final Restaurant restaurant;
  final double? width;
  final Function onTap;

  RestaurantContainer({
    required this.restaurant,
    required this.onTap,
    this.width,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Padding(
        padding: kPaddingHorizontal8,
        child: Container(
          height: 250,
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                child: Stack(
                  children: [
                    Hero(
                      tag: restaurant.name,
                      transitionOnUserGestures: true,
                      createRectTween: _createRectTween,
                      child: Image.network(
                        ApiRepository.baseUrl + restaurant.images[0],
                        fit: BoxFit.fill,
                        height: 150.0,
                        width: double.infinity,
                      ),
                    ),
                    Positioned(
                      bottom: 8.0,
                      right: 4.0,
                      child: Container(
                        padding: kPadding16,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                        child: Text(
                          '${restaurant.deliveryTime} min',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(padding: const EdgeInsets.only(bottom: 8.0)),
              Text(
                restaurant.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Padding(padding: const EdgeInsets.only(bottom: 4.0)),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                  children: [
                    WidgetSpan(
                      child: Icon(
                        AntDesign.star,
                        size: 16.0,
                        color: kPrimaryColor,
                      ),
                      alignment: PlaceholderAlignment.bottom,
                    ),
                    TextSpan(
                      text:
                          ' ${restaurant.rating} (${restaurant.noOfReviews}+)',
                      style: TextStyle(
                        color: kPrimaryColor,
                      ),
                    ),
                    TextSpan(
                      text:
                          '  ${restaurant.categories.replaceAll(', ', ' • ')}' +
                              'CurryBeef, Italian, Chicken, American, Dessert',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static RectTween _createRectTween(Rect? begin, Rect? end) {
    return MaterialRectCenterArcTween(begin: begin, end: end);
  }
}
