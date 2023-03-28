import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/utils/constants.dart';

class IconCheckbox extends StatelessWidget {
  const IconCheckbox({
    required this.title,
    required this.value,
    required this.quantity,
    required this.onIconButtonPressed,
    required this.onBodyPressed,
  });

  final Widget title;
  final bool value;
  final int quantity;
  final Function onIconButtonPressed;
  final Function onBodyPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onBodyPressed();
      },
      child: Padding(
        padding: kPaddingHorizontal8,
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 24.0,
              child: Visibility(
                visible: quantity > 0,
                child: Text(
                  '${quantity}x',
                  style: TextStyle(
                    color: kPrimaryColor,
                  ),
                ),
              ),
            ),
            SizedBox(width: 8.0),
            Expanded(
              child: Padding(
                padding: kPadding8,
                child: title,
              ),
            ),
            SizedBox(width: 16.0),
            SizedBox(
              width: 16.0,
              child: Visibility(
                visible: quantity > 0,
                child: GestureDetector(
                  child: Icon(
                    AntDesign.delete,
                    color: Colors.red,
                    size: 20.0,
                  ),
                  onTap: () {
                    onIconButtonPressed();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
