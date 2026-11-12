import 'package:flyfinder/core/domain/model/json.dart';
import 'package:flyfinder/core/domain/request/form_request.dart';
import 'package:flyfinder/features/flights/domain/enum/cabin_class.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'flight_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, createFactory: false)
class FlightRequest implements FormRequest {
  FlightRequest({
    required this.origin,
    required this.destination,
    required this.departureDate,
    required this.returnDate,
    required this.cabinClass,
    required this.adults,
    required this.children,
  });

  final String origin;
  final String destination;
  final String departureDate;
  @JsonKey(includeIfNull: false)
  final String? returnDate;
  final CabinClass cabinClass;
  final int adults;
  final int children;

  @override
  Json toJson() => _$FlightRequestToJson(this);
}
