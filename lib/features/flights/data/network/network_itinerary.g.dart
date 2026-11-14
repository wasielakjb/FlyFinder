// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_itinerary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkItinerary _$NetworkItineraryFromJson(Map<String, dynamic> json) =>
    NetworkItinerary(
      ignavId: json['ignav_id'] as String,
      price: NetworkPrice.fromJson(json['price'] as Map<String, dynamic>),
      outbound: NetworkOutbound.fromJson(
        json['outbound'] as Map<String, dynamic>,
      ),
      flightClass: $enumDecode(_$FlightClassEnumMap, json['flight_class']),
      hasMixedCarriers: json['has_mixed_carriers'] as bool,
    );

Map<String, dynamic> _$NetworkItineraryToJson(NetworkItinerary instance) =>
    <String, dynamic>{
      'ignav_id': instance.ignavId,
      'price': instance.price,
      'outbound': instance.outbound,
      'flight_class': _$FlightClassEnumMap[instance.flightClass]!,
      'has_mixed_carriers': instance.hasMixedCarriers,
    };

const _$FlightClassEnumMap = {
  FlightClass.economy: 'economy',
  FlightClass.premiumEconomy: 'premium_economy',
  FlightClass.business: 'business',
  FlightClass.first: 'first',
};
