import 'package:flutter_app_mobindustry/utilities/double_parser.dart';

class Weather {
  int id;
  String cityname;
  _TempInfo main;
  _WindInfo wind;

  Weather({this.id, this.cityname, this.main, this.wind});

  Weather.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cityname = json['name'];
    main = _TempInfo.fromJson(json['main']);
    wind = _WindInfo.fromJson(json['wind']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cityname'] = this.cityname;
    return data;
  }
}

class _TempInfo {
  double temp;
  int pressure;
  int humidity;
  double tempMin;
  double tempMax;

  _TempInfo(
      {this.temp, this.pressure, this.humidity, this.tempMin, this.tempMax});

  _TempInfo.fromJson(Map<String, dynamic> json) {
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

class _WindInfo {
  double speed;
  int deg;

  _WindInfo({this.speed, this.deg});

  _WindInfo.fromJson(Map<String, dynamic> json) {
    speed = json['speed'];
    deg = json['deg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['speed'] = this.speed;
    data['deg'] = this.deg;
    return data;
  }
}
