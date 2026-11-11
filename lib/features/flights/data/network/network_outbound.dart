import 'package:flyfinder/core/domain/model/json.dart';
import 'package:flyfinder/features/flights/data/network/network_segment.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_outbound.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class NetworkOutbound {
  const NetworkOutbound({
    required this.carrier,
    required this.durationMinutes,
    required this.segments,
  });

  factory NetworkOutbound.fromJson(Json json) =>
      _$NetworkOutboundFromJson(json);

  final String carrier;
  final int durationMinutes;
  final List<NetworkSegment> segments;

  Json toJson() => _$NetworkOutboundToJson(this);
}
