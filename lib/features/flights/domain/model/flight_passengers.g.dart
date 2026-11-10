// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight_passengers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FlightPassengers _$FlightPassengersFromJson(Map<String, dynamic> json) =>
    _FlightPassengers(
      adults: (json['adults'] as num?)?.toInt() ?? 0,
      children: (json['children'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$FlightPassengersToJson(_FlightPassengers instance) =>
    <String, dynamic>{'adults': instance.adults, 'children': instance.children};
