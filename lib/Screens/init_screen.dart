import 'package:flutter/material.dart';
import '../googleauth.dart';
import 'login_screen.dart';

class InitScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: fireStore.dbInit(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              body: LoginScreen(),
            );
          } else {
            return Scaffold(
              body: Center(
                child: Image(
                  image: AssetImage("assets/logo.png"),
                  height: MediaQuery.of(context).size.height / 3,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
