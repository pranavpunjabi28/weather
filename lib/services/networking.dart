//IN THIS FILE WE ARE CALLING API AND GETTING THE JSON DATA AND RETURN THE
// JSON DECODED DATA TO THE LOADING SCREEN VARIABLE NAMED AS "decodeddata".
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:weather/Screen/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const String apikey = '2bdfff50485f6ad07ab6459264eb798a';

class NetworkHelper extends StatelessWidget {
  const NetworkHelper({super.key});

  Future<dynamic> getlocationdata(String url) async {
    http.Response responsee =
        await http.get(Uri.parse('$url&appid=$apikey&units=metric'));
    // print(responsee.body); print body
    // print(responsee); print instance of responce
    // print(responsee.statusCode);

    if (responsee.statusCode == 200) {
      return jsonDecode(responsee.body);
    } else {
      print(responsee.statusCode);
    }
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
