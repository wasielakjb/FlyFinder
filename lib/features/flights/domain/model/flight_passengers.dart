import 'package:flyfinder/core/domain/model/json.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'flight_passengers.freezed.dart';
part 'flight_passengers.g.dart';

@freezed
abstract class FlightPassengers with _$FlightPassengers {
  const factory FlightPassengers({
    @Default(0) int adults,
    @Default(0) int children,
  }) = _FlightPassengers;

  const FlightPassengers._();

  factory FlightPassengers.fromJson(Json json) =>
      _$FlightPassengersFromJson(json);
}
