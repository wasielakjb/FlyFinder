import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flyfinder/core/domain/model/json.dart';
import 'package:flyfinder/features/auth/auth_repository_impl.dart';
import 'package:flyfinder/features/payment_methods/data/network/network_payment_method.dart';
import 'package:injectable/injectable.dart';

@singleton
class PaymentMethodsRemoteDataSource {
  const PaymentMethodsRemoteDataSource(this.firestore, this.authRepository);

  @protected
  final FirebaseFirestore firestore;

  @protected
  final AuthRepository authRepository;

  @protected
  CollectionReference<Json> get baseCollection => firestore
      .collection('users')
      .doc(authRepository.userId)
      .collection('payment_methods');

  Future<List<NetworkPaymentMethod>> getAll() async {
    return baseCollection.get().then(
      (snapshot) => snapshot.docs
          .map((e) => NetworkPaymentMethod.fromJson({'id': e.id, ...e.data()}))
          .toList(),
    );
  }

  Future<String> create(Json payload) async {
    return baseCollection.add(payload).then((snapshot) => snapshot.id);
  }

  Future<void> update(String id, Json payload) async {
    return baseCollection.doc(id).update(payload);
  }

  Future<NetworkPaymentMethod> get(String id) async {
    return baseCollection
        .doc(id)
        .get()
        .then(
          (snapshot) => NetworkPaymentMethod.fromJson({
            'id': snapshot.id,
            ...snapshot.data()!,
          }),
        );
  }

  Future<void> delete(String id) async {
    return baseCollection.doc(id).delete();
  }
}
