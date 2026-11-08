import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flyfinder/core/domain/model/base_error.dart';
import 'package:flyfinder/core/domain/model/nullable_copy.dart';
import 'package:flyfinder/core/domain/model/result_short.dart';
import 'package:flyfinder/core/domain/request/form_request.dart';
import 'package:flyfinder/extensions/future_to_result_extension.dart';
import 'package:flyfinder/templates/form/models/form_cubit_provider.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'form_cubit_state.dart';

abstract class FormCubit<T extends Object> extends Cubit<FormCubitState<T>> {
  FormCubit({T? resource}) : super(FormCubitState(resource)) {
    init();
  }

  String? get resourceId;
  bool get isCreating => resourceId == null;

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

  Future<void> submit() async {
    formGroup.markAllAsTouched();
    if (formGroup.invalid) return;

     emit(state.asPending());
    try {
      final request = mapBeforeSubmit();
      final response = await sendForm(request).asResult();

      if (response.isSuccess) {
        formGroup
          ..markAsPristine()
          ..markAsUntouched();
        await onRequestSucceed(request);
      }
      emit(state.withResult(response));
    } catch (err) {
      if (err is TypeError && !kDebugMode) {
        final result = ResultError<T>(FormIncorrectRequestMapping());
        emit(state.withResult(result));
        return;
      }
      rethrow;
    }
  }

  void reset() {
    formGroup.reset(value: {});
    emit(state.copyWith(pending: false));
  }
}
