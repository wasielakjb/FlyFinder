import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class PaymentMethodResource extends Equatable {
  const PaymentMethodResource({
    required this.id,
    required this.number,
    required this.name,
    required this.type,
    required this.expirationDate,
    required this.isActive,
  });

  final int id;
  final String number;
  final String name;
  final String type;
  final String expirationDate;
  final bool isActive;

  @override
  List<Object?> get props => [
    id,
    number,
    name,
    type,
    expirationDate,
    isActive,
  ];
}
