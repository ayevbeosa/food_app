import 'package:food_app/models/restaurant.dart';

class Section {
  List<String> names = [];
  List<Restaurant> restaurants = [];

  Section({
    required this.names,
    required this.restaurants,
  });

  Section.fromJson(dynamic json) {
    if (json['names'] != null) {
      names = json['names'].cast<String>();
    }
    if (json['restaurants'] != null) {
      json['restaurants'].forEach((v) {
        restaurants.add(Restaurant.fromJson(v));
      });
    }
  }
}
