import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flyfinder/extensions/color_scheme_getters_extension.dart';
import 'package:flyfinder/templates/form/cubit/form_cubit.dart';
import 'package:flyfinder/templates/layout/any_button_content.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FormBottomBar extends StatelessWidget {
  const FormBottomBar({
    this.creatingText,
    this.updatingText,
    super.key,
  });

  final String? creatingText;
  final String? updatingText;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormCubit, FormCubitState>(
      bloc: FormCubit.of(context),
      builder: (context, state) => Skeleton.keep(
        child: ColoredBox(
          color: context.surfaceContainer,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
              child: FilledButton(
                onPressed: state.pending ? null : FormCubit.of(context).submit,
                child: AnyButtonContent(
                  text: 'Create',
                  pending: state.pending,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
