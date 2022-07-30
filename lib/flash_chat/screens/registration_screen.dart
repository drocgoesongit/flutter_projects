import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mi_card/flash_chat/authentication.dart';
import 'package:mi_card/flash_chat/constants.dart';
import 'package:mi_card/flash_chat/screens/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show kIsWeb;


class RegistrationScreen extends StatefulWidget {

  static const String id = "registration_screen";


  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if(snapshot.hasError){
            print("Error while connecting with firebase.");
          }
          if(snapshot.connectionState == ConnectionState.done){
            return MainBody();
          }
          return CircularProgressIndicator();
        });
  }
}




class MainBody extends StatelessWidget {
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
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
                  //Do something with the user input.
                },
                decoration: getInputDecoration("Enter your password")
            ),
            const SizedBox(
              height: 24.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Colors.blueAccent,
                borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () async {
                    if(kIsWeb){
                      try{
                        User? user = await registerWithEmailAndPassword(email, password);
                        if(user != null ){
                          print(user.email.toString());
                          Navigator.pushNamed(context, ChatScreen.id);
                        }
                      } catch (e) {
                        print(e);
                      }

                    }else {
                      try{
                        final newUser = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
                        if(newUser != null){
                          print(newUser.user?.email.toString());
                          Navigator.pushNamed(context, ChatScreen.id);
                        }
                      }catch(e) {
                        print(e);
                      }
                    }


                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: const Text(
                    'Register',
                    style: TextStyle(color: Colors.white),
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