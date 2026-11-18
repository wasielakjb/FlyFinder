// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$FlightRequestToJson(FlightRequest instance) =>
    <String, dynamic>{
      'origin': FlightRequest._airportToJson(instance.origin),
      'destination': FlightRequest._airportToJson(instance.destination),
      'departure_date': FlightRequest._dateToJson(instance.departureDate),
      'return_date': ?FlightRequest._dateToJson(instance.returnDate),
      'cabin_class': _$FlightClassEnumMap[instance.flightClass]!,
      'adults': instance.adults,
      'children': instance.children,
    };

const _$FlightClassEnumMap = {
  FlightClass.economy: 'economy',
  FlightClass.premiumEconomy: 'premium_economy',
  FlightClass.business: 'business',
  FlightClass.first: 'first',
};
