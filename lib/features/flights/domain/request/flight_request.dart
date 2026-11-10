import 'package:flyfinder/core/domain/model/json.dart';
import 'package:flyfinder/core/domain/request/form_request.dart';
import 'package:flyfinder/features/flights/domain/model/flight_passengers.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'flight_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, createFactory: false)
class FlightRequest implements FormRequest {
  const FlightRequest({
    required this.travelType,
    required this.from,
    required this.to,
    required this.departureDate,
    required this.returnDate,
    required this.passengers,
    required this.travelClass,
  });

  final int travelType;
  final String from;
  final String to;
  final DateTime departureDate;
  final DateTime? returnDate;
  final FlightPassengers passengers;
  final int travelClass;

  @override
  Json toJson() => _$FlightRequestToJson(this);
}
