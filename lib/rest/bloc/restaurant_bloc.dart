import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/models/restaurants_response.dart';
import 'package:food_app/rest/api/api_repository.dart';
import 'package:food_app/rest/api/api_result.dart';
import 'package:food_app/rest/api/network_exceptions.dart';
import 'package:food_app/rest/api/result_state.dart';
import 'package:food_app/rest/event/restaurant_event.dart';

class RestaurantBloc
    extends Bloc<RestaurantEvent, ResultState<RestaurantsResponse>> {
  final ApiRepository _apiRepository;

  RestaurantBloc(this._apiRepository) : super(Idle()) {
    on<RestaurantEvent>(_onFetchAllRestaurants);
  }

  void _onFetchAllRestaurants(
    RestaurantEvent event,
    Emitter<ResultState<RestaurantsResponse>> emit,
  ) async {
    emit(ResultState.loading());

    ApiResult<RestaurantsResponse> apiResult =
        await _apiRepository.fetchAllRestaurants();

    apiResult.when(
      success: (RestaurantsResponse data) {
        emit(ResultState.data(data: data));
      },
      failure: (NetworkExceptions error) {
        emit(ResultState.error(ne: error));
      },
    );
  }
}
