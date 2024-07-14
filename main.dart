import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yly_app/screens/home_screen.dart';

import 'cubits/get_weather_cubit/get_waether_cubit.dart';

void main(){

  runApp(const WeatherApp());

}

class WeatherApp extends StatelessWidget{
  const WeatherApp({super.key});

  @override
  Widget build(context){
    return BlocProvider(
      create: (context) => WeatherCubit(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
