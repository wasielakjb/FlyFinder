import 'package:flyfinder/features/flights/data/network/network_segment.dart';
import 'package:flyfinder/features/flights/domain/model/flight_segment.dart';

extension NetworkSegmentToEntityMapper on NetworkSegment {
  FlightSegment asEntity() => FlightSegment(
    flightNumber: flightNumber,
    operatingCarrierName: operatingCarrierName,
    departureAirport: departureAirport,
    departureDateTime: DateTime.parse(departureTimeLocal),
    arrivalAirport: arrivalAirport,
    arrivalDateTime: DateTime.parse(arrivalTimeLocal),
    duration: Duration(minutes: durationMinutes),
    aircraft: aircraft,
  );
}
