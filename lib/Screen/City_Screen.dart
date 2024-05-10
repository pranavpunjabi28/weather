import 'package:flutter/material.dart';
import 'package:weather/utility/constantss.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String Cityname = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                child: null,
              ),
              TextField(
                maxLength: 20,
                style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
                decoration: InputDecoration(
                  hintText: 'enter the name of the city',
                  labelText: 'cityname',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.black54,
                  prefixIcon: const Icon(
                    Icons.location_city,
                    size: 30,
                  ),
                  prefixIconColor: Colors.green,
                  //icon: Icon(Icons.location_city),
                  //iconColor: Colors.white,
                ),
                onChanged: (value) {
                  Cityname = value;
                },
              ),
              TextButton(
                  child: const Text(
                    'Get Weather',
                    style: kButtonTextStyle,
                  ),
                  onPressed: () {
                    Navigator.pop(context,Cityname);
                  }
//HERE SECOND PARAMATER IS OPPTIONAL IT IS FOR RETURNNING SOMTHING TO PREVIOUS SCREEN},

                  ),
            ],
          ),
        ),
      ),
    );
  }
}
