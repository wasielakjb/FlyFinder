import 'package:freezed_annotation/freezed_annotation.dart';

@JsonEnum(valueField: 'value')
enum TravelClass {
  economy(1),
  premiumEconomy(2),
  business(3),
  first(4);

  const TravelClass(this.value);
  final int value;
}
