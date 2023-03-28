import 'package:food_app/rest/api/api_repository.dart';

class Category {
  late String categoryName;
  late String categoryImage;

  Category({
    required this.categoryName,
    required this.categoryImage,
  });

  Category.fromJson(Map<String, dynamic> json) {
    categoryName = json['category_name'];
    categoryImage = ApiRepository.baseUrl + json['category_image'];
  }
}
