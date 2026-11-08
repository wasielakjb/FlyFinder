import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

typedef SuffixBuilderCallback<T> =
    Widget Function(BuildContext context, AbstractControl<T> control);
