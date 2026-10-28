import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flyfinder/app/router/app_router.gr.dart';
import 'package:flyfinder/di.dart';
import 'package:flyfinder/extensions/color_scheme_getters_extension.dart';
import 'package:flyfinder/extensions/text_style_getters_extension.dart';
import 'package:flyfinder/features/auth/auth_repository_impl.dart';
import 'package:flyfinder/screens/auth/screens/register/cubit/register_cubit.dart';
import 'package:flyfinder/screens/auth/screens/register/form_builders/register_form_keys.dart';
import 'package:flyfinder/templates/form/form_text_field.dart';
import 'package:flyfinder/templates/layout/any_button_content.dart';
import 'package:flyfinder/templates/layout/dialog/models/response_dialog_type.dart';
import 'package:flyfinder/templates/layout/dialog/response_dialog.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

typedef _K = RegisterKeys;

@RoutePage()
class RegisterPage extends StatelessWidget implements AutoRouteWrapper {
  const RegisterPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => RegisterCubit(
        repository: inject(),
      ),
      child: this,
    );
  }

  Future<void> _onErrorDialog(
    BuildContext context,
    RegisterState state,
  ) async { 
    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (_) => ResponseDialog(
        type: ResponseDialogType.Error,
        title: 'Failed',
        message: (state.status as ErrorRegisterStatus).message!,
        content: [
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: context.error,
            ),
            onPressed: context.maybePop,
            child: const AnyButtonContent(text: 'Go Back'),
          ),
        ],
      ),
    );
    FocusManager.instance.primaryFocus?.unfocus();
  }

  Future<void> _onSucceedDialog(
    BuildContext context,
    RegisterState state,
  ) async {
    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (_) => ResponseDialog(
        type: ResponseDialogType.Success,
        title: 'Successful!',
        message: 'Your account has been created successfully.',
        content: [
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Colors.green,
            ),
            onPressed: context.maybePop,
            child: const AnyButtonContent(text: 'Continue'),
          ),
        ],
      ),
    );
    inject<AuthRepository>().isRegistrationPending = false;
    if (!context.mounted) return;
    await context.router.replaceAll([const HomeRoute()]);
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RegisterCubit>();
    return MultiBlocListener(
      listeners: [
        BlocListener<RegisterCubit, RegisterState>(
          listenWhen: (_, current) => current.status is ErrorRegisterStatus,
          listener: _onErrorDialog,
        ),
        BlocListener<RegisterCubit, RegisterState>(
          listenWhen: (_, current) => current.status is SuccessRegisterStatus,
          listener: _onSucceedDialog,
        ),
      ],
      child: BlocBuilder<RegisterCubit, RegisterState>(
        builder: (context, state) => Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Skeletonizer(
                enabled: !state.initialized,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: context.headlineLarge,
                        children: [
                          const TextSpan(text: 'Fly'),
                          TextSpan(
                            text: 'Finder',
                            style: TextStyle(color: context.primary),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'Sign up',
                      style: context.headlineLarge,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),
                    ReactiveForm(
                      formGroup: cubit.formGroup,
                      child: Column(
                        spacing: 20,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          FormTextField<String>(
                            formControlName: _K.email,
                            placeholder: 'Email',
                            keyboardType: TextInputType.emailAddress,
                          ),
                          FormTextField<String>(
                            formControlName: _K.password,
                            placeholder: 'Password',
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                          ),
                          FormTextField<String>(
                            formControlName: _K.confirmPassword,
                            placeholder: 'Confirm password',
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                          ),
                          FilledButton(
                            onPressed: state.pending ? null : cubit.submit,
                            child: AnyButtonContent(
                              text: 'Sign in',
                              fullWidth: true,
                              pending: state.pending,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(flex: 2),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: context.titleMedium,
                        children: [
                          const TextSpan(text: 'Have an account? '),
                          TextSpan(
                            text: 'Log in',
                            style: TextStyle(color: context.primary),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {
                                cubit.formGroup.reset();
                                await context.maybePop();
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
