import 'package:flutter/material.dart';
import 'package:weather/services/weather.dart';
import 'package:weather/Screen/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  LoadingScreenState createState() => LoadingScreenState();
}

class LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    dynamic decodeddata =
        await WeatherModel().getLocationData(); //simontanously
    //creating object as well as calling the func at same time

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => LocationScreen(
                  location_weather: decodeddata,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitSpinningLines(
          color: Colors.grey,
          size: 100,
          itemCount: 6,
        ),
      ),
    );
  }
}
