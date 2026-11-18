import 'package:flyfinder/features/flights/data/mapper/price_mapper.dart';
import 'package:flyfinder/features/flights/data/mapper/segment_mapper.dart';
import 'package:flyfinder/features/flights/data/network/network_itinerary.dart';
import 'package:flyfinder/features/flights/domain/model/flight_resource.dart';

extension NetworkItineraryToEntityMapper on NetworkItinerary {
  FlightResource asFlightResource() => FlightResource(
    id: ignavId,
    price: price.asEntity(),
    carrier: outbound.carrier,
    duration: Duration(minutes: outbound.durationMinutes),
    flightClass: cabinClass,
    segments: outbound.segments.map((e) => e.asEntity()).toList(),
  );
}
