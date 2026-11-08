import 'package:flutter/material.dart';
import 'package:flyfinder/templates/form/cubit/form_cubit.dart';

class FormCubitProvider extends InheritedWidget {
  const FormCubitProvider({
    required this.formCubit,
    required super.child,
    super.key,
  });

  final FormCubit formCubit;

  static FormCubitProvider of(BuildContext context) {
    final result = context
        .dependOnInheritedWidgetOfExactType<FormCubitProvider>();
    assert(result != null, 'FormCubitProvider not found');
    return result!;
  }

  @override
  bool updateShouldNotify(FormCubitProvider oldWidget) {
    return formCubit != oldWidget.formCubit;
  }
}
