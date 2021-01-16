import 'package:flutter_app_mobindustry/utilities/double_parser.dart';

class TemperatureInfo {
  double temp;
  int pressure;
  int humidity;
  double tempMin;
  double tempMax;

  TemperatureInfo(
      {this.temp, this.pressure, this.humidity, this.tempMin, this.tempMax});

  TemperatureInfo.fromJson(Map<String, dynamic> json) {
    temp = DoubleParser.parse(json['temp']);
    pressure = json['pressure'];
    humidity = json['humidity'];
    tempMin = DoubleParser.parse(json['temp_min']);
    tempMax = DoubleParser.parse(json['temp_max']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['temp'] = this.temp;
    data['pressure'] = this.pressure;
    data['humidity'] = this.humidity;
    data['temp_min'] = this.tempMin;
    data['temp_max'] = this.tempMax;
    return data;
  }
}