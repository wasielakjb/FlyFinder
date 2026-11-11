import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flyfinder/features/flights/domain/model/itinerary.dart';

@immutable
class FlightResource extends Equatable {
  const FlightResource({
    required this.origin,
    required this.destination,
    required this.departureDate,
    required this.returnDate,
    required this.observedAt,
    required this.itineraries,
  });

  final String origin;
  final String destination;
  final DateTime departureDate;
  final DateTime? returnDate;
  final DateTime observedAt;
  final List<Itinerary> itineraries;

  @override
  List<Object?> get props => [
    origin,
    destination,
    departureDate,
    returnDate,
    observedAt,
    itineraries,
  ];
}
