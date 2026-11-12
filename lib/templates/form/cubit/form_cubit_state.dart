part of 'form_cubit.dart';

class FormCubitState extends Equatable {
  const FormCubitState._({
    required this.initialized,
    required this.pending,
    required this.result,
  });

  factory FormCubitState.inital() => const FormCubitState._(
    initialized: false,
    pending: false,
    result: null,
  );

  final bool initialized;
  final bool pending;
  final dynamic result;

  FormCubitState copyWith({
    bool? initialized,
    bool? pending,
    NullableCopy<dynamic>? result,
  }) {
    return FormCubitState._(
      initialized: initialized ?? this.initialized,
      pending: pending ?? this.pending,
      result: result.apply(this.result),
    );
  }

  FormCubitState asPending() => copyWith(
    pending: true,
    result: () => null,
  );

  FormCubitState withResult(dynamic response) => copyWith(
    pending: false,
    result: () => response,
  );

  @override
  List<Object?> get props => [
    initialized,
    pending,
    result,
  ];
}
