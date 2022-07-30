import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mi_card/flash_chat/authentication.dart';
import 'package:mi_card/flash_chat/constants.dart';
import 'package:mi_card/screensclima/loading_screen.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'chat_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String id = "login_screen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  late String email;
  late String password;
  bool showSpinner = false;

  @override
  void initState() {
    // checking if user is logged in or not.
    Future.delayed(Duration.zero,() async {
      print("Checking loggedin user log in.");
      bool loggedIn = await checkForAlreadySignedIn();
      if(loggedIn){
        ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("User is already logged in."),
                        duration: Duration(milliseconds: 400),
                  ));
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("User is not logged in."),
                        duration: Duration(milliseconds: 400),
                  ));
      }
    });
    super.initState();

    }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if(snapshot.hasError){
            print("Error while getting firebase. Login");
          }
          if(snapshot.connectionState == ConnectionState.done){
            print("Connection successful. Login");
            return MainBodyLogin();
          }
          return LoadingScreen();
        }
    );
  }
}


class MainBodyLogin extends StatefulWidget {
  const MainBodyLogin({Key? key}) : super(key: key);

  @override
  State<MainBodyLogin> createState() => _MainBodyLoginState();
}

class _MainBodyLoginState extends State<MainBodyLogin> {

  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('assets/images/flash_chat_logo.png'),
                  ),
                ),
              ),
              const SizedBox(
                height: 48.0,
              ),
              TextField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: getInputDecoration("Enter your email..")
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password = value;
                },
                decoration: getInputDecoration("Enter your password"),
              ),
              const SizedBox(
                height: 24.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Material(
                  color: Colors.lightBlueAccent,
                  borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                  elevation: 5.0,
                  child: MaterialButton(
                    onPressed: () async {
                      if(kIsWeb){
                        try{
                          User? user = await signInWithEmailPassword(email, password);
                          if(user != null) {
                            print(user.email.toString());
                            Navigator.pushNamed(context, ChatScreen.id);
                          }else{
                            print("There is error while signing in with email.");
                          }
                        } catch (e) {
                          print(e);
                        }
                      }
                      //Implement login functionality.
                    },
                    minWidth: 200.0,
                    height: 42.0,
                    child: const Text(
                      'Log In',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }
}

