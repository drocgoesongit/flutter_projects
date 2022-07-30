import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: MusicApp(),
      ),
    )
  );
}

class MusicApp extends StatefulWidget {
  const MusicApp({Key? key}) : super(key: key);

  @override
  State<MusicApp> createState() => _MusicAppState();
}

class _MusicAppState extends State<MusicApp> {
  void playSound(int soundNumber){
    final player = AudioCache(prefix: 'assets/musics/');
    player.play('assets_note$soundNumber.wav');
  }

  Expanded buildKey(int soundNumber, int shade) => Expanded(
    child: MaterialButton(
      color: null,
      elevation: 10.0,
      padding: const EdgeInsets.all(0.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      onPressed: () {
        playSound(soundNumber);
      },
      child: Container(
        color: Colors.grey[shade],
      ),
    ),
  );

  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:[
            buildKey(1, 350),
            buildKey(2, 400),
            buildKey(3, 600),
            buildKey(4, 700),
            buildKey(5, 800),
            buildKey(6, 850),
            buildKey(7, 900),
          ]
      ),
    );
  }
}
