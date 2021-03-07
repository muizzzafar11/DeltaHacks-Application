import 'package:deltahacks/Screens/pills_screen.dart';
import 'package:flutter/material.dart';
import '../googleauth.dart';
import 'main_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool flag = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return fireStore.loggedIn
        ? PillsPage()
        : Container(
            height: size.height,
            width: size.width,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Image(
                    image: AssetImage("assets/logo.png"),
                    height: size.height / 3,
                  ),
                  SizedBox(height: 20),
                  _signInButton(),
                ]),
          );
  }

  Widget _signInButton() {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: BorderSide(width: 0.9, color: Colors.grey[850]),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      // splashColor: Colors.black,
      onPressed: () => signInStateChange(),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image(
              image: AssetImage("assets/google_logo.png"),
              height: 35.0,
            ),
            Padding(padding: const EdgeInsets.only(left: 10)),
            Text(
              'Sign in with Google',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w100,
                // color: Colors.orange[400],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void signInStateChange() async {
    await fireStore.dbInit();
    setState(() => flag = fireStore.loggedIn);
  }
}
