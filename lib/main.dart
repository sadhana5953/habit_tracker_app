import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/database/Habit_database.dart';
import 'package:untitled1/pages/home_pages.dart';
import 'package:untitled1/theme/light_mode.dart';
import 'package:untitled1/theme/theme_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await HabitDatabase.initialize();
  await HabitDatabase().saveFirstLaunchDate();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => HabitDatabase(),
    ),
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
    ),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
