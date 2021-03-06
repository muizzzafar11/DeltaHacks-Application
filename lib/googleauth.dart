import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GoogleAuth {
  // Sign in
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignin = GoogleSignIn();

  // Database
  final FirebaseFirestore db = FirebaseFirestore.instance;

  User currentUser;
  bool loggedIn = false;
  bool initializeFirebase = false;
  final text = 'Hello world';

  GoogleAuth();

  // Signing in the user, and if not signed in then initializing db and signing them in
  Future<void> dbInit() async {
    loggedIn = await _googleSignin.isSignedIn();
    await _googleSignin.isSignedIn()
        ? currentUser = _auth.currentUser
        : await signInNewUser();
  }

  Future<void> signInNewUser() async {
    if (await _googleSignin.isSignedIn() == false) {
      // Signing in new user using their google account
      final GoogleSignInAccount _signInAccount = await _googleSignin.signIn();

      // If the user doesnt close on getting the prompt
      if (_signInAccount != null) {
        final GoogleSignInAuthentication _signInAuth =
            await _signInAccount.authentication;

        // Getting credentials for authorization
        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: _signInAuth.idToken,
          accessToken: _signInAuth.accessToken,
        );

        // Getting user from the auth credentials
        final User user = (await _auth.signInWithCredential(credential)).user;

        currentUser = _auth.currentUser;

        // Making sure credentials of authorized user and current user are same
        assert(user.uid == currentUser.uid);
        loggedIn = true;
        print('Signin With Google Suceeded with user uid: ${user.uid}');
      }
    }
  }

  Future<void> writeToDb(String text) async {}

  void signOutUser() async {
    await _googleSignin.signOut();
  }
}

GoogleAuth fireStore = GoogleAuth();
