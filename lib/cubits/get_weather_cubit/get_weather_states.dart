
import 'package:yly_app/models/weather_model.dart';

class InitialState{}

class NoWeatherState extends InitialState{}
class WeatherLoadedState extends InitialState{
  final WeatherModel weatherModel;

  WeatherLoadedState({required this.weatherModel});
}
class WeatherFailureState extends InitialState{}