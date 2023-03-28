import 'package:flutter/material.dart';
import 'package:food_app/utils/constants.dart';
import 'package:shimmer/shimmer.dart';

class RestaurantListLoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Column(
        children: List.generate(
          5,
          (index) {
            return Padding(
              padding: kPaddingVertical4,
              child: SizedBox(
                height: 250,
                child: Card(
                  margin: kPaddingHorizontal8,
                  child: Container(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
