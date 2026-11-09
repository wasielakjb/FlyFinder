import 'package:flyfinder/core/domain/model/json.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_payment_method.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class NetworkPaymentMethod {
  const NetworkPaymentMethod({
    required this.id,
    required this.number,
    required this.name,
    required this.type,
    required this.expirationDate,
    required this.isActive,
  });

  factory NetworkPaymentMethod.fromJson(Json json) =>
      _$NetworkPaymentMethodFromJson(json);

  final String id;
  final String number;
  final String name;
  final String type;
  final String expirationDate;
  final bool isActive;

  Json toJson() => _$NetworkPaymentMethodToJson(this);
}
