import 'package:flutter_app_mobindustry/data/weather_repository.dart';
import 'package:flutter_app_mobindustry/model/weather.dart';
import 'package:flutter_app_mobindustry/view/main/event/main_screen_event.dart';
import 'package:flutter_app_mobindustry/view/main/state/main_screen_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherBloc extends Bloc<MainScreenEvent, MainScreenState> {
  List<Weather> _weatherByCity = [];

  WeatherRepository weatherRepository;

  WeatherBloc(this.weatherRepository) : super(MainScreenEmptyState());

  @override
  Stream<MainScreenState> mapEventToState(MainScreenEvent event) async* {
    if (event is GetWeatherByCityName) {
      yield MainScreenLoadingState();
      final weatherData =
          await weatherRepository.getWeatherByCity(name: event.cityName);
      _weatherByCity.add(weatherData);
      yield MainScreenWithDataState(_weatherByCity);
    }
  }
}
