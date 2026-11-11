import 'package:flyfinder/core/domain/model/json.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_segment.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class NetworkSegment {
  const NetworkSegment({
    required this.marketingCarrierCode,
    required this.flightNumber,
    required this.operatingCarrierName,
    required this.departureAirport,
    required this.departureTimeLocal,
    required this.departureTimezone,
    required this.departureTimeUtc,
    required this.arrivalAirport,
    required this.arrivalTimeLocal,
    required this.arrivalTimezone,
    required this.arrivalTimeUtc,
    required this.durationMinutes,
    required this.aircraft,
  });

  factory NetworkSegment.fromJson(Json json) => _$NetworkSegmentFromJson(json);

  final String? marketingCarrierCode;
  final String? flightNumber;
  final String? operatingCarrierName;
  final String departureAirport;
  final String departureTimeLocal;
  final String? departureTimezone;
  final String? departureTimeUtc;
  final String arrivalAirport;
  final String arrivalTimeLocal;
  final String? arrivalTimezone;
  final String? arrivalTimeUtc;
  final int durationMinutes;
  final String? aircraft;

  Json toJson() => _$NetworkSegmentToJson(this);
}
