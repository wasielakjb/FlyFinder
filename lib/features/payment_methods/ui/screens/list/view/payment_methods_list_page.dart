import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flyfinder/app/router/app_router.gr.dart';
import 'package:flyfinder/core/domain/misc/app_mocks.dart';
import 'package:flyfinder/di.dart';
import 'package:flyfinder/extensions/color_scheme_getters_extension.dart';
import 'package:flyfinder/features/payment_methods/ui/screens/list/cubit/payment_methods_list_cubit.dart';
import 'package:flyfinder/features/payment_methods/ui/screens/list/widgets/payment_method_list_tile_wgt.dart';
import 'package:skeletonizer/skeletonizer.dart';

@RoutePage()
class PaymentMethodsListPage extends StatelessWidget
    implements AutoRouteWrapper {
  const PaymentMethodsListPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => PaymentMethodsListCubit(
        repository: inject(),
      ),
      lazy: false,
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<PaymentMethodsListCubit>();
    return Scaffold(
      appBar: AppBar(title: const Text('Payment methods')),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await context.pushRoute(PaymentMethodFormRoute());
          await cubit.refresh();
        },
        child: Icon(Icons.add, color: context.surface),
      ),
      body: BlocBuilder<PaymentMethodsListCubit, PaymentMethodsListState>(
        builder: (context, state) => RefreshIndicator(
          onRefresh: cubit.refresh,
          child: SafeArea(
            child: Skeletonizer(
              enabled: state.pending,
              child: ListView.separated(
                itemCount: state.items?.length ?? 5,
                itemBuilder: (context, index) => PaymentMethodListTileWidget(
                  state.items?[index] ?? AppMocks.paymentMethod,
                  onEdit: (item) async {
                    final result = await context.pushRoute<bool>(
                      PaymentMethodFormRoute(resource: item),
                    );
                    if (result ?? false) unawaited(cubit.refresh());
                  },
                  onDelete: (item) => cubit.delete(item.id),
                ),
                separatorBuilder: (_, _) =>
                    const Divider(indent: 20, endIndent: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
