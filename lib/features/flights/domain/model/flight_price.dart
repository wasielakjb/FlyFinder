import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

@immutable
class FlightPrice extends Equatable {
  const FlightPrice({
    required this.amount,
    required this.currency,
    required this.status,
  });

  final int amount;
  final String currency;
  final String status;

  String get label => NumberFormat.simpleCurrency(
    name: currency,
  ).format(amount);

  @override
  List<Object?> get props => [
    amount,
    currency,
    status,
  ];
}
