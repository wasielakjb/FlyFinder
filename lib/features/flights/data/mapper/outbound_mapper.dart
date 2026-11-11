import 'package:flyfinder/features/flights/data/mapper/segment_mapper.dart';
import 'package:flyfinder/features/flights/data/network/network_outbound.dart';
import 'package:flyfinder/features/flights/domain/model/outbound.dart';

extension NetworkOutboundToEntityMapper on NetworkOutbound {
  Outbound asEntity() => Outbound(
    carrier: carrier,
    duration: Duration(minutes: durationMinutes),
    segments: segments.map((e) => e.asEntity()).toList(),
  );
}
