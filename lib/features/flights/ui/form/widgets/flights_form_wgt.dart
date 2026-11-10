import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flyfinder/features/flights/ui/form/cubit/flights_form_cubit.dart';
import 'package:flyfinder/templates/form/cubit/form_cubit.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FlightsFormWidget extends StatelessWidget {
  const FlightsFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FlightsFormCubit(),
      child: BlocBuilder<FlightsFormCubit, FormCubitState<String>>(
        builder: (context, state) {
          final cubit = context.read<FlightsFormCubit>();
          return ReactiveForm(
            formGroup: cubit.formGroup,
            child: const Column(),
          );
        },
      ),
    );
  }
}
