import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Findlocation extends StatelessWidget {
  late double lattitude;
  late double longitude;

  Findlocation({super.key});
  //reult is return after the location process os done therfore future keyword
  // is used
  Future<void> getcurrentLocation() async {
    //This Function is Getting The current location
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      //or Future<Position> position =  Geolocator.getCurrentPosition(
      //           desiredAccuracy: LocationAccuracy.low);  in this we gget future instance
      //not a actual or present
      lattitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
