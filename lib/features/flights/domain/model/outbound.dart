import 'package:equatable/equatable.dart';
import 'package:flyfinder/features/flights/domain/model/segment.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

@immutable
class Outbound extends Equatable {
  const Outbound({
    required this.carrier,
    required this.duration,
    required this.segments,
  });

  final String carrier;
  final Duration duration;
  final List<Segment> segments;

  @override
  List<Object?> get props => [
    carrier,
    duration,
    segments,
  ];
}
