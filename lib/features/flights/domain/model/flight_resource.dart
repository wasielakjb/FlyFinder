import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flyfinder/features/flights/domain/enum/flight_class.dart';
import 'package:flyfinder/features/flights/domain/model/flight_price.dart';
import 'package:flyfinder/features/flights/domain/model/flight_segment.dart';

@immutable
class FlightResource extends Equatable {
  const FlightResource({
    required this.id,
    required this.price,
    required this.carrier,
    required this.duration,
    required this.flightClass,
    required this.segments,
  });

  final String id;
  final FlightPrice price;
  final String carrier;
  final Duration duration;
  final List<FlightSegment> segments;
  final FlightClass flightClass;

  @override
  List<Object?> get props => [
    id,
    price,
    carrier,
    duration,
    segments,
    flightClass,
  ];
}
