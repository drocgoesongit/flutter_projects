import 'package:flutter/material.dart';
import 'package:mi_card/bitcoin/intro.dart';
import 'package:mi_card/const/const.dart';
import 'package:mi_card/flash_chat/main.dart';
import 'package:mi_card/screens_bmi_calculator/bmi_calculator.dart';
import 'package:mi_card/screensclima/city_screen.dart';
import 'package:mi_card/screensclima/loading_screen.dart';
import 'package:mi_card/todo/home.dart';
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
        backgroundColor: Color(0xFFEAF4FF),
        body: MainScreenBody(),
      ),
      routes: {
        '/music': (context) => const MusicApp(),
        '/bmi': (context) => const BMIApp(),
        '/clima' : (context) => LoadingScreen(),
        '/bitcoin' : (context) => const IntroScreen(),
        '/chat' : (context) => FlashChat(),
        '/todo' : (context) => const TaskApp(),
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
          Expanded(
            child: ListView(
                children: [
                  Row( // top row for title and title image.
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text("Practice", style: kExtraBoldTitleStyle,),
                              Text("Apps", style: kExtraBoldTitleStyle,),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Image.asset('assets/images/coding.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ]
                  ),
                  TileElementApplicationList(route: '/bitcoin', appContext: 'Bitcoin - Convert your crypto in your local currency', thumbnailAsset: 'assets/images/bitcoin_bg.png'),
                  const SizedBox(
                      height: 20.0,
                  ),
                  TileElementApplicationList(route: '/music', appContext: 'Xylo - Uses sound packages to play some xylophone tunes.', thumbnailAsset: 'assets/images/music_xylo_bg.png'),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TileElementApplicationList(route: '/clima', appContext: 'Clima - Check about climate of your city in no time', thumbnailAsset: 'assets/images/clima_app_bg.png'),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TileElementApplicationList(route: '/bmi', appContext: 'BMI - Check your body status by calculating BMI instantly.', thumbnailAsset: 'assets/images/bmi_bg.png'),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TileElementApplicationList(route: '/chat', appContext: 'Chat - Personal Private Playful, 3 P’s to explain this product.', thumbnailAsset: 'assets/images/chat_bg.png'),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TileElementApplicationList(route: '/todo', appContext: 'TODO - Never miss a single task every day with todo app.', thumbnailAsset: 'assets/images/todo_bg.png'),
                  const SizedBox(
                    height: 20.0,
                  ),
                ],
            ),
          ),

        ],
      ),
    );
  }
}

// tile element for each application.
class TileElementApplicationList extends StatelessWidget {
  TileElementApplicationList({required this.route, required this.appContext, required this.thumbnailAsset });

  final String route;
  final String appContext;
  final String thumbnailAsset;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              decoration: BoxDecoration(
                color: kNotWhite,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 4.0,
                    offset: Offset(0, 4),
                  ),
                ],
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                children: [
                  SizedBox(
                      child: Image.asset(thumbnailAsset,
                        fit: BoxFit.contain,)),
                  Row(
                    children: [
                      Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(appContext, style: kCardTextHomePage),
                          )),
                      const Padding(
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
    );
  }
}
