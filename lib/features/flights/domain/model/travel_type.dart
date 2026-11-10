import 'package:freezed_annotation/freezed_annotation.dart';

@JsonEnum(valueField: 'value')
enum TravelType {
  oneWay(1),
  roundTrip(2);

  const TravelType(this.value);
  final int value;
}
