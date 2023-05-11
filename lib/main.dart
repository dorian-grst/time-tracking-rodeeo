import 'package:apprentissage/src/components/bottomNavBar.dart';
import 'package:apprentissage/src/components/floatingAddTaskButton.dart';
import 'package:apprentissage/src/themes/rodeeo_theme.dart';
import 'package:apprentissage/src/utils/extensions/build_context_ext.dart';
import 'package:apprentissage/src/components/tag.dart';
import 'package:apprentissage/src/components/homeSection.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  debugRepaintRainbowEnabled = true;
  runApp(const MyApp());
}

extension AccessContext on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tracker hours',
      theme: RodeoTheme.extendedTheme(context.theme),
      home: const TimeTrackerHomePage(),
    );
  }
}

class TimeTrackerHomePage extends StatelessWidget {
  const TimeTrackerHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final tabIndexNotifier = ValueNotifier<int>(0);

    return Scaffold(
      backgroundColor: const Color.fromRGBO(251, 250, 255, 5),
      body: ValueListenableBuilder<int>(
          valueListenable: tabIndexNotifier,
          builder: (context, selectedIndex, child) {
            if (selectedIndex == 0) {
              return const HomeSection();
            } else {
              return const SizedBox.shrink();
            }
          }),
      bottomNavigationBar: ValueListenableBuilder<int>(
          valueListenable: tabIndexNotifier,
          builder: (context, selectedIndex, child) {
            return BottomNavBar(
              selectedIndex: selectedIndex,
              onItemTapped: (index) => tabIndexNotifier.value = index,
            );
          }),
      floatingActionButton: FloatingAddTaskButton(tabIndex: tabIndexNotifier),
    );
  }
}
