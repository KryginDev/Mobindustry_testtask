import 'package:flutter_app_mobindustry/utilities/double_parser.dart';

class WindInfo {
  double speed;
  int deg;

  WindInfo({this.speed, this.deg});

  WindInfo.fromJson(Map<String, dynamic> json) {
    speed = DoubleParser.parse(json['speed']);
    deg = json['deg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['speed'] = this.speed;
    data['deg'] = this.deg;
    return data;
  }
}