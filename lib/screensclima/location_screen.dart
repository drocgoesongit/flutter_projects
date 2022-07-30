import 'package:flutter/material.dart';
import 'package:mi_card/const/const.dart';
import 'package:mi_card/screensclima/city_screen.dart';
import 'package:mi_card/servicesClima/weather.dart';

class LocationScreen extends StatefulWidget{

  LocationScreen({required this.weatherData});
  final weatherData;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late int temperature;
  late String condition;
  late String message;
  late String cityName;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.weatherData);
    updateUi(widget.weatherData);
  }

  void updateUi(dynamic weatherData) {
    print('update UI called.');
    if(weatherData == null){
     print("There is an error in getting the data.");
     temperature = 0;
     condition = 'Error';
     message = 'There is an error.';
     cityName = 'getting location.';
     return;
    }

     setState(() {
       double temp = weatherData['main']['temp'];
       temperature = temp.toInt();
       int conditionTemp = weatherData['weather'][0]['id'];
       condition = WeatherModel().getWeatherIcon(conditionTemp);
       message = WeatherModel().getMessage(temperature);
       cityName = weatherData['name'];
     });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  MaterialButton(
                    onPressed: () async {
                      var weatherData = await WeatherModel().getLocationWeather();
                      updateUi(weatherData);
                    },
                    child: const Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  MaterialButton(
                    onPressed: () async {
                      var typedName = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CityScreen()),
                      );
                      print(typedName);
                      var weatherDataFromTyped = await WeatherModel().getWeatherFromName(typedName);
                      if(weatherDataFromTyped != null){
                        updateUi(weatherDataFromTyped);
                      }
                    },
                    child: const Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '$condition',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  '$message in $cityName!',
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}