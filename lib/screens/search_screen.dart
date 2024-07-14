
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yly_app/cubits/get_weather_cubit/get_waether_cubit.dart';
import 'package:yly_app/services/weather_services.dart';
import 'home_screen.dart';

class SearchScreen extends StatelessWidget{
  const SearchScreen({super.key});
  @override
  Widget build(context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 30,
          ),
        ),
        title: const Text(
            'Search a City',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            )
        ),
      ),
      body:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: TextField(
            onSubmitted: (value) async{
          var getWeatherCubit =  BlocProvider.of<WeatherCubit>(context).getCurrentWeather(cityName: value);

        Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 32,horizontal: 16
              ),
              labelText: 'Search',
              suffixIcon: IconButton(
                  onPressed: () {

                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.search)),
              hintText: 'Enter City Name',
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.green
                ),
              ),
            ),
          ),
        ),
      )
    );
  }
}

