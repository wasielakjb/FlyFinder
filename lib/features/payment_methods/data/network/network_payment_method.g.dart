// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_payment_method.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkPaymentMethod _$NetworkPaymentMethodFromJson(
  Map<String, dynamic> json,
) => NetworkPaymentMethod(
  id: json['id'] as String,
  number: json['number'] as String,
  name: json['name'] as String,
  type: json['type'] as String,
  expirationDate: json['expiration_date'] as String,
  isActive: json['is_active'] as bool,
);

Map<String, dynamic> _$NetworkPaymentMethodToJson(
  NetworkPaymentMethod instance,
) => <String, dynamic>{
  'id': instance.id,
  'number': instance.number,
  'name': instance.name,
  'type': instance.type,
  'expiration_date': instance.expirationDate,
  'is_active': instance.isActive,
};
