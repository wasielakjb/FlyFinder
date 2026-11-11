import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class AirportResource extends Equatable {
  const AirportResource({
    required this.code,
    required this.name,
    required this.city,
    required this.country,
  });

  final String code;
  final String name;
  final String city;
  final String country;

  @override
  List<Object?> get props => [
    code,
    name,
    city,
    country,
  ];
}
