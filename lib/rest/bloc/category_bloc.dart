import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/models/category_response.dart';
import 'package:food_app/rest/api/api_repository.dart';
import 'package:food_app/rest/api/api_result.dart';
import 'package:food_app/rest/api/network_exceptions.dart';
import 'package:food_app/rest/api/result_state.dart';
import 'package:food_app/rest/event/category_event.dart';

class CategoryBloc extends Bloc<CategoryEvent, ResultState<CategoryResponse>> {
  late ApiRepository _apiRepository;

  CategoryBloc(this._apiRepository) : super(Idle()) {
    on<CategoryEvent>(_onFetchCategories);
  }

  void _onFetchCategories(
    CategoryEvent event,
    Emitter<ResultState<CategoryResponse>> emit,
  ) async {
    emit(ResultState.loading());

    ApiResult<CategoryResponse> apiResult =
        await _apiRepository.fetchAllCategories();

    apiResult.when(
      success: (CategoryResponse data) {
        emit(ResultState.data(data: data));
      },
      failure: (NetworkExceptions networkExceptions) {
        emit(ResultState.error(ne: networkExceptions));
      },
    );
  }
}
