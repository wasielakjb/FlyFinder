import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flyfinder/extensions/text_style_getters_extension.dart';
import 'package:flyfinder/features/flights/domain/model/airport_resource.dart';
import 'package:flyfinder/templates/form/models/validation_msg_map.dart';
import 'package:flyfinder/templates/form/ui/widgets/airport_location_selector/widget/airport_location_search_wgt.dart';
import 'package:flyfinder/templates/layout/sliver_wrapper.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FormAirportLocationSelector extends StatelessWidget {
  FormAirportLocationSelector({
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
        child: ReactiveFormField<AirportResource, AirportResource>(
          formControlName: formControlName,
          validationMessages: validationMessages,
          builder: (field) => InkWell(
            onTap: () => context.router.pushWidget(
              AirportLocationSearchWidget(
                onChanged: field.didChange,
              ),
            ),
            child: InputDecorator(
              isEmpty: field.value == null,
              decoration: InputDecoration(
                hintText: placeholder,
                errorMaxLines: 2,
                errorText: field.errorText,
              ),
              child: field.value != null
                  ? Text(
                      field.value!.code,
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
