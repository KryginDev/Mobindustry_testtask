import 'package:flutter/material.dart';
import 'package:flutter_app_mobindustry/model/weather.dart';

// ignore: must_be_immutable
class WeatherDetailsScreen extends StatelessWidget {
  Weather weather;

  WeatherDetailsScreen({this.weather})
      : assert(weather != null, 'Weather must not be null');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(weather.cityname),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Text(
            '${weather.main.temp.floor().toString()}°C',
            style: TextStyle(
              fontSize: 100,
              fontWeight: FontWeight.bold,
            ),
          )),
          SizedBox(
            height: 32,
          ),
          Center(
            child: Text(
              '${weather.main.tempMin.floor()}/${weather.main.tempMax.floor()}°C',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: 32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Humidity: ${weather.main.humidity}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Text(
                'Wind Speed: ${weather.wind.speed} m/s',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
