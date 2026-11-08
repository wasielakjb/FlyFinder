part of 'form_cubit.dart';

class FormCubitState<T> extends Equatable {
  factory FormCubitState(T? resource) => FormCubitState._(
    initialized: false,
    pending: false,
    result: null,
    resource: resource,
  );

  const FormCubitState._({
    required this.initialized,
    required this.pending,
    required this.result,
    required this.resource,
  });

  final bool initialized;
  final bool pending;
  final Result<dynamic>? result;
  final T? resource;

  FormCubitState<T> copyWith({
    bool? initialized,
    bool? pending,
    NullableCopy<Result<dynamic>>? result,
    T? resource,
  }) {
    return FormCubitState._(
      initialized: initialized ?? this.initialized,
      pending: pending ?? this.pending,
      result: result.apply(this.result),
      resource: resource ?? this.resource,
    );
  }

  FormCubitState<T> asPending() => copyWith(
    pending: true,
    result: () => null,
  );

  FormCubitState<T> withResult(Result<dynamic> response) => copyWith(
    pending: false,
    result: () => response,
  );

  @override
  List<Object?> get props => [
    initialized,
    pending,
    result,
    resource,
  ];
}
