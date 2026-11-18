// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_flight_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkFlightResponse _$NetworkFlightResponseFromJson(
  Map<String, dynamic> json,
) => NetworkFlightResponse(
  origin: json['origin'] as String,
  destination: json['destination'] as String,
  departureDate: json['departure_date'] as String,
  returnDate: json['return_date'] as String?,
  itineraries: (json['itineraries'] as List<dynamic>)
      .map((e) => NetworkItinerary.fromJson(e as Map<String, dynamic>))
      .toList(),
  observedAt: json['observed_at'] as String,
);
