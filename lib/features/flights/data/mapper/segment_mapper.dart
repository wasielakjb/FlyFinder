import 'package:flyfinder/extensions/kotlin_extensions.dart';
import 'package:flyfinder/features/flights/data/network/network_segment.dart';
import 'package:flyfinder/features/flights/domain/model/segment.dart';

extension NetworkSegmentToEntityMapper on NetworkSegment {
  Segment asEntity() => Segment(
    flightNumber: flightNumber,
    operatingCarrierName: operatingCarrierName,
    departureAirport: departureAirport,
    departureTimeLocal: DateTime.parse(departureTimeLocal),
    departureTimezone: departureTimezone,
    departureTimeUtc: departureTimeUtc.let(DateTime.parse),
    arrivalAirport: arrivalAirport,
    arrivalTimeLocal: DateTime.parse(arrivalTimeLocal),
    arrivalTimezone: arrivalTimezone,
    arrivalTimeUtc: arrivalTimeUtc.let(DateTime.parse),
    duration: Duration(minutes: durationMinutes),
    aircraft: aircraft,
  );
}
