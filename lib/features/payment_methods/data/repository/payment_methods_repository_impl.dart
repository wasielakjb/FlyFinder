import 'package:flutter/foundation.dart';
import 'package:flyfinder/features/payment_methods/data/data_source/payment_methods_remote_ds.dart';
import 'package:flyfinder/features/payment_methods/data/mapper/payment_method_mapper.dart';
import 'package:flyfinder/features/payment_methods/domain/model/payment_method_resource.dart';
import 'package:flyfinder/features/payment_methods/domain/repository/payment_methods_repository.dart';
import 'package:flyfinder/features/payment_methods/domain/request/payment_method_request.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: PaymentMethodsRepository)
class PaymentMethodsRepositoryImpl implements PaymentMethodsRepository {
  const PaymentMethodsRepositoryImpl(this.remoteDS);

  @protected
  final PaymentMethodsRemoteDataSource remoteDS;

  @override
  Future<List<PaymentMethodResource>> getAll() async {
    return remoteDS.getAll().then(
      (res) => res.map((e) => e.asEntity()).toList(),
    );
  }

  @override
  Future<String> create(PaymentMethodRequest request) {
    return remoteDS.create(request.toJson());
  }

  @override
  Future<void> update(String id, PaymentMethodRequest request) {
    return remoteDS.update(id, request.toJson());
  }

  @override
  Future<PaymentMethodResource> get(String id) async {
    return remoteDS.get(id).then((res) => res.asEntity());
  }

  @override
  Future<void> delete(String id) {
    return remoteDS.delete(id);
  }
}
