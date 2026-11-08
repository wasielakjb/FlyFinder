import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flyfinder/features/auth/auth_repository_impl.dart';
import 'package:flyfinder/features/payment_methods/domain/repository/payment_methods_repository.dart';
import 'package:flyfinder/features/payment_methods/domain/request/payment_method_request.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: PaymentMethodsRepository)
class PaymentMethodsRepositoryImpl implements PaymentMethodsRepository {
  const PaymentMethodsRepositoryImpl(this.firestore, this.authRepository);

  final FirebaseFirestore firestore;
  final AuthRepository authRepository;

  @override
  Future<String> create(PaymentMethodRequest request) {
    return firestore
        .collection('users')
        .doc(authRepository.userId)
        .collection('payment_methods')
        .add(request.toJson())
        .then((res) => res.id);
  }

  @override
  Future<void> delete(String id) {
    throw UnimplementedError();
  }

  @override
  Future<List<dynamic>> getAll() {
    throw UnimplementedError();
  }

  @override
  Future<void> update(String id, PaymentMethodRequest request) {
    throw UnimplementedError();
  }
}
