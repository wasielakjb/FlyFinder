import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flyfinder/app/cubit/app_theme_cubit.dart';

@RoutePage()
class ThemeModePage extends StatelessWidget {
  const ThemeModePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<AppThemeCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme mode'),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: ThemeMode.values.length,
          itemBuilder: (context, index) {
            final item = ThemeMode.values[index];
            final isSelected = item == cubit.state;
            return ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 8,
              ),
              onTap: () => cubit.update(item),
              selected: isSelected,
              title: Text(item.label()),
              trailing: Icon(
                isSelected ? Icons.check_circle_rounded : Icons.circle_outlined,
              ),
            );
          },
        ),
      ),
    );
  }
}

extension on ThemeMode {
  String label() => switch (this) {
    ThemeMode.system => 'System',
    ThemeMode.light => 'Light',
    ThemeMode.dark => 'Dark',
  };
}
