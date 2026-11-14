import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flyfinder/extensions/color_scheme_getters_extension.dart';
import 'package:flyfinder/extensions/text_style_getters_extension.dart';
import 'package:flyfinder/templates/layout/error_text.dart';

typedef PickerValueTransformer<T> = String Function(T value);

class SystemPickerField<T> extends StatefulWidget {
  const SystemPickerField({
    required this.value,
    required this.placeholder,
    required this.errorText,
    required this.showPicker,
    required this.onChanged,
    required this.valuePresenter,
    this.suffixIcon,
    this.focusNode,
    this.canRequestFocus = true,
    this.onFocusChange,
    super.key,
  });

  final T? value;
  final String placeholder;
  final String? errorText;
  final Widget? suffixIcon;
  final FutureOr<T?> Function(T?) showPicker;
  final void Function(T?) onChanged;
  final PickerValueTransformer<T> valuePresenter;
  final FocusNode? focusNode;
  final bool canRequestFocus;
  final void Function(bool, FocusNode)? onFocusChange;

  @override
  State<SystemPickerField<T>> createState() => _SystemPickerFieldState<T>();
}

class _SystemPickerFieldState<T> extends State<SystemPickerField<T>> {
  late final FocusNode focusNode = widget.focusNode ?? FocusNode();
  bool get hasError => widget.errorText != null;
  bool isPickeActive = false;

  @override
  void dispose() {
    if (widget.focusNode == null) {
      focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: focusNode,
      canRequestFocus: widget.canRequestFocus,
      skipTraversal: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Material(
            color: context.surfaceContainer,
            borderRadius: BorderRadius.circular(12),
            child: InkWell(
              onTap: () async {
                setState(() => isPickeActive = true);
                try {
                  final result = await widget.showPicker.call(widget.value);
                  widget.onChanged(result);
                } finally {
                  setState(() => isPickeActive = false);
                }
              },
              borderRadius: BorderRadius.circular(12),
              child: InputDecorator(
                isEmpty: widget.value == null,
                isFocused: focusNode.hasFocus || isPickeActive,
                decoration: InputDecoration(
                  filled: false,
                  hintText: widget.placeholder,
                  suffixIcon: widget.suffixIcon,
                  enabledBorder: hasError
                      ? OutlineInputBorder(
                          borderSide: BorderSide(
                            color: context.error,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        )
                      : null,
                ),
                child: widget.value != null
                    ? Text(
                        widget.valuePresenter(widget.value as T),
                        style: context.bodyLarge.copyWith(
                          fontSize: 16,
                        ),
                        overflow: TextOverflow.ellipsis,
                      )
                    : null,
              ),
            ),
          ),
          if (hasError && widget.errorText!.isNotEmpty)
            ErrorText(
              widget.errorText!,
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 0),
            ),
        ],
      ),
    );
  }
}
