import 'package:flyfinder/core/domain/model/json.dart';
import 'package:flyfinder/core/domain/request/form_request.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_method_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, createFactory: false)
class PaymentMethodRequest implements FormRequest {
  const PaymentMethodRequest({
    required this.number,
    required this.name,
    required this.type,
    required this.expirationDate,
    required this.isActive,
  });

  final String number;
  final String name;
  final String type;
  final String expirationDate;
  final bool isActive;

  @override
  Json toJson() => _$PaymentMethodRequestToJson(this);
}
