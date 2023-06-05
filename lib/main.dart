import 'package:apprentissage/src/components/time_tracker_homepage.dart';
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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeProvider>(
      create: (_) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) {
          final isDark = context.watch<ThemeProvider>().isDarkMode;
          return MaterialApp(
            title: 'Tracker hours',
            theme: isDark ? RodeeoTheme.darkTheme : RodeeoTheme.lightTheme,
            home: const TimeTrackerHomePage(),
          );
        },
      ),
    );
  }
}
