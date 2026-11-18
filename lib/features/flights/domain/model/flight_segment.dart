import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

@immutable
class FlightSegment extends Equatable {
  const FlightSegment({
    required this.flightNumber,
    required this.operatingCarrierName,
    required this.departureAirport,
    required this.departureDateTime,
    required this.arrivalAirport,
    required this.arrivalDateTime,
    required this.duration,
    required this.aircraft,
  });

  final String? flightNumber;
  final String? operatingCarrierName;
  final String departureAirport;
  final DateTime departureDateTime;
  final String arrivalAirport;
  final DateTime arrivalDateTime;
  final Duration duration;
  final String? aircraft;

  @override
  List<Object?> get props => [
    flightNumber,
    operatingCarrierName,
    departureAirport,
    arrivalAirport,
    duration,
    aircraft,
  ];
}
