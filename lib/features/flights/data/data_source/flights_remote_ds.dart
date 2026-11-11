import 'package:dio/dio.dart';
import 'package:flyfinder/core/domain/model/json.dart';
import 'package:flyfinder/core/http/di/di.dart';
import 'package:flyfinder/features/flights/data/network/network_airport.dart';
import 'package:flyfinder/features/flights/data/network/network_flight.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

@singleton
class FlightsRemoteDataSource {
  const FlightsRemoteDataSource({
    @Named(IgnavHttpClient) required this.httpClient,
  });

  @protected
  final Dio httpClient;

  Future<List<NetworkAirport>> airportSearch(String query) async {
    return httpClient
        .get<List<dynamic>>('/airports', queryParameters: {'q': query})
        .then(
          (response) => response.data!
              .map((json) => NetworkAirport.fromJson(json as Json))
              .toList(),
        );
  }

  Future<NetworkFlight> oneWayFlightSearch(Json data) {
    return httpClient
        .post<Json>('/fares/one-way', data: data)
        .then((res) => NetworkFlight.fromJson(res.data!));
  }

  Future<NetworkFlight> roundTripFlightSearch(Json data) {
    return httpClient
        .post<Json>('/fares/round-trip', data: data)
        .then((res) => NetworkFlight.fromJson(res.data!));
  }
}
