// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_segment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkSegment _$NetworkSegmentFromJson(Map<String, dynamic> json) =>
    NetworkSegment(
      marketingCarrierCode: json['marketing_carrier_code'] as String?,
      flightNumber: json['flight_number'] as String?,
      operatingCarrierName: json['operating_carrier_name'] as String?,
      departureAirport: json['departure_airport'] as String,
      departureTimeLocal: json['departure_time_local'] as String,
      departureTimezone: json['departure_timezone'] as String?,
      departureTimeUtc: json['departure_time_utc'] as String?,
      arrivalAirport: json['arrival_airport'] as String,
      arrivalTimeLocal: json['arrival_time_local'] as String,
      arrivalTimezone: json['arrival_timezone'] as String?,
      arrivalTimeUtc: json['arrival_time_utc'] as String?,
      durationMinutes: (json['duration_minutes'] as num).toInt(),
      aircraft: json['aircraft'] as String?,
    );

Map<String, dynamic> _$NetworkSegmentToJson(NetworkSegment instance) =>
    <String, dynamic>{
      'marketing_carrier_code': instance.marketingCarrierCode,
      'flight_number': instance.flightNumber,
      'operating_carrier_name': instance.operatingCarrierName,
      'departure_airport': instance.departureAirport,
      'departure_time_local': instance.departureTimeLocal,
      'departure_timezone': instance.departureTimezone,
      'departure_time_utc': instance.departureTimeUtc,
      'arrival_airport': instance.arrivalAirport,
      'arrival_time_local': instance.arrivalTimeLocal,
      'arrival_timezone': instance.arrivalTimezone,
      'arrival_time_utc': instance.arrivalTimeUtc,
      'duration_minutes': instance.durationMinutes,
      'aircraft': instance.aircraft,
    };
