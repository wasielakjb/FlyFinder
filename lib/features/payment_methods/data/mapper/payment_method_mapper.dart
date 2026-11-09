import 'package:awesome_card/extra/card_type.dart';
import 'package:flyfinder/features/payment_methods/data/network/network_payment_method.dart';
import 'package:flyfinder/features/payment_methods/domain/model/payment_method_resource.dart';

extension NetworkPaymentMethodToEntityMapper on NetworkPaymentMethod {
  PaymentMethodResource asEntity() => PaymentMethodResource(
    id: id,
    number: number,
    name: name,
    type: CardType.values.firstWhere((e) => e.name == type),
    expirationDate: expirationDate.toExpiryDate(),
    isActive: isActive,
  );
}

extension on String {
  DateTime toExpiryDate() {
    final parts = split('/');
    return DateTime(2000 + int.parse(parts[1]), int.parse(parts[0]) + 1, 0);
  }
}
