import 'package:food_app/models/section.dart';

class RestaurantsResponse {
  late String message;
  late bool success;
  late Section data;

  RestaurantsResponse({
    required this.message,
    required this.success,
    required this.data,
  });

  RestaurantsResponse.fromJson(dynamic json) {
    message = json['message'];
    success = json['success'];
    data = Section.fromJson(json['data']);
  }
}
