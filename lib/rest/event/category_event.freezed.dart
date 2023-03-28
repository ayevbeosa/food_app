// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'category_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CategoryEventTearOff {
  const _$CategoryEventTearOff();

  FetchAllCategories fetchAllCategories() {
    return const FetchAllCategories();
  }
}

/// @nodoc
const $CategoryEvent = _$CategoryEventTearOff();

/// @nodoc
mixin _$CategoryEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchAllCategories,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetchAllCategories,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchAllCategories,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchAllCategories value) fetchAllCategories,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FetchAllCategories value)? fetchAllCategories,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchAllCategories value)? fetchAllCategories,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryEventCopyWith<$Res> {
  factory $CategoryEventCopyWith(
          CategoryEvent value, $Res Function(CategoryEvent) then) =
      _$CategoryEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$CategoryEventCopyWithImpl<$Res>
    implements $CategoryEventCopyWith<$Res> {
  _$CategoryEventCopyWithImpl(this._value, this._then);

  final CategoryEvent _value;
  // ignore: unused_field
  final $Res Function(CategoryEvent) _then;
}

/// @nodoc
abstract class $FetchAllCategoriesCopyWith<$Res> {
  factory $FetchAllCategoriesCopyWith(
          FetchAllCategories value, $Res Function(FetchAllCategories) then) =
      _$FetchAllCategoriesCopyWithImpl<$Res>;
}

/// @nodoc
class _$FetchAllCategoriesCopyWithImpl<$Res>
    extends _$CategoryEventCopyWithImpl<$Res>
    implements $FetchAllCategoriesCopyWith<$Res> {
  _$FetchAllCategoriesCopyWithImpl(
      FetchAllCategories _value, $Res Function(FetchAllCategories) _then)
      : super(_value, (v) => _then(v as FetchAllCategories));

  @override
  FetchAllCategories get _value => super._value as FetchAllCategories;
}

/// @nodoc

class _$FetchAllCategories implements FetchAllCategories {
  const _$FetchAllCategories();

  @override
  String toString() {
    return 'CategoryEvent.fetchAllCategories()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is FetchAllCategories);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchAllCategories,
  }) {
    return fetchAllCategories();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetchAllCategories,
  }) {
    return fetchAllCategories?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchAllCategories,
    required TResult orElse(),
  }) {
    if (fetchAllCategories != null) {
      return fetchAllCategories();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchAllCategories value) fetchAllCategories,
  }) {
    return fetchAllCategories(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FetchAllCategories value)? fetchAllCategories,
  }) {
    return fetchAllCategories?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchAllCategories value)? fetchAllCategories,
    required TResult orElse(),
  }) {
    if (fetchAllCategories != null) {
      return fetchAllCategories(this);
    }
    return orElse();
  }
}

abstract class FetchAllCategories implements CategoryEvent {
  const factory FetchAllCategories() = _$FetchAllCategories;
}
