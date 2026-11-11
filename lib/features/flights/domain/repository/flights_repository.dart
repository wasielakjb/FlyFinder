import 'package:flyfinder/core/domain/request/form_request.dart';
import 'package:flyfinder/features/flights/domain/model/airport_resource.dart';
import 'package:flyfinder/features/flights/domain/model/flight_resource.dart';

abstract interface class FlightsRepository {
  Future<List<AirportResource>> getAirports(
    String query,
  );

  Future<FlightResource> getOneWayFlights(
    covariant FormRequest data,
  );

  Future<FlightResource> getRoundTripFlights(
    covariant FormRequest data,
  );
}
