import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flyfinder/screens/auth/screens/register/form_builders/register_fg_factory.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterState.inital()) {
    init();
  }

  FormGroup? _formGroup;
  FormGroup get formGroup => _formGroup ?? FormGroup({});

  void init() {
    _formGroup = RegisterFormGroupFactory.create();
    assert(_formGroup != null, 'Form has not been initialized!');
    emit(state.copyWith(initialized: true));
  }

  Future<void> submit() async {}
}
