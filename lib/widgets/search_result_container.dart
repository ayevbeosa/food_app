import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/utils/constants.dart';

class SearchResultContainer extends StatelessWidget {
  final String order;
  final String rating;
  final String noOfReviews; // TODO: If > 500 show `+` else display without it
  final String price;
  final String restaurantName;

  SearchResultContainer({
    required this.order,
    required this.rating,
    required this.noOfReviews,
    required this.price,
    required this.restaurantName,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      isThreeLine: order.isNotEmpty,
      leading: Card(
        child: Image.asset(
          kSplashFoodImage4,
          fit: BoxFit.fill,
        ),
      ),
      title: Text(
        order.isNotEmpty ? order : restaurantName,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(),
      ),
      subtitle: order.isNotEmpty
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '£$price • Served by $restaurantName',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
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
                        text: ' $rating ($noOfReviews+)',
                        style: TextStyle(
                          color: kPrimaryColor,
                        ),
                      ),
                      TextSpan(
                        text: '  10 - 20 min',
                      ),
                    ],
                  ),
                ),
              ],
            )
          : RichText(
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
                    text: ' $rating ($noOfReviews+)',
                    style: TextStyle(
                      color: kPrimaryColor,
                    ),
                  ),
                  TextSpan(
                    text: '  10 - 20 min',
                  ),
                ],
              ),
            ),
    );
  }
}
