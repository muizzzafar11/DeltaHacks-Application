import 'package:deltahacks/pill.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_database/firebase_database.dart';

class GoogleAuth {
  // Sign in
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignin = GoogleSignIn();

  // Database
  final db = FirebaseDatabase.instance.reference();

  User currentUser;
  bool loggedIn = false;
  bool initializeFirebase = false;
  final text = 'Hello world';
  final String treeTop = 'Pills';

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

  Future<void> writeToDb(
      String pillName, int pillsLeft, String schedule) async {
    db
        .child(treeTop)
        .child(pillName)
        .set({'PillsLeft': pillsLeft, 'Schedule': schedule});
  }

  Future<void> updateDb(String index, String pillNames, int updatedPillsLeft,
      String updatedSchedule) async {
    db.child(treeTop).child(index).update({
      'Name': pillNames,
      'PillsLeft': updatedPillsLeft,
      'Schedule': updatedSchedule
    });
  }

  String getSingleValFromDb(String pillName, String field) {
    String temp;
    db.once().then((DataSnapshot snapshot) {
      Map<dynamic, dynamic> values =
          new Map<String, dynamic>.from(snapshot.value);
      temp = values["Pills"][pillName][field];
    });
    return temp;
  }

  void getDBVal() {
    db.once().then((DataSnapshot snapshot) {
      Map<dynamic, dynamic> values =
          new Map<String, dynamic>.from(snapshot.value);

      print(values["Pills"]["0"]["Name"]);

      for (var i = 0; i < values.length; i++) {
        List<int> tempIntArr = [];
        String str = values["Pills"][i.toString()]["Schedule"].toString();
        String tempStr = "";
        for (var j = 0; j < str.length; j++) {
          if (str[j] == ",") {
            tempIntArr[j] = int.parse(tempStr);
            tempStr = "";
            break;
          } else {
            tempStr += str[j];
          }
        }
        dbPills[i] = Pill(
            name: values["Pills"][i.toString()]["Name"].toString(),
            pillsLeft: int.parse(
                values["Pills"][i.toString()]["PillsLeft"].toString()),
            schedule: tempIntArr);
      }
    });
  }

  Future<void> deleteFromDb(String field) async {}

  void signOutUser() async {
    await _googleSignin.signOut();
  }
}

GoogleAuth fireStore = GoogleAuth();
