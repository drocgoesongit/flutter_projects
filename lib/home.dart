import 'package:flutter/material.dart';
import 'package:mi_card/bitcoin/intro.dart';
import 'package:mi_card/const/const.dart';
import 'package:mi_card/screens_bmi_calculator/bmi_calculator.dart';
import 'package:mi_card/screensclima/city_screen.dart';
import 'package:mi_card/screensclima/loading_screen.dart';
import 'music.dart';


void main() {
  runApp(
    const MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: const Scaffold(
        body: MainScreenBody(),
      ),
      routes: {
        '/music': (context) => const MusicApp(),
        '/bmi': (context) => const BMIApp(),
        '/clima' : (context) => LoadingScreen(),
        '/bitcoin' : (context) => const IntroScreen(),
      },
    );
  }
}

class MainScreenBody extends StatelessWidget {
  const MainScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 180.0,
            width: MediaQuery. of(context). size. width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: const [
                      Text("Practice", style: kExtraBoldTitleStyle,),
                      Text("Apps", style: kExtraBoldTitleStyle,),
                    ],
                  ),
                ),
                Expanded(
                  child: Image.asset('assets/images/coding.png',
                  fit: BoxFit.fill,),
                ),
              ]
            ),
          ),

          SingleChildScrollView(
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/bitcoin');
              },
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: kNotWhite,
                      ),
                      child: Column(
                        children: [
                          SizedBox(

                              child: Image.asset('assets/images/bitcoin_bg.png',
                          fit: BoxFit.contain,)),
                          Row(
                            children: const [
                              Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.all(15.0),
                                    child: Text("Bitcoin - Convert your crypto in your local currency", style: kCardTextHomePage),
                                  )),
                              Padding(
                                padding: EdgeInsets.only(right: 15.0),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),

          MaterialButton(
              onPressed: (){
                Navigator.pushNamed(context, '/bmi');
              },
            child: const Text("BMI Calculator"),
            ),
          const SizedBox(
            height: 10.0,
            width: double.infinity,
          ),
          MaterialButton(
            onPressed: (){
              Navigator.pushNamed(context, '/music');
            },
            child: const Text("Button2"),
          ),
          const SizedBox(
            height: 10.0,
            width: double.infinity,
          ),
          MaterialButton(
            onPressed: (){
              Navigator.pushNamed(context, '/clima');
            },
            child: const Text("Clima app"),
          ),
          const SizedBox(
            height: 10.0,
            width: double.infinity,
          ),
          MaterialButton(
            onPressed: (){
              Navigator.pushNamed(context, '/bitcoin');
            },
            child: const Text("Bitcoin app"),
          ),

        ],
      ),
    );
  }
}
