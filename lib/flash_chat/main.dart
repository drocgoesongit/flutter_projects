import 'package:flutter/material.dart';
import 'package:mi_card/flash_chat/screens/chat_screen.dart';
import 'package:mi_card/flash_chat/screens/login_screen.dart';
import 'package:mi_card/flash_chat/screens/registration_screen.dart';
import 'package:mi_card/flash_chat/screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
    print("You are running on web.");
  }else{
    print("You are not on web.");
  }
  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: const TextTheme(
          bodyMedium : TextStyle(color: Colors.black, fontSize: 50.0),
        ),
      ),
      home: FutureBuilder(
        future: _initialization,
          builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.done){
            return WelcomeScreen();
          }
          if (snapshot.hasError){
            print("Error to make connection with the firebase. Try Again!");
          }
          return CircularProgressIndicator();
          }
      ),
      routes: {
        WelcomeScreen.id : (context) => WelcomeScreen(),
        LoginScreen.id : (context) => LoginScreen(),
        RegistrationScreen.id : (context) => RegistrationScreen(),
        ChatScreen.id : (context) => ChatScreen(),
      },
    );
  }
}