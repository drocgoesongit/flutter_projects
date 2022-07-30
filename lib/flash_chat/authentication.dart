import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
String? uid;
String? userEmail;

// function to register new Users.
Future<User?> registerWithEmailAndPassword(String email, String password) async {
  // initialize Firebase;
  await Firebase.initializeApp();

  User? user;

  try {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    user = userCredential.user;
    if(user != null) {
      uid = user.uid;
      userEmail = user.email;
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('An account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }

  return user;
}
// function to register new Users ends here.

// function to sign in / log in existing users.
Future<User?> signInWithEmailPassword(String email, String password) async {
  await Firebase.initializeApp();
  User? user;

  try {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    user = userCredential.user;

    if (user != null) {
      uid = user.uid;
      userEmail = user.email;

       SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('auth', true);
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided.');
    }
  }
  return user;
}
// function to sign in / log in existing users ends here.

// function to sign out.
Future<String> signOut() async {
  await _auth.signOut();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('auth', false);

  uid = null;
  userEmail = null;

  return 'User signed out';
}
// function to sign out ends here.

// function to auto sign in .
Future getUser() async {
  // Initialize Firebase
  await Firebase.initializeApp();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool authSignedIn = prefs.getBool('auth') ?? false;

  final User? user = _auth.currentUser;

  if (authSignedIn == true) {
    if (user != null) {
      uid = user.uid;
      userEmail = user.email;
    }
  } else {
    print("from authentication no previous user found.");
  }
}

// function to AutoSign in.

// function to check already signed in user.
Future<bool> checkForAlreadySignedIn() async {
  await Firebase.initializeApp();
  final User? user = _auth.currentUser;

  if(user != null) {
    return Future.value(true);
  }
  return Future.value(false);
}
