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
  first;

  String resolveLabel() => switch (this) {
    economy => 'Economy',
    premiumEconomy => 'Premium economy',
    business => 'Business',
    first => 'First',
  };
}
