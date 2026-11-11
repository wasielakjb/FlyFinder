import 'package:flyfinder/core/domain/model/json.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_price.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class NetworkPrice {
  const NetworkPrice({
    required this.amount,
    required this.currency,
    required this.status,
  });

  factory NetworkPrice.fromJson(Json json) => _$NetworkPriceFromJson(json);

  final int amount;
  final String currency;
  final String status;

  Json toJson() => _$NetworkPriceToJson(this);
}
