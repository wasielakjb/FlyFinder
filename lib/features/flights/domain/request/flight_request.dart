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

  @JsonKey(toJson: _airportToJson)
  final NetworkAirport origin;
  @JsonKey(toJson: _airportToJson)
  final NetworkAirport destination;
  @JsonKey(toJson: _dateToJson)
  final DateTime departureDate;
  @JsonKey(includeIfNull: false, toJson: _dateToJson)
  final DateTime? returnDate;
  @JsonKey(name: 'cabin_class')
  final FlightClass flightClass;
  final int adults;
  final int children;

  static String _airportToJson(NetworkAirport airport) => airport.code;

  static String? _dateToJson(DateTime? date) =>
      date?.toIso8601String().split('T').first;

  @override
  Json toJson() => _$FlightRequestToJson(this);
}
