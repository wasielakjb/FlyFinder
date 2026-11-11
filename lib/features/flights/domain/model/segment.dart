import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

@immutable
class Segment extends Equatable {
  const Segment({
    required this.flightNumber,
    required this.operatingCarrierName,
    required this.departureAirport,
    required this.departureTimeLocal,
    required this.departureTimezone,
    required this.departureTimeUtc,
    required this.arrivalAirport,
    required this.arrivalTimeLocal,
    required this.arrivalTimezone,
    required this.arrivalTimeUtc,
    required this.duration,
    required this.aircraft,
  });

  final String? flightNumber;
  final String? operatingCarrierName;
  final String departureAirport;
  final DateTime departureTimeLocal;
  final String? departureTimezone;
  final DateTime? departureTimeUtc;
  final String arrivalAirport;
  final DateTime arrivalTimeLocal;
  final String? arrivalTimezone;
  final DateTime? arrivalTimeUtc;
  final Duration duration;
  final String? aircraft;

  @override
  List<Object?> get props => [
    flightNumber,
    operatingCarrierName,
    departureAirport,
    departureTimeLocal,
    departureTimezone,
    departureTimeUtc,
    arrivalAirport,
    arrivalTimeLocal,
    arrivalTimezone,
    arrivalTimeUtc,
    duration,
    aircraft,
  ];
}
