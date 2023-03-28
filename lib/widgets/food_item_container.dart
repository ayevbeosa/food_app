import 'package:flutter/material.dart';
import 'package:food_app/dummy/order.dart';

class FoodItemContainer extends StatelessWidget {
  final Order order;
  final VoidCallback onTap;

  FoodItemContainer({
    required this.order,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      isThreeLine: order.description.isNotEmpty,
      title: Text(
        order.name,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: order.description.isNotEmpty
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  order.description,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                ),
                Text(
                  '£${order.unitPrice}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            )
          : Text(
              '£${order.unitPrice}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
              ),
            ),
      onTap: onTap,
    );
  }
}
