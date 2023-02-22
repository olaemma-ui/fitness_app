import 'package:fitness_app/View/AppView.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';

import 'View/Widgets/AppUiManager.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Hive.initFlutter();

  await Hive.openBox('goals');
  await Hive.openBox('history');
  await Hive.openBox('activity');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppUiManager.theme(),
      initialRoute: '/home',
      routes: {'/home': (context) => const AppView()},
    );
  }
}
