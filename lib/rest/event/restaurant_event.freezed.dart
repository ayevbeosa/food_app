// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'restaurant_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RestaurantEventTearOff {
  const _$RestaurantEventTearOff();

  FetchAllRestaurants fetchAllRestaurants() {
    return const FetchAllRestaurants();
  }
}

/// @nodoc
const $RestaurantEvent = _$RestaurantEventTearOff();

/// @nodoc
mixin _$RestaurantEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchAllRestaurants,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetchAllRestaurants,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchAllRestaurants,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchAllRestaurants value) fetchAllRestaurants,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FetchAllRestaurants value)? fetchAllRestaurants,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchAllRestaurants value)? fetchAllRestaurants,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestaurantEventCopyWith<$Res> {
  factory $RestaurantEventCopyWith(
          RestaurantEvent value, $Res Function(RestaurantEvent) then) =
      _$RestaurantEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$RestaurantEventCopyWithImpl<$Res>
    implements $RestaurantEventCopyWith<$Res> {
  _$RestaurantEventCopyWithImpl(this._value, this._then);

  final RestaurantEvent _value;
  // ignore: unused_field
  final $Res Function(RestaurantEvent) _then;
}

/// @nodoc
abstract class $FetchAllRestaurantsCopyWith<$Res> {
  factory $FetchAllRestaurantsCopyWith(
          FetchAllRestaurants value, $Res Function(FetchAllRestaurants) then) =
      _$FetchAllRestaurantsCopyWithImpl<$Res>;
}

/// @nodoc
class _$FetchAllRestaurantsCopyWithImpl<$Res>
    extends _$RestaurantEventCopyWithImpl<$Res>
    implements $FetchAllRestaurantsCopyWith<$Res> {
  _$FetchAllRestaurantsCopyWithImpl(
      FetchAllRestaurants _value, $Res Function(FetchAllRestaurants) _then)
      : super(_value, (v) => _then(v as FetchAllRestaurants));

  @override
  FetchAllRestaurants get _value => super._value as FetchAllRestaurants;
}

/// @nodoc

class _$FetchAllRestaurants implements FetchAllRestaurants {
  const _$FetchAllRestaurants();

  @override
  String toString() {
    return 'RestaurantEvent.fetchAllRestaurants()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is FetchAllRestaurants);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchAllRestaurants,
  }) {
    return fetchAllRestaurants();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetchAllRestaurants,
  }) {
    return fetchAllRestaurants?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchAllRestaurants,
    required TResult orElse(),
  }) {
    if (fetchAllRestaurants != null) {
      return fetchAllRestaurants();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchAllRestaurants value) fetchAllRestaurants,
  }) {
    return fetchAllRestaurants(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FetchAllRestaurants value)? fetchAllRestaurants,
  }) {
    return fetchAllRestaurants?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchAllRestaurants value)? fetchAllRestaurants,
    required TResult orElse(),
  }) {
    if (fetchAllRestaurants != null) {
      return fetchAllRestaurants(this);
    }
    return orElse();
  }
}

abstract class FetchAllRestaurants implements RestaurantEvent {
  const factory FetchAllRestaurants() = _$FetchAllRestaurants;
}
