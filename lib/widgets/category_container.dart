import 'package:flutter/material.dart';
import 'package:food_app/models/category.dart';
import 'package:food_app/utils/constants.dart';

class CategoryContainer extends StatelessWidget {
  final Category category;
  final VoidCallback? onTap;

  CategoryContainer({
    required this.category,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: kPaddingVertical4,
        child: SizedBox(
          width: 130,
          child: Card(
            margin: kPaddingHorizontal8,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(
                  category.categoryImage,
                  fit: BoxFit.fill,
                ),
                Positioned(
                  bottom: 8.0,
                  left: 8.0,
                  child: Text(
                    category.categoryName,
                    softWrap: true,
                    maxLines: 1,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.fade,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
