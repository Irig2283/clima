import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'location_screen.dart';
import 'networking.dart';
import 'weather.dart';

class LodingScreen extends StatefulWidget {
  const LodingScreen({Key? key}) : super(key: key);

  @override
  State<LodingScreen> createState() => _LodingScreenState();
}

class _LodingScreenState extends State<LodingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getData(decodedData) async {
    double temprature = decodedData['main'];
    int condition = decodedData['weather'][0]['id'];
    String cityName = decodedData['name'];
  }

  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
      );
    }));
    // getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.green,
          size: 100,
        ),
      ),
    );
  }
}
