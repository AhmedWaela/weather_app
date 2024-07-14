import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:yly_app/models/weather_model.dart';

class WeatherService{
 WeatherService(this.dio);
  final Dio dio;
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '46256e4d7d4a4d81aea174222242206';
 Future<WeatherModel> getWeather({required String cityName})async {
  try{
   Response response = await dio.get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
   WeatherModel weatherModel = WeatherModel.fromJson(response.data);
   return weatherModel;
  }on DioException catch(e){
   final String errorMessage= e.response?.data['error']['message'] ?? 'uuu ';
   throw Exception(errorMessage);
  }catch(e){
   log(e.toString());
   throw Exception('oops there was an error');
  }
 }
}

