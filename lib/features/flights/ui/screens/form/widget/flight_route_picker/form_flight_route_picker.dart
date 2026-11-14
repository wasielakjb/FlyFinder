import 'package:flutter/material.dart';
import 'package:flyfinder/features/flights/domain/model/airport_resource.dart';
import 'package:flyfinder/features/flights/ui/screens/form/widget/flight_route_picker/widget/flight_route_bottom_sheet.dart';
import 'package:flyfinder/templates/form/models/validation_msg_map.dart';
import 'package:flyfinder/templates/layout/sliver_wrapper.dart';
import 'package:flyfinder/templates/layout/system_picker_field.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FormFlightRoutePicker extends StatelessWidget {
  FormFlightRoutePicker({
    required this.formControlName,
    required this.placeholder,
    this.validationMessages,
    this.wrapToSliver = false,
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
          builder: (field) => SystemPickerField<AirportResource>(
            value: field.value,
            placeholder: placeholder,
            errorText: field.errorText,
            showPicker: (value) => FlightRouteBottomSheet.show(context),
            onChanged: field.didChange,
            valuePresenter: (value) => value.code,
          ),
        ),
      ),
    );
  }
}
