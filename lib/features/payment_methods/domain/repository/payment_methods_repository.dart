import 'package:flyfinder/features/payment_methods/domain/request/payment_method_request.dart';

abstract interface class PaymentMethodsRepository {
  Future<List<dynamic>> getAll();

  Future<String> create(PaymentMethodRequest request);

  Future<void> update(String id, PaymentMethodRequest request);

  Future<void> delete(String id);
}
