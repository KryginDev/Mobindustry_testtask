import 'package:flutter_app_mobindustry/model/weather.dart';

abstract class MainScreenState {}

class MainScreenEmptyState extends MainScreenState {}

class MainScreenLoadingState extends MainScreenState {}

class MainScreenWithDataState extends MainScreenState {
  List<Weather> data;
  MainScreenWithDataState(this.data);
}