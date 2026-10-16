import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flyfinder/extensions/reactive_form_extension.dart';
import 'package:flyfinder/features/auth/auth_repository_impl.dart';
import 'package:flyfinder/screens/auth/screens/login/form_builders/login_fg_factory.dart';
import 'package:flyfinder/screens/auth/screens/login/form_builders/login_form_keys.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'login_state.dart';

typedef _K = LoginKeys;

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({
    required this.repository,
  }) : super(LoginState.inital()) {
    init();
  }

  final AuthRepository repository;

  FormGroup? _formGroup;
  FormGroup get formGroup => _formGroup ?? FormGroup({});

  void init() {
    _formGroup = LoginFormGroupFactory.create();
    assert(_formGroup != null, 'Form has not been initialized!');
    emit(state.copyWith(initialized: true));
  }

  Future<void> submit() async {
    formGroup.markAllAsTouched();
    if (formGroup.invalid) return;
    emit(state.copyWith(status: PendingLoginStatus()));
    try {
      await repository.login(
        email: formGroup.controlVal<String>(_K.email)!,
        password: formGroup.controlVal<String>(_K.password)!,
      );
      formGroup
        ..markAsPristine()
        ..markAsUntouched();
      emit(state.copyWith(status: SuccessLoginStatus()));
    } on Exception catch (err) {
      emit(state.copyWith(status: ErrorLoginStatus(exception: err)));
    }
  }
}
