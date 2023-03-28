import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:food_app/utils/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class RestaurantInfoPage extends StatelessWidget {
  final String restaurantName;
  final String phoneNumber;
  final String email;
  final String notes;

  RestaurantInfoPage({
    required this.restaurantName,
    required this.phoneNumber,
    required this.email,
    required this.notes,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            AntDesign.close,
            color: kPrimaryColor,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Restaurant info',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Got Questions?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Ask the restaurant about their ingredients and cooking methods.',
              style: TextStyle(
                color: Colors.grey,
                height: 1.3,
              ),
            ),
            ListTile(
              onTap: _launchPhoneDialer,
              leading: Icon(AntDesign.customerservice, color: kPrimaryColor),
              title: Text(
                'Call $restaurantName on \n$phoneNumber',
                textAlign: TextAlign.start,
                style: TextStyle(
                  height: 1.5,
                  fontSize: 16.0,
                  color: kPrimaryColor,
                ),
              ),
            ),
            ListTile(
              onTap: _launchEmailApp,
              leading: Icon(
                AntDesign.mail,
                color: kPrimaryColor,
              ),
              title: Text(
                'Email $restaurantName at \n$email',
                style: TextStyle(
                  height: 1.5,
                  fontSize: 16.0,
                  color: kPrimaryColor,
                ),
              ),
            ),
            SizedBox(height: 32.0),
            Text(
              'Restaurant notes',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              notes,
              style: TextStyle(
                color: Colors.grey,
                height: 1.3,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _launchPhoneDialer() async {
    canLaunch('tel:$phoneNumber').then((value) => {
          if (value) {launch('tel:$phoneNumber')}
        });
  }

  void _launchEmailApp() async {
    canLaunch('mailto:$email').then((value) => {
          if (value) {launch('mailto:$email')}
        });
  }
}
