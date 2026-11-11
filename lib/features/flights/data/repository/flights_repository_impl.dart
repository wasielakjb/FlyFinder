import 'package:flutter/cupertino.dart';
import 'package:flyfinder/features/flights/data/data_source/flights_remote_ds.dart';
import 'package:flyfinder/features/flights/data/mapper/airport_mapper.dart';
import 'package:flyfinder/features/flights/data/mapper/flight_mapper.dart';
import 'package:flyfinder/features/flights/domain/model/airport_resource.dart';
import 'package:flyfinder/features/flights/domain/model/flight_resource.dart';
import 'package:flyfinder/features/flights/domain/repository/flights_repository.dart';
import 'package:flyfinder/features/flights/domain/request/flight_request.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: FlightsRepository)
class FlightsRepositoryImpl implements FlightsRepository {
  const FlightsRepositoryImpl({required this.remoteDS});

  @protected
  final FlightsRemoteDataSource remoteDS;

  @override
  Future<List<AirportResource>> getAirports(String query) {
    return remoteDS
        .airportSearch(query)
        .then((res) => res.map((e) => e.asEntity()).toList());
  }

  @override
  Future<FlightResource> getOneWayFlights(FlightRequest request) {
    return remoteDS
        .oneWayFlightSearch(request.toJson())
        .then((res) => res.asEntity());
  }

  @override
  Future<FlightResource> getRoundTripFlights(FlightRequest request) {
    return remoteDS
        .roundTripFlightSearch(request.toJson())
        .then((res) => res.asEntity());
  }
}
