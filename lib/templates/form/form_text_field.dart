import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flyfinder/extensions/reactive_form_extension.dart';
import 'package:flyfinder/extensions/text_style_getters_extension.dart';
import 'package:flyfinder/templates/form/models/validation_msg_map.dart';
import 'package:flyfinder/templates/layout/sliver_wrapper.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FormTextField<T> extends StatefulWidget {
  FormTextField({
    required this.formControlName,
    required this.placeholder,
    this.validationMessages,
    this.keyboardType,
    this.textCapitalization,
    this.inputFormatters,
    this.maxLines,
    this.obscureText = false,
    this.wrapToSliver = false,
  }) : super(key: ValueKey(formControlName));

  final String formControlName;
  final String placeholder;
  final ValidationMsgMap? validationMessages;
  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final bool obscureText;
  final bool wrapToSliver;

  @override
  State<FormTextField<T>> createState() => _FormTextFieldState<T>();
}

class _FormTextFieldState<T> extends State<FormTextField<T>> {
  bool _hidePassword = true;
  bool get isPasswordField =>
      widget.keyboardType == TextInputType.visiblePassword;

  @override
  Widget build(BuildContext context) {
    return SliverWrapper(
      wrapToSliver: widget.wrapToSliver,
      child: Skeleton.unite(
        child: ReactiveTextField<T>(
          formControlName: widget.formControlName,
          validationMessages: widget.validationMessages,
          keyboardType: widget.keyboardType ?? TextInputType.text,
          textCapitalization:
              widget.textCapitalization ?? TextCapitalization.none,
          inputFormatters: widget.inputFormatters ?? [],
          maxLines: widget.maxLines ?? 1,
          obscureText: widget.obscureText && _hidePassword,
          style: context.bodyLarge.copyWith(fontSize: 16),
          onTapOutside: (_) => FocusScope.of(context).unfocus(),
          decoration: InputDecoration(
            hintText: widget.placeholder,
            errorMaxLines: 2,
            suffixIcon: ReactiveValueListenableBuilder<T>(
              formControlName: widget.formControlName,
              builder: (context, control, child) {
                final hasValue = control.value is String
                    ? (control.value! as String).isNotEmpty
                    : control.value != null;

                if (!hasValue) return const SizedBox.shrink();
                return IconButton(
                  onPressed: isPasswordField
                      ? () => setState(() => _hidePassword = !_hidePassword)
                      : control.resetNoticeably,
                  icon: Icon(
                    isPasswordField
                        ? _hidePassword
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined
                        : Icons.close_rounded,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
