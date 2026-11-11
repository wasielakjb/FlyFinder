import 'package:flyfinder/extensions/kotlin_extensions.dart';
import 'package:flyfinder/features/flights/data/mapper/itinerary_mapper.dart';
import 'package:flyfinder/features/flights/data/network/network_flight.dart';
import 'package:flyfinder/features/flights/domain/model/flight_resource.dart';

extension NetworkFlightToEntityMapper on NetworkFlight {
  FlightResource asEntity() => FlightResource(
    origin: origin,
    destination: destination,
    departureDate: DateTime.parse(departureDate),
    returnDate: returnDate.let(DateTime.parse),
    observedAt: DateTime.parse(observedAt),
    itineraries: itineraries.map((e) => e.asEntity()).toList(),
  );
}
