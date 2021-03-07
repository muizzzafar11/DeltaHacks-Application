import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Screens/init_screen.dart';
import 'Screens/pills_screen.dart';
import 'Screens/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Password Manager',
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
      darkTheme: ThemeData(
        brightness: Brightness.light,
      ),
    );
  }
}
