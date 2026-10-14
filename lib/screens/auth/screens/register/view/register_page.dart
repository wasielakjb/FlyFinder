import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flyfinder/extensions/color_scheme_getters_extension.dart';
import 'package:flyfinder/extensions/text_style_getters_extension.dart';
import 'package:flyfinder/screens/auth/screens/register/cubit/register_cubit.dart';
import 'package:flyfinder/screens/auth/screens/register/form_builders/register_form_keys.dart';
import 'package:flyfinder/templates/form/form_text_field.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

typedef _K = RegisterKeys;

@RoutePage()
class RegisterPage extends StatelessWidget implements AutoRouteWrapper {
  const RegisterPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => RegisterCubit(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RegisterCubit>();
    return BlocBuilder<RegisterCubit, RegisterState>(
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
                          onPressed: cubit.submit,
                          child: const Text('Sign up'),
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
    );
  }
}
