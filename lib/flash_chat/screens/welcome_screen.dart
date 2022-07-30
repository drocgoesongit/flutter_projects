import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mi_card/flash_chat/authentication.dart';
import 'package:mi_card/flash_chat/screens/login_screen.dart';
import 'package:mi_card/flash_chat/screens/registration_screen.dart';

class WelcomeScreen extends StatefulWidget{
  static const String id = "welcome_screen";

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>  with SingleTickerProviderStateMixin{
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animation = ColorTween(begin: Colors.blue, end: Colors.white).animate(controller);
    controller.forward();
    animation.addStatusListener((status) {
      setState(() {
      });
      print(status);
    });

    controller.addListener(() {
      setState(() {

      });
    });

    Firebase.initializeApp().whenComplete(() {
      print("FirebaseInitialized. ChatScreen.");
      checkForAlreadyLoggedIN();
      getUser();
      setState(() { });
    });


  }

  // check for already sign in.
  void checkForAlreadyLoggedIN() async {
    try{
      User? user = await FirebaseAuth.instance.currentUser;
      if(user != null) {
        ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Logging in your account."),
                        duration: Duration(milliseconds: 800),
                  ));
      }else {
        ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Try logging in or create a new account"),
                        duration: Duration(milliseconds: 800),
                  ));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                      content: Text(e.toString()),
                      duration: const Duration(milliseconds: 400),
                ));
    }
  }

  // disposing our animation controller other wise it will keep using resources.
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    height: 60.0,
                    child: Image.asset('assets/images/flash_chat_logo.png'),
                  ),
                ),
                AnimatedTextKit(
                    isRepeatingAnimation: false,
                    animatedTexts: [
                  TypewriterAnimatedText(
                    'FireChat',
                    textStyle: const TextStyle(
                      fontSize: 45.0,
                      fontWeight: FontWeight.w900,
                    ),
                    speed: const Duration(milliseconds: 100),
                  ),
                ]),
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: RawMaterialButton(
                textStyle: const TextStyle(
                   color: Colors.white,
                ),
                elevation: 5.0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                fillColor : Colors.lightBlueAccent,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                constraints: const BoxConstraints(
                  minWidth: 200.0,
                  minHeight: 42.0,
                ),
                child: const Text(
                  "Log in",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: RawMaterialButton(
                textStyle: const TextStyle(
                  color: Colors.white,
                ),
                elevation: 5.0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                fillColor : Colors.blueAccent,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegistrationScreen()),
                  );
                },
                constraints: const BoxConstraints(
                  minWidth: 200.0,
                  minHeight: 42.0,
                ),
                child: const Text(
                  "Register",
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

