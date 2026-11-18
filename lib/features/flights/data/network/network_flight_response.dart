import 'package:flyfinder/core/domain/model/json.dart';
import 'package:flyfinder/features/flights/data/network/network_itinerary.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_flight_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
class NetworkFlightResponse {
  NetworkFlightResponse({
    required this.origin,
    required this.destination,
    required this.departureDate,
    required this.returnDate,
    required this.itineraries,
    required this.observedAt,
  });

  factory NetworkFlightResponse.fromJson(Json json) =>
      _$NetworkFlightResponseFromJson(json);

  final String origin;
  final String destination;
  final String departureDate;
  final String? returnDate;
  final List<NetworkItinerary> itineraries;
  final String observedAt;
}
