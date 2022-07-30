import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mi_card/screensclima/location_screen.dart';
import 'package:mi_card/servicesClima/weather.dart';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
  }

  void getLocationData() async {

   var weatherData = await WeatherModel().getLocationWeather();

   Navigator.push(context,
   MaterialPageRoute(builder: (context) => LocationScreen(
      weatherData: weatherData,
   )));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: SpinKitDoubleBounce(
          color: Colors.grey,
            size: 200.0,
        ),
      ),
    );
  }
}