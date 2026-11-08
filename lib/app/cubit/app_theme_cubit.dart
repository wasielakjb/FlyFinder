import 'package:flutter/material.dart';
import 'package:flyfinder/core/domain/model/json.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class AppThemeCubit extends HydratedCubit<ThemeMode> {
  AppThemeCubit() : super(ThemeMode.system);

  void update(ThemeMode theme) => emit(theme);

  @override
  ThemeMode? fromJson(Json json) {
    return json['themeMode'] != null
        ? ThemeMode.values[json['themeMode'] as int]
        : null;
  }

  @override
  Json? toJson(ThemeMode state) {
    return {'theme': state.index};
  }
}
