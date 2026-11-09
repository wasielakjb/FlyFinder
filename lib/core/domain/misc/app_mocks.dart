import 'package:awesome_card/extra/card_type.dart';
import 'package:flyfinder/features/payment_methods/domain/model/payment_method_resource.dart';
import 'package:skeletonizer/skeletonizer.dart';

abstract class AppMocks {
  static PaymentMethodResource get paymentMethod => PaymentMethodResource(
    id: '0',
    number: BoneMock.name,
    name: BoneMock.name,
    type: CardType.masterCard,
    expirationDate: DateTime.now(),
    isActive: false,
  );
}
