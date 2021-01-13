import 'package:flutter/material.dart';
import 'package:flutter_app_mobindustry/bloc/weather_bloc.dart';
import 'package:flutter_app_mobindustry/model/weather.dart';
import 'package:flutter_app_mobindustry/view/details/details_screen.dart';
import 'package:flutter_app_mobindustry/view/main/event/main_screen_event.dart';
import 'package:flutter_app_mobindustry/view/main/state/main_screen_states.dart';
import 'package:flutter_app_mobindustry/view/search_city/search_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _addTapped(context),
      ),
      body: Builder(
        builder: (context) => BlocBuilder<WeatherBloc, MainScreenState>(
            builder: (context, state) => _buildBody(state)),
      ),
    );
  }

  _buildBody(MainScreenState state) {
    if (state is MainScreenEmptyState) {
      return Center(child: Text('Nothing to show'));
    } else if (state is MainScreenLoadingState) {
      return Center(child: CircularProgressIndicator());
    } else if (state is MainScreenWithDataState) {
      return ListView.builder(
          itemCount: state.data.length,
          itemBuilder: (context, index) =>
              _buildWeatherItem(context, state.data[index]));
    }
  }

  _buildWeatherItem(BuildContext context, Weather weather) => Card(
        child: ListTile(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => WeatherDetailsScreen(
                    weather: weather,
                  ))),
          title: Text(weather.cityname),
          trailing: Chip(
            label: Text(
                '${weather.main.tempMax.floor()}/${weather.main.tempMin.floor()}°C'),
          ),
        ),
      );

  _addTapped(BuildContext context) async {
    final result = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => SearchScreen()));

    if (result != null && result is String) {
      BlocProvider.of<WeatherBloc>(context).add(GetWeatherByCityName(result));
    }
  }
}
