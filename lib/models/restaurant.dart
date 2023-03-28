import 'orders.dart';

class Restaurant {
  late String section;
  late String name;
  late String phone;
  late String email;
  late String distanceFromUserLocation;
  late String address;
  late String notes;
  late String rating;
  late String noOfReviews;
  late String deliveryTime;
  List<String> images = [];
  late String categories;
  late String orderCategories;
  List<Orders> orders = [];

  Restaurant({
    required this.section,
    required this.name,
    required this.phone,
    required this.email,
    required this.distanceFromUserLocation,
    required this.address,
    required this.notes,
    required this.rating,
    required this.noOfReviews,
    required this.deliveryTime,
    required this.images,
    required this.categories,
    required this.orderCategories,
    required this.orders,
  });

  Restaurant.fromJson(dynamic json) {
    section = json['section'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    distanceFromUserLocation = json['distance_from_user_location'];
    address = json['address'];
    notes = json['notes'];
    rating = json['rating'];
    noOfReviews = json['no_of_reviews'];
    deliveryTime = json['delivery_time'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    categories = json['categories'];
    orderCategories = json['order_categories'];
    if (json['orders'] != null) {
      orders = [];
      json['orders'].forEach((v) {
        orders.add(Orders.fromJson(v));
      });
    }
  }
}
