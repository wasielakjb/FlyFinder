import 'package:flyfinder/core/domain/model/json.dart';
import 'package:flyfinder/features/flights/data/network/network_itinerary.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_flight.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class NetworkFlight {
  const NetworkFlight({
    required this.origin,
    required this.destination,
    required this.departureDate,
    required this.returnDate,
    required this.observedAt,
    required this.itineraries,
  });

  factory NetworkFlight.fromJson(Json json) => _$NetworkFlightFromJson(json);

  final String origin;
  final String destination;
  final String departureDate;
  final String? returnDate;
  final String observedAt;
  final List<NetworkItinerary> itineraries;

  Json toJson() => _$NetworkFlightToJson(this);
}
