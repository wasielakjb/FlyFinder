import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flyfinder/app/router/app_router.gr.dart';
import 'package:flyfinder/di.dart';
import 'package:flyfinder/extensions/color_scheme_getters_extension.dart';
import 'package:flyfinder/extensions/text_style_getters_extension.dart';
import 'package:flyfinder/screens/auth/screens/login/cubit/login_cubit.dart';
import 'package:flyfinder/screens/auth/screens/login/form_builders/login_form_keys.dart';
import 'package:flyfinder/templates/form/ui/widgets/form_text_field.dart';
import 'package:flyfinder/templates/layout/any_button_content.dart';
import 'package:flyfinder/templates/layout/dialog/models/response_dialog_type.dart';
import 'package:flyfinder/templates/layout/dialog/response_dialog.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

typedef _K = LoginKeys;

@RoutePage()
class LoginPage extends StatelessWidget implements AutoRouteWrapper {
  const LoginPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(repository: inject()),
      child: this,
    );
  }

  Future<void> _onErrorDialog(
    BuildContext context,
    LoginState state,
    VoidCallback onTryAgain,
  ) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => ResponseDialog(
        type: ResponseDialogType.Error,
        message: (state.status as ErrorLoginStatus).message!,
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
    FocusManager.instance.primaryFocus?.unfocus();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await context.maybePop();
    });
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) => current.status is ErrorLoginStatus,
      listener: (context, state) =>
          _onErrorDialog(context, state, cubit.submit),
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) => Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Skeletonizer(
                enabled: !state.initialized,
                child: Column(
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
                      'Log in',
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
                            wrapToSliver: false,
                          ),
                          FormTextField<String>(
                            formControlName: _K.password,
                            placeholder: 'Password',
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                            wrapToSliver: false,
                          ),
                          Text(
                            'Forgot password?',
                            style: context.labelLarge.copyWith(
                              color: context.primary,
                            ),
                            textAlign: TextAlign.end,
                          ),
                          FilledButton(
                            onPressed: state.pending ? null : cubit.submit,
                            child: AnyButtonContent(
                              text: 'Log in',
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
                          const TextSpan(text: 'Dont’t have an account? '),
                          TextSpan(
                            text: 'Sign Up',
                            style: TextStyle(color: context.primary),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {
                                cubit.formGroup.reset();
                                await context.pushRoute(const RegisterRoute());
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
