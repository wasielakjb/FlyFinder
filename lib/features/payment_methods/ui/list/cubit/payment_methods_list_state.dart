part of 'payment_methods_list_cubit.dart';

class PaymentMethodsListState extends Equatable {
  const PaymentMethodsListState({
    required this.pending,
    required this.items,
  });

  factory PaymentMethodsListState.inital() {
    return const PaymentMethodsListState(
      pending: true,
      items: null,
    );
  }

  final bool pending;
  final List<PaymentMethodResource>? items;

  PaymentMethodsListState copyWith({
    bool? pending,
    List<PaymentMethodResource>? items,
  }) {
    return PaymentMethodsListState(
      pending: pending ?? this.pending,
      items: items ?? this.items,
    );
  }

  @override
  List<Object?> get props => [
    pending,
    items,
  ];
}
