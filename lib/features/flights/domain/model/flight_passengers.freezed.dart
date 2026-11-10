// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flight_passengers.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FlightPassengers {

 int get adults; int get children;
/// Create a copy of FlightPassengers
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FlightPassengersCopyWith<FlightPassengers> get copyWith => _$FlightPassengersCopyWithImpl<FlightPassengers>(this as FlightPassengers, _$identity);

  /// Serializes this FlightPassengers to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FlightPassengers&&(identical(other.adults, adults) || other.adults == adults)&&(identical(other.children, children) || other.children == children));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,adults,children);

@override
String toString() {
  return 'FlightPassengers(adults: $adults, children: $children)';
}


}

/// @nodoc
abstract mixin class $FlightPassengersCopyWith<$Res>  {
  factory $FlightPassengersCopyWith(FlightPassengers value, $Res Function(FlightPassengers) _then) = _$FlightPassengersCopyWithImpl;
@useResult
$Res call({
 int adults, int children
});




}
/// @nodoc
class _$FlightPassengersCopyWithImpl<$Res>
    implements $FlightPassengersCopyWith<$Res> {
  _$FlightPassengersCopyWithImpl(this._self, this._then);

  final FlightPassengers _self;
  final $Res Function(FlightPassengers) _then;

/// Create a copy of FlightPassengers
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? adults = null,Object? children = null,}) {
  return _then(FlightPassengers(
adults: null == adults ? _self.adults : adults // ignore: cast_nullable_to_non_nullable
as int,children: null == children ? _self.children : children // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [FlightPassengers].
extension FlightPassengersPatterns on FlightPassengers {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FlightPassengers value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FlightPassengers() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FlightPassengers value)  $default,){
final _that = this;
switch (_that) {
case _FlightPassengers():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FlightPassengers value)?  $default,){
final _that = this;
switch (_that) {
case _FlightPassengers() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int adults,  int children)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FlightPassengers() when $default != null:
return $default(_that.adults,_that.children);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int adults,  int children)  $default,) {final _that = this;
switch (_that) {
case _FlightPassengers():
return $default(_that.adults,_that.children);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int adults,  int children)?  $default,) {final _that = this;
switch (_that) {
case _FlightPassengers() when $default != null:
return $default(_that.adults,_that.children);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FlightPassengers extends FlightPassengers {
  const _FlightPassengers({this.adults = 0, this.children = 0}): super._();
  factory _FlightPassengers.fromJson(Map<String, dynamic> json) => _$FlightPassengersFromJson(json);

@override@JsonKey() final  int adults;
@override@JsonKey() final  int children;

/// Create a copy of FlightPassengers
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FlightPassengersCopyWith<_FlightPassengers> get copyWith => __$FlightPassengersCopyWithImpl<_FlightPassengers>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FlightPassengersToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FlightPassengers&&(identical(other.adults, adults) || other.adults == adults)&&(identical(other.children, children) || other.children == children));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,adults,children);

@override
String toString() {
  return 'FlightPassengers(adults: $adults, children: $children)';
}


}

/// @nodoc
abstract mixin class _$FlightPassengersCopyWith<$Res> implements $FlightPassengersCopyWith<$Res> {
  factory _$FlightPassengersCopyWith(_FlightPassengers value, $Res Function(_FlightPassengers) _then) = __$FlightPassengersCopyWithImpl;
@override @useResult
$Res call({
 int adults, int children
});




}
/// @nodoc
class __$FlightPassengersCopyWithImpl<$Res>
    implements _$FlightPassengersCopyWith<$Res> {
  __$FlightPassengersCopyWithImpl(this._self, this._then);

  final _FlightPassengers _self;
  final $Res Function(_FlightPassengers) _then;

/// Create a copy of FlightPassengers
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? adults = null,Object? children = null,}) {
  return _then(_FlightPassengers(
adults: null == adults ? _self.adults : adults // ignore: cast_nullable_to_non_nullable
as int,children: null == children ? _self.children : children // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
