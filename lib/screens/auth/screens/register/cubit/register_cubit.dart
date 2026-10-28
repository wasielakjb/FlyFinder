import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flyfinder/extensions/reactive_form_extension.dart';
import 'package:flyfinder/features/auth/auth_repository_impl.dart';
import 'package:flyfinder/screens/auth/screens/register/form_builders/register_fg_factory.dart';
import 'package:flyfinder/screens/auth/screens/register/form_builders/register_form_keys.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'register_state.dart';

typedef _K = RegisterKeys;

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({
    required this.repository,
  }) : super(RegisterState.inital()) {
    init();
  }

  final AuthRepository repository;

  FormGroup? _formGroup;
  FormGroup get formGroup => _formGroup ?? FormGroup({});

  void init() {
    _formGroup = RegisterFormGroupFactory.create();
    assert(_formGroup != null, 'Form has not been initialized!');
    emit(state.copyWith(initialized: true));
  }

  Future<void> submit() async {
    formGroup.markAllAsTouched();
    if (formGroup.invalid) return;
    emit(state.copyWith(status: PendingRegisterStatus()));
    try {
      await repository.register(
        email: formGroup.controlVal<String>(_K.email)!,
        password: formGroup.controlVal<String>(_K.password)!,
      );
      formGroup
        ..markAsPristine()
        ..markAsUntouched();
      emit(state.copyWith(status: SuccessRegisterStatus()));
    } on FirebaseAuthException catch (e) {
      emit(state.copyWith(status: ErrorRegisterStatus(message: e.message)));
    }
  }
}
