import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app_mobindustry/model/weather.dart';

class WeatherRepository {
  Dio _dio;

  WeatherRepository() {
    _dio = Dio(BaseOptions(
      baseUrl: 'https://api.openweathermap.org/data/2.5',
      headers: {'Authorization': 'Client-Id fb35c70201f40caa307483b4e01d9a5e'},
    ));
  }

  Future<Weather> getWeatherData() async {
    try {
      final result = await _dio.get('/onecall');
      return Weather.fromJson(result.data);
    } on DioError catch (e) {
      throw e.message;
    }
  }

  Future<Weather> getWeatherByCity({@required String name}) async {
    try {
      final result = await _dio.get(
          '/weather?q=$name&lang=ru&units=metric&appid=fb35c70201f40caa307483b4e01d9a5e'
      );
      return Weather.fromJson(result.data);
    } on DioError catch (e) {
      throw e.message;
    }
  }
}
