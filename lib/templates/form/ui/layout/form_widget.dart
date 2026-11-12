import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flyfinder/templates/form/cubit/form_cubit.dart';
import 'package:flyfinder/templates/form/models/form_cubit_provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FormWidget<C extends FormCubit> extends StatelessWidget {
  const FormWidget({
    required this.children,
    super.key,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<C>();
    return FormCubitProvider(
      formCubit: cubit,
      child: BlocBuilder<C, FormCubitState>(
        builder: (context, state) => Skeletonizer(
          enabled: !state.initialized,
          child: ReactiveForm(
            formGroup: cubit.formGroup,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children,
            ),
          ),
        ),
      ),
    );
  }
}
