import 'package:flutter/material.dart';
import 'package:weather/utility/constantss.dart';
import 'package:weather/Screen/City_Screen.dart';
import 'package:weather/services/weather.dart';

class LocationScreen extends StatefulWidget {
  final dynamic location_weather;

  LocationScreen({super.key, required this.location_weather});

  @override
  LocationScreenState createState() => LocationScreenState();
}

class LocationScreenState extends State<LocationScreen> {
  late int temprature;
  late String cityname;
  String weathericon = '';
  String weathermessage = '';
  WeatherModel weathermodel = WeatherModel();

  void initState() {
    super.initState();
    updateui(widget.location_weather);
    //WE USE WIDGET TO ACCSES THE
    //DATA OF NONSTATE CLASS IN STATEFUL CLASS
  }

  updateui(var decodeddata) {
    setState(() {
      if (decodeddata == null) {
        temprature = 00;
        cityname = '';
        weathericon = 'Error';
        weathermessage = 'unable to fetch the weather data';
        return;
      }
      double temp = decodeddata['main']['temp'];
      temprature = temp.toInt();
      cityname = decodeddata['name'];
      int condittion = decodeddata['weather'][0]['id'];
      weathericon = weathermodel.getWeatherIcon(condittion);
      weathermessage = weathermodel.getMessage(temprature);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('images/location_background.jpg'),
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
            textDirection: TextDirection.ltr,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      var Weatherdecodeddata =
                          await weathermodel.getLocationData();
                      updateui(Weatherdecodeddata);
                    },
                    child: const Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      //here we get the data when user type in Future hence await
                      var typeddata = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CityScreen()));
                      if (typeddata != null) {
                        var cityweather = await weathermodel.Getcityweatherdata(typeddata);
                        updateui(cityweather);
                      }
                      else{
                        var Weatherdecodeddata = await weathermodel.getLocationData();
                        updateui(Weatherdecodeddata);
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
                      '$temprature°C',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weathericon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Text(
                  "$weathermessage in $cityname",
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
