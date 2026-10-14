import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flyfinder/app/router/app_router.gr.dart';
import 'package:flyfinder/extensions/color_scheme_getters_extension.dart';
import 'package:flyfinder/extensions/text_style_getters_extension.dart';
import 'package:flyfinder/screens/auth/screens/login/cubit/login_cubit.dart';
import 'package:flyfinder/screens/auth/screens/login/form_builders/login_form_keys.dart';
import 'package:flyfinder/templates/form/form_text_field.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

typedef _K = LoginKeys;

@RoutePage()
class LoginPage extends StatelessWidget implements AutoRouteWrapper {
  const LoginPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    return BlocBuilder<LoginCubit, LoginState>(
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
                        ),
                        FormTextField<String>(
                          formControlName: _K.password,
                          placeholder: 'Password',
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                        ),
                        Text(
                          'Forgot password?',
                          style: context.labelLarge.copyWith(
                            color: context.primary,
                          ),
                          textAlign: TextAlign.end,
                        ),
                        FilledButton(
                          onPressed: cubit.submit,
                          child: const Text('Log in'),
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
    );
  }
}
