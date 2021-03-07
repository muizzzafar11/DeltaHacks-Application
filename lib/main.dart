import 'package:deltahacks/googleauth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';

import 'Screens/init_screen.dart';
import 'Screens/login_screen.dart';
import 'Screens/main_screen.dart';
import 'Screens/pills_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ff_navigation_bar Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Delta Dispenser'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;

 pageDecider(int page) {  
   if (page == 0) {
   return MainScreen();  
   } else if  (page == 1){
      return PillsPage();
   } else if  (page == 2){
         return LoginScreen();
   // Analytics Screen
   } else if(page == 3){

   }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:pageDecider(selectedIndex),
      bottomNavigationBar: FFNavigationBar(
        theme: FFNavigationBarTheme(
          barBackgroundColor: Colors.white,
          selectedItemBorderColor: Colors.transparent,
          selectedItemBackgroundColor: Colors.green,
          selectedItemIconColor: Colors.white,
          selectedItemLabelColor: Colors.black,
          showSelectedItemShadow: false,
          barHeight: 70,
        ),
        selectedIndex: selectedIndex,
        onSelectTab: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          FFNavigationBarItem(
            iconData: Icons.home,
            label: 'Home',
            selectedBackgroundColor: Colors.blue,
          ),
          FFNavigationBarItem(
            iconData: Icons.schedule,
            label: 'Schedule',
            selectedBackgroundColor: Colors.blue,
          ),
          FFNavigationBarItem(
            iconData: Icons.analytics,
            label: 'Analytics',
            selectedBackgroundColor: Colors.blue,
          ),
          FFNavigationBarItem(
            iconData: Icons.settings,
            label: 'Settings',
            selectedBackgroundColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}
