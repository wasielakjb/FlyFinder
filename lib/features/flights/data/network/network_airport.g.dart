// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_airport.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkAirport _$NetworkAirportFromJson(Map<String, dynamic> json) =>
    NetworkAirport(
      code: json['code'] as String,
      name: json['name'] as String,
      city: json['city'] as String,
      country: json['country'] as String,
    );

Map<String, dynamic> _$NetworkAirportToJson(NetworkAirport instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'city': instance.city,
      'country': instance.country,
    };
