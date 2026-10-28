part of 'register_cubit.dart';

class RegisterState extends Equatable {
  const RegisterState._({
    required this.status,
    required this.initialized,
  });

  factory RegisterState.inital() {
    return RegisterState._(
      status: InitialRegisterStatus(),
      initialized: false,
    );
  }

  final RegisterStatus status;
  final bool initialized;

  RegisterState copyWith({
    RegisterStatus? status,
    bool? initialized,
  }) {
    return RegisterState._(
      status: status ?? this.status,
      initialized: initialized ?? this.initialized,
    );
  }

  bool get pending => status is PendingRegisterStatus;

  @override
  List<Object?> get props => [
    status,
    initialized,
  ];
}

sealed class RegisterStatus extends Equatable {
  const RegisterStatus();

  @override
  List<Object?> get props => [];
}

class InitialRegisterStatus extends RegisterStatus {}

class PendingRegisterStatus extends RegisterStatus {}

class SuccessRegisterStatus extends RegisterStatus {}

class ErrorRegisterStatus extends RegisterStatus {
  const ErrorRegisterStatus({required this.message});

  final String? message;

  @override
  List<Object?> get props => [message];
}
