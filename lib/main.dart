import 'package:fitness_app/View/AppView.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'View/Widgets/AppUiManager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
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
