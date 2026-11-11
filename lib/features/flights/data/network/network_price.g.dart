// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_price.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkPrice _$NetworkPriceFromJson(Map<String, dynamic> json) => NetworkPrice(
  amount: (json['amount'] as num).toInt(),
  currency: json['currency'] as String,
  status: json['status'] as String,
);

Map<String, dynamic> _$NetworkPriceToJson(NetworkPrice instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'currency': instance.currency,
      'status': instance.status,
    };
