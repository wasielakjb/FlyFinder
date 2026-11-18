import 'package:flyfinder/features/flights/data/network/network_price.dart';
import 'package:flyfinder/features/flights/domain/model/flight_price.dart';

extension NetworkPriceToEntityMapper on NetworkPrice {
  FlightPrice asEntity() => FlightPrice(
    amount: amount,
    currency: currency,
    status: status,
  );
}
