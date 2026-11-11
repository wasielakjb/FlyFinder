// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_flight.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkFlight _$NetworkFlightFromJson(Map<String, dynamic> json) =>
    NetworkFlight(
      origin: json['origin'] as String,
      destination: json['destination'] as String,
      departureDate: json['departure_date'] as String,
      returnDate: json['return_date'] as String?,
      observedAt: json['observed_at'] as String,
      itineraries: (json['itineraries'] as List<dynamic>)
          .map((e) => NetworkItinerary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NetworkFlightToJson(NetworkFlight instance) =>
    <String, dynamic>{
      'origin': instance.origin,
      'destination': instance.destination,
      'departure_date': instance.departureDate,
      'return_date': instance.returnDate,
      'observed_at': instance.observedAt,
      'itineraries': instance.itineraries,
    };
