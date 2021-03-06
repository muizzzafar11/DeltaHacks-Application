import 'package:flutter/material.dart';
import '../googleauth.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new ElevatedButton(
        onPressed: () => fireStore.signOutUser(),
        child: const Text(
          'Click Me',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
