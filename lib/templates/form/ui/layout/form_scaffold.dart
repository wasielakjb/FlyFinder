import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flyfinder/core/domain/model/result_short.dart';
import 'package:flyfinder/extensions/color_scheme_getters_extension.dart';
import 'package:flyfinder/templates/form/cubit/form_cubit.dart';
import 'package:flyfinder/templates/form/models/form_cubit_provider.dart';
import 'package:flyfinder/templates/form/ui/layout/form_bottom_bar.dart';
import 'package:flyfinder/templates/layout/any_button_content.dart';
import 'package:flyfinder/templates/layout/dialog/models/response_dialog_type.dart';
import 'package:flyfinder/templates/layout/dialog/response_dialog.dart';
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

  Future<void> onPopInvoked(BuildContext context, bool didPop) async {
    if (didPop) return;

    final result = await showDialog<bool>(
      context: context,
      builder: (context) => ResponseDialog(
        type: ResponseDialogType.Warning,
        message: 'Are you sure about this action?',
        content: Row(
          spacing: 20,
          children: [
            Expanded(
              child: FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: context.surfaceContainer,
                  foregroundColor: context.outline,
                ),
                onPressed: () => context.maybePop(false),
                child: const AnyButtonContent(text: 'Cancel'),
              ),
            ),
            Expanded(
              child: FilledButton(
                style: FilledButton.styleFrom(backgroundColor: Colors.orange),
                onPressed: () => context.maybePop(true),
                child: const AnyButtonContent(text: 'Confirm'),
              ),
            ),
          ],
        ),
      ),
    );
    if (!context.mounted || !(result ?? false)) return;
    FormCubit.of(context).reset();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await context.maybePop(ResultSuccess(null));
    });
  }

  Future<void> _onSuccessResponse(BuildContext context) async {
    await showDialog<void>(
      context: context,
      builder: (context) => ResponseDialog(
        type: ResponseDialogType.Success,
        message: 'Action is done successfully!',
        content: FilledButton(
          style: FilledButton.styleFrom(backgroundColor: Colors.green),
          onPressed: context.maybePop,
          child: const AnyButtonContent(text: 'Confirm'),
        ),
      ),
    );
    if (!context.mounted) return;
    FormCubit.of(context).reset();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await context.maybePop(ResultSuccess(null));
    });
  }

  Future<void> _onErrorResponse(
    BuildContext context, {
    required VoidCallback onTryAgain,
  }) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => ResponseDialog(
        type: ResponseDialogType.Error,
        message: 'Action is done successfully!',
        content: Row(
          spacing: 20,
          children: [
            Expanded(
              child: FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: context.surfaceContainer,
                  foregroundColor: context.outline,
                ),
                onPressed: () => context.maybePop(false),
                child: const AnyButtonContent(text: 'Cancel'),
              ),
            ),
            Expanded(
              child: FilledButton(
                style: FilledButton.styleFrom(backgroundColor: context.error),
                onPressed: () => context.maybePop(true),
                child: const AnyButtonContent(text: 'Try again'),
              ),
            ),
          ],
        ),
      ),
    );

    if (!context.mounted) return;
    if (result ?? false) {
      onTryAgain();
      return;
    }
    FormCubit.of(context).reset();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await context.maybePop();
    });
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<C>();
    return FormCubitProvider(
      formCubit: cubit,
      child: BlocListener<C, FormCubitState<Object>>(
        listenWhen: (prev, curr) => prev.result == null && curr.result != null,
        listener: (context, state) => state.result!.isSuccess
            ? _onSuccessResponse(context)
            : _onErrorResponse(context, onTryAgain: cubit.submit),
        child: BlocBuilder<C, FormCubitState<Object>>(
          builder: (context, state) => Scaffold(
            appBar: AppBar(title: title),
            body: Skeletonizer(
              enabled: !state.initialized,
              child: ReactiveForm(
                canPop: (formGroup) => formGroup.pristine,
                onPopInvokedWithResult: (_, didPop, _) =>
                    onPopInvoked(context, didPop),
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
