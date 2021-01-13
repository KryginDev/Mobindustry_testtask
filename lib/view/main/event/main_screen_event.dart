abstract class MainScreenEvent {}

class GetWeatherByCityName extends MainScreenEvent {
  String cityName;

  GetWeatherByCityName(this.cityName);
}
