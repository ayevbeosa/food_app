import 'category.dart';

class CategoryResponse {
  late String message;
  late bool success;
  late List<Category> data;

  CategoryResponse({
    required this.message,
    required this.success,
    required this.data,
  });

  CategoryResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    success = json['success'];
    data = [];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data.add(Category.fromJson(v));
      });
    }
  }
}
