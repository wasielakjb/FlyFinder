import 'package:flutter/material.dart';
import 'package:flyfinder/extensions/text_style_getters_extension.dart';
import 'package:flyfinder/features/flights/domain/enum/cabin_class.dart';
import 'package:flyfinder/templates/form/models/validation_msg_map.dart';
import 'package:flyfinder/templates/form/ui/widgets/cabin_class_picker/widget/cabin_class_picker_bottom_sheet.dart';
import 'package:flyfinder/templates/layout/sliver_wrapper.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FormCabinClassPicker extends StatelessWidget {
  FormCabinClassPicker({
    required this.formControlName,
    required this.placeholder,
    this.validationMessages,
    this.wrapToSliver = true,
  }) : super(key: ValueKey(formControlName));

  final String formControlName;
  final String placeholder;
  final ValidationMsgMap? validationMessages;
  final bool wrapToSliver;

  @override
  Widget build(BuildContext context) {
    return SliverWrapper(
      wrapToSliver: wrapToSliver,
      child: Skeleton.unite(
        child: ReactiveFormField<CabinClass, CabinClass>(
          formControlName: formControlName,
          validationMessages: validationMessages,
          builder: (field) => InkWell(
            onTap: () async {
              final res = await CabinClassPickerBottomSheet.show(
                context,
                value: field.value,
              );
              if (res == null) return;
              field.didChange(res);
            },
            child: InputDecorator(
              isEmpty: field.value == null,
              decoration: InputDecoration(
                hintText: placeholder,
                errorMaxLines: 2,
                errorText: field.errorText,
              ),
              child: field.value != null
                  ? Text(
                      field.value!.resolveLabel(),
                      style: context.bodyLarge.copyWith(fontSize: 16),
                    )
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}
