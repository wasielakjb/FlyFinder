// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$FlightRequestToJson(FlightRequest instance) =>
    <String, dynamic>{
      'origin': instance.origin,
      'destination': instance.destination,
      'departure_date': instance.departureDate.toIso8601String(),
      'return_date': ?instance.returnDate?.toIso8601String(),
      'flight_class': _$FlightClassEnumMap[instance.flightClass]!,
      'adults': instance.adults,
      'children': instance.children,
    };

const _$FlightClassEnumMap = {
  FlightClass.economy: 'economy',
  FlightClass.premiumEconomy: 'premium_economy',
  FlightClass.business: 'business',
  FlightClass.first: 'first',
};
