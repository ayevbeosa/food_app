import 'package:freezed_annotation/freezed_annotation.dart';

part 'restaurant_event.freezed.dart';

@freezed
class RestaurantEvent with _$RestaurantEvent {
  const factory RestaurantEvent.fetchAllRestaurants() = FetchAllRestaurants;
}
