import 'package:flutter_app_mobindustry/model/temperature_info.dart';
import 'package:flutter_app_mobindustry/model/wind_info.dart';
import 'package:flutter_app_mobindustry/utilities/double_parser.dart';

import '../utilities/double_parser.dart';

class Weather {
  int id;
  String cityname;
  TemperatureInfo main;
  WindInfo wind;

  Weather({this.id, this.cityname, this.main, this.wind});

  Weather.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cityname = json['name'];
    main = TemperatureInfo.fromJson(json['main']);
    wind = WindInfo.fromJson(json['wind']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cityname'] = this.cityname;
    return data;
  }
}