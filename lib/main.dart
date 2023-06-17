import 'package:apprentissage/src/components/time_tracker_homepage.dart';
import 'package:apprentissage/src/components/windhair.dart';
import 'package:apprentissage/src/hive/boxes.dart';
import 'package:apprentissage/src/hive/tag.dart';
import 'package:apprentissage/src/hive/tag_type.dart';
import 'package:apprentissage/src/hive/task.dart';
import 'package:apprentissage/src/hive/task_state.dart';
import 'package:apprentissage/src/themes/rodeeo_theme.dart';
import 'package:apprentissage/src/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  //debugRepaintRainbowEnabled = true;
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  Hive.registerAdapter(TaskStateAdapter());
  Hive.registerAdapter(TagAdapter());
  Hive.registerAdapter(TagTypeAdapter());
  taskBox = await Hive.openBox<Task>('taskBox');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isFirstRun = true;

  @override
  void initState() {
    super.initState();
    // Attendre 4 secondes avant de passer à false
    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        _isFirstRun = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final rodeeoTheme = RodeeoTheme(Theme.of(context));

    return ChangeNotifierProvider<ThemeProvider>(
      create: (_) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) {
          final isDark = context.watch<ThemeProvider>().isDarkMode;
          return MaterialApp(
            title: 'Tracker hours',
            theme: rodeeoTheme.light,
            darkTheme: rodeeoTheme.dark,
            themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
            home: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (child, animation) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
              child: _isFirstRun ? const Windhair() : const TimeTrackerHomePage(),
            ),
          );
        },
      ),
    );
  }
}
