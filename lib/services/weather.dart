import 'package:weather/services/locattion.dart';
import 'package:weather/services/networking.dart';

const String _openweatherurl =
    'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> Getcityweatherdata(String cityname) async {
    NetworkHelper currentData = NetworkHelper();
    dynamic decodeddata =
        await currentData.getlocationdata('$_openweatherurl?q=$cityname');
    return decodeddata;
  }

  Future<dynamic> getLocationData() async {
    //IN THis FUNCTION WE ARE GETTING THE CURRENT LOCATION OF USER WITH HELP OF
    //LOCATION.DART AND GETTING THE DECODED JSON DATA WITH HELP OF NETWORKHELPER
    //AND RETURN THAT DECODED DATA TO LOADING SCREEN.
    Findlocation f = Findlocation();
    await f.getcurrentLocation();

    //beacuse we cant accsess f.lattitude and f.longitude untill
    // getcurrentlocation is called therfore await keyword is used
    NetworkHelper currentData = NetworkHelper();
    dynamic decodeddata = await currentData.getlocationdata(
        '$_openweatherurl?lat=${f.lattitude}&lon=${f.longitude}');

    return decodeddata;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
