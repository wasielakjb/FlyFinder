import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flyfinder/features/payment_methods/domain/model/payment_method_resource.dart';
import 'package:flyfinder/features/payment_methods/domain/repository/payment_methods_repository.dart';

part 'payment_methods_list_state.dart';

class PaymentMethodsListCubit extends Cubit<PaymentMethodsListState> {
  PaymentMethodsListCubit({required this.repository})
    : super(PaymentMethodsListState.inital()) {
    unawaited(init());
  }

  @protected
  final PaymentMethodsRepository repository;

  Future<void> init() async {
    final response = await repository.getAll();
    emit(state.copyWith(pending: false, items: response));
  }

  Future<void> refresh() async {
    emit(state.copyWith(pending: true));
    final response = await repository.getAll();
    emit(state.copyWith(pending: false, items: response));
  }

  Future<void> delete(String id) async {
    await repository.delete(id);
    final response = await repository.getAll();
    emit(state.copyWith(items: response));
  }
}
