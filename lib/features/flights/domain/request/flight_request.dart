import 'package:flyfinder/core/domain/model/json.dart';
import 'package:flyfinder/core/domain/request/form_request.dart';
import 'package:flyfinder/features/flights/data/network/network_airport.dart';
import 'package:flyfinder/features/flights/domain/enum/flight_class.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'flight_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, createFactory: false)
class FlightRequest implements FormRequest {
  FlightRequest({
    required this.origin,
    required this.destination,
    required this.departureDate,
    required this.returnDate,
    required this.flightClass,
    required this.adults,
    required this.children,
  });

  final NetworkAirport origin;
  final NetworkAirport destination;
  final DateTime departureDate;
  @JsonKey(includeIfNull: false)
  final DateTime? returnDate;
  final FlightClass flightClass;
  final int adults;
  final int children;

  @override
  Json toJson() => _$FlightRequestToJson(this);
}
