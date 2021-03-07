import 'package:deltahacks/Screens/pills_screen.dart';
import 'package:deltahacks/Screens/userInfo_screen.dart';
import 'package:deltahacks/ui/random_value_page.dart';
import 'package:flutter/material.dart';
import '../googleauth.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';

// class MainScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: new ElevatedButton(
//         onPressed: () => fireStore.getDBVal(),
//         child: const Text(
//           'Click Me',
//           style: TextStyle(fontSize: 20),
//         ),
//       ),
//     );
//   }
// }

class MainScreen extends StatefulWidget {
  MainScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 1;

  pageDecider(int page) {
    if (page == 0) {
      // Replaced by analytics Page
      return RandomValuePage();
    } else if (page == 1) {
      // User Info Page
      return UserInfo();
    } else if (page == 2) {
      // Actual Pills Page
      return PillsPage(voidCallback: () {
        setState(() {});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: pageDecider(selectedIndex),
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
            iconData: Icons.analytics_outlined,
            label: 'Analytics',
            selectedBackgroundColor: Colors.blue,
          ),
          FFNavigationBarItem(
            iconData: Icons.person_outline_outlined,
            label: 'Home',
            selectedBackgroundColor: Colors.blue,
          ),
          FFNavigationBarItem(
            iconData: Icons.medical_services_outlined,
            label: 'Schedule',
            selectedBackgroundColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}
