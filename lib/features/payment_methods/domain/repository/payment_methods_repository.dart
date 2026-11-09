import 'package:flyfinder/features/payment_methods/domain/model/payment_method_resource.dart';
import 'package:flyfinder/features/payment_methods/domain/request/payment_method_request.dart';

abstract interface class PaymentMethodsRepository {
  Future<List<PaymentMethodResource>> getAll();

  Future<String> create(PaymentMethodRequest request);

  Future<void> update(String id, PaymentMethodRequest request);

  Future<PaymentMethodResource> get(String id);

  Future<void> delete(String id);
}
