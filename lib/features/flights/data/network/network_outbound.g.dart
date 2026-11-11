// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_outbound.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkOutbound _$NetworkOutboundFromJson(Map<String, dynamic> json) =>
    NetworkOutbound(
      carrier: json['carrier'] as String,
      durationMinutes: (json['duration_minutes'] as num).toInt(),
      segments: (json['segments'] as List<dynamic>)
          .map((e) => NetworkSegment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NetworkOutboundToJson(NetworkOutbound instance) =>
    <String, dynamic>{
      'carrier': instance.carrier,
      'duration_minutes': instance.durationMinutes,
      'segments': instance.segments,
    };
