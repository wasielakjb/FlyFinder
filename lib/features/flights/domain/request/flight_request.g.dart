// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$FlightRequestToJson(FlightRequest instance) =>
    <String, dynamic>{
      'travel_type': instance.travelType,
      'from': instance.from,
      'to': instance.to,
      'departure_date': instance.departureDate.toIso8601String(),
      'return_date': instance.returnDate?.toIso8601String(),
      'passengers': instance.passengers,
      'travel_class': instance.travelClass,
    };
