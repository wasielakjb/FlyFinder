import 'package:flutter/material.dart';
import 'package:flyfinder/templates/layout/bottom_navigation_bar/app_navigation_bar.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    this.body,
    this.appBar,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.bottomSheet,
    super.key,
  });

  final Widget? body;
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final Widget? bottomSheet;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
      bottomSheet: bottomSheet,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            if (body != null)
              Positioned.fill(
                child: body!,
              ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: AppNavigationBar(),
            ),
          ],
        ),
      ),
    );
  }
}
