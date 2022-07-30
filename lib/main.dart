import 'package:flutter/material.dart';

void main() {
  runApp(
    const MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal[200],
        body: SafeArea(
          child: Container(
            color: Colors.teal,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage('assets/images/this.jpg'),
                ),
                const Text(
                  "Nabeel Mirza",
                  style: TextStyle(fontSize: 40.0, color: Colors.black, fontFamily: 'Pacifico', letterSpacing: 2.5),
                ),
                const Text(
                  "SOFTWARE ENGINEER",
                  style: TextStyle(fontFamily: 'SourceSans', letterSpacing: 2.5, fontWeight: FontWeight.bold,fontSize: 20.0),
                ),
                 const SizedBox(
                   width: 150.0,
                   height: 30.0,
                   child: Divider(
                     color: Colors.black,
                   ),
                 ),
                Card(
                  elevation: 10.0,
                  shadowColor: Colors.black,
                  margin: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 20.0),
                  color: Colors.tealAccent,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                  child: const ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Colors.black,
                    ),
                    title: Text(
                      "+91 7249603055",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontFamily: 'SourceSans', fontSize: 16.0, color: Colors.black),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.black,
                    ),
                  ),
                ),
                Card(
                  elevation: 10.0,
                  shadowColor: Colors.black,
                  margin: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20.0),
                  color: Colors.tealAccent,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                  child: const ListTile(
                    leading: Icon(
                      Icons.email,
                      color: Colors.black,
                    ),
                    title: Text(
                      "contactnabeelmirza@gmail.com",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontFamily: 'SourceSans', fontSize: 16.0, color: Colors.black),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  width: double.infinity,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
