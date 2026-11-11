import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
class Price extends Equatable {
  const Price({
    required this.amount,
    required this.currency,
    required this.status,
  });

  final int amount;
  final String currency;
  final String status;

  @override
  List<Object?> get props => [
    amount,
    currency,
    status,
  ];
}
