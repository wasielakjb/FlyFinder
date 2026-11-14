import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flyfinder/core/domain/model/nullable_copy.dart';
import 'package:flyfinder/core/domain/request/form_request.dart';
import 'package:flyfinder/templates/form/models/form_cubit_provider.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'form_cubit_state.dart';

abstract class FormCubit extends Cubit<FormCubitState> {
  FormCubit() : super(FormCubitState.inital()) {
    init();
  }

  FormGroup? _formGroup;
  FormGroup get formGroup => _formGroup ?? FormGroup({});

  static C of<C extends FormCubit>(BuildContext context) =>
      FormCubitProvider.of(context).formCubit as C;

  void init() {
    _formGroup = buildForm();
    assert(_formGroup != null, 'Form has not been initialized!');
    emit(state.copyWith(initialized: true));
  }

  @protected
  FormGroup buildForm();

  @protected
  FormRequest mapBeforeSubmit();

  @protected
  Future<dynamic> sendForm(covariant FormRequest request);

  @protected
  Future<void> onRequestSucceed(covariant FormRequest request) async {}

  Future<void> submit() async {}

  void reset() {
    formGroup.reset(value: {});
    emit(state.copyWith(pending: false));
  }
}
