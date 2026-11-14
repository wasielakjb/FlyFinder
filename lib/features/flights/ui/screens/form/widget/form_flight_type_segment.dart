import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';
import 'package:flyfinder/extensions/color_scheme_getters_extension.dart';
import 'package:flyfinder/extensions/text_style_getters_extension.dart';
import 'package:flyfinder/features/flights/domain/enum/flight_type.dart';
import 'package:flyfinder/templates/form/models/validation_msg_map.dart';
import 'package:flyfinder/templates/layout/sliver_wrapper.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FormFlightTypeSegment extends StatelessWidget {
  FormFlightTypeSegment({
    required this.formControlName,
    this.validationMessages,
    this.wrapToSliver = false,
  }) : super(key: ValueKey(formControlName));

  final String formControlName;
  final ValidationMsgMap? validationMessages;
  final bool wrapToSliver;

  @override
  Widget build(BuildContext context) {
    return SliverWrapper(
      wrapToSliver: wrapToSliver,
      child: Skeleton.unite(
        child: ReactiveFormField<FlightType, FlightType>(
          formControlName: formControlName,
          validationMessages: validationMessages,
          builder: (field) => CustomSlidingSegmentedControl<FlightType>(
            initialValue: field.value,
            onValueChanged: (value) => field.didChange(value),
            children: {
              for (final type in FlightType.values)
                type: Text(
                  type.resolveLabel(),
                  style: context.labelLarge.copyWith(
                    color: type != field.value ? context.outline : null,
                  ),
                ),
            },
            isStretch: true,
            padding: 4,
            innerPadding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              color: context.surfaceContainer,
            ),
            thumbDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: context.surface,
            ),
            customSegmentSettings: CustomSegmentSettings(
              overlayColor: const WidgetStatePropertyAll(Colors.transparent),
            ),
          ),
        ),
      ),
    );
  }
}
