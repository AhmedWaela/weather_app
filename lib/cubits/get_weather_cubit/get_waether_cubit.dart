import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yly_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:yly_app/models/weather_model.dart';
import '../../services/weather_services.dart';

class WeatherCubit extends Cubit<InitialState>{
  WeatherCubit(): super (NoWeatherState());

  late WeatherModel weatherModel;
  getCurrentWeather({required String cityName})async{
  try{
     weatherModel =   await WeatherService(Dio()).getWeather(cityName: cityName);
    emit(WeatherLoadedState(weatherModel: weatherModel));
  }catch(e){
    emit(WeatherFailureState());
  }
  }
}