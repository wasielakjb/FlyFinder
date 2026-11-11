import 'package:freezed_annotation/freezed_annotation.dart';

@JsonEnum()
enum CabinClass {
  @JsonValue('economy')
  economy,
  @JsonValue('premium_economy')
  premiumEconomy,
  @JsonValue('business')
  business,
  @JsonValue('first')
  first,
}
