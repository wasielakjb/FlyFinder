import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flyfinder/core/domain/model/json.dart';
import 'package:flyfinder/core/http/di/di.dart';
import 'package:flyfinder/features/flights/data/network/network_airport.dart';
import 'package:flyfinder/features/flights/data/network/network_flight_response.dart';
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

  Future<NetworkFlightResponse> oneWayFlightSearch(Json data) async {
    return httpClient
        .post<Json>('/fares/one-way', data: data)
        .then((res) => NetworkFlightResponse.fromJson(res.data!));
  }

  Future<NetworkFlightResponse> roundTripFlightSearch(Json data) {
    return httpClient
        .post<Json>('/fares/round-trip', data: data)
        .then((res) => NetworkFlightResponse.fromJson(res.data!));
  }
}
