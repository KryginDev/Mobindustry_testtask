import 'package:flutter/material.dart';
import 'package:flutter_app_mobindustry/bloc/weather_bloc.dart';
import 'package:flutter_app_mobindustry/data/weather_repository.dart';
import 'package:flutter_app_mobindustry/view/main/main_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

main() => runApp(Application());

class Application extends StatefulWidget {
  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherBloc(WeatherRepository()),
      child: MaterialApp(
        home: MainScreen(),
      ),
    );
  }
}
