import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flyfinder/templates/form/cubit/form_cubit.dart';
import 'package:flyfinder/templates/form/models/form_cubit_provider.dart';
import 'package:flyfinder/templates/form/ui/layout/form_bottom_bar.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FormScaffold<C extends FormCubit> extends StatelessWidget {
  const FormScaffold({
    this.title,
    this.slivers = const [],
    this.creatingText,
    this.updatingText,
    super.key,
  });

  final Widget? title;
  final List<Widget> slivers;
  final String? creatingText;
  final String? updatingText;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<C>();
    return FormCubitProvider(
      formCubit: cubit,
      child: BlocListener<C, FormCubitState>(
        listenWhen: (prev, curr) => prev.result == null && curr.result != null,
        listener: (context, state) {},
        // listener: (context, state) => sta
        //     ? _onSuccessResponse(context)
        //     : _onErrorResponse(context, onTryAgain: cubit.submit),
        child: BlocBuilder<C, FormCubitState>(
          builder: (context, state) => Scaffold(
            appBar: AppBar(title: title),
            body: Skeletonizer(
              enabled: !state.initialized,
              child: ReactiveForm(
                canPop: (formGroup) => formGroup.pristine,
                // onPopInvokedWithResult: (_, didPop, _) =>
                //     onPopInvoked(context, didPop),
                formGroup: cubit.formGroup,
                child: CustomScrollView(slivers: slivers),
              ),
            ),
            bottomNavigationBar: FormBottomBar(
              creatingText: creatingText,
              updatingText: creatingText,
            ),
          ),
        ),
      ),
    );
  }
}
