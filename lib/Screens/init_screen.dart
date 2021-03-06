import 'package:flutter/material.dart';
import '../googleauth.dart';
import 'login_screen.dart';

class InitScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fireStore.dbInit(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return LoginScreen();
        } else {
          return Center(
            child: Image(
              image: AssetImage("assets/logo.png"),
              height: MediaQuery.of(context).size.height / 3,
            ),
          );
        }
      },
    );
  }
}
