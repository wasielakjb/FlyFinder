// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$FlightRequestToJson(FlightRequest instance) =>
    <String, dynamic>{
      'origin': instance.origin,
      'destination': instance.destination,
      'departure_date': instance.departureDate,
      'return_date': ?instance.returnDate,
      'cabin_class': _$CabinClassEnumMap[instance.cabinClass]!,
      'adults': instance.adults,
      'children': instance.children,
    };

const _$CabinClassEnumMap = {
  CabinClass.economy: 'economy',
  CabinClass.premiumEconomy: 'premium_economy',
  CabinClass.business: 'business',
  CabinClass.first: 'first',
};
