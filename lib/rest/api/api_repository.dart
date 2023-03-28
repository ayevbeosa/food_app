import 'package:food_app/models/category_response.dart';
import 'package:food_app/models/restaurants_response.dart';
import 'package:food_app/rest/api/api_result.dart';
import 'package:food_app/rest/api/dio_client.dart';
import 'package:food_app/rest/api/network_exceptions.dart';

class ApiRepository {
  static const String baseUrl = 'xxx-add-your-own-base-url-xxx';

  late DioClient _dioClient;

  ApiRepository() {
    _dioClient = DioClient(baseUrl);
  }

  Future<ApiResult<CategoryResponse>> fetchAllCategories() async {
    try {
      final response = await _dioClient.get('category');

      return ApiResult.success(
        data: CategoryResponse.fromJson(response),
      );
    } catch (e) {
      return ApiResult.failure(ne: NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<RestaurantsResponse>> fetchAllRestaurants() async {
    try {
      final response = await _dioClient.get('restaurant_list');

      return ApiResult.success(
        data: RestaurantsResponse.fromJson(response),
      );
    } catch (e) {
      return ApiResult.failure(ne: NetworkExceptions.getDioException(e));
    }
  }
}
