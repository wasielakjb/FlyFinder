import 'package:flyfinder/features/flights/data/network/network_price.dart';
import 'package:flyfinder/features/flights/domain/model/price.dart';

extension NetworkPriceToEntityMapper on NetworkPrice {
  Price asEntity() => Price(
    amount: amount,
    currency: currency,
    status: status,
  );
}
