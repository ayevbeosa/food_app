import 'package:flutter/material.dart';
import 'package:food_app/utils/constants.dart';
import 'package:shimmer/shimmer.dart';

class CategoryLoadingWidget extends StatelessWidget {
  const CategoryLoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.0,
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: ListView.builder(
          padding: kPadding8,
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (context, index) {
            return Padding(
              padding: kPaddingVertical4,
              child: SizedBox(
                width: 130,
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
