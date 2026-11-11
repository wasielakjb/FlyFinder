import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flyfinder/features/flights/domain/enum/cabin_class.dart';
import 'package:flyfinder/features/flights/domain/model/outbound.dart';
import 'package:flyfinder/features/flights/domain/model/price.dart';

@immutable
class Itinerary extends Equatable {
  const Itinerary({
    required this.id,
    required this.price,
    required this.outbound,
    required this.cabinClass,
    required this.hasMixedCarriers,
  });

  final String id;
  final Price price;
  final Outbound outbound;
  final CabinClass cabinClass;
  final bool hasMixedCarriers;

  @override
  List<Object?> get props => [
    id,
    price,
    outbound,
    cabinClass,
    hasMixedCarriers,
  ];
}
