import 'package:flutter/material.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/utils/constants.dart';

class BasketItemContainer extends StatelessWidget {
  final String title;
  final int quantity;
  final double price;
  final String items;

  BasketItemContainer({
    required this.title,
    required this.quantity,
    required this.price,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPadding8,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 24.0,
            child: Text(
              '${quantity}x',
              textScaleFactor: 1.1,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.green,
                fontSize: 16.0,
              ),
            ),
          ),
          SizedBox(width: 8.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$title',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  textScaleFactor: 1.2,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 2.0)),
                Text(
                  '$items',
                  style: const TextStyle(
                    fontSize: 16.0,
                    color: kPrimaryColor,
                  ),
                ),
              ],
            ),
          ),
          Text(
            '£${price.toStringAsFixed(2)}',
            textScaleFactor: 1.2,
            textAlign: TextAlign.end,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
