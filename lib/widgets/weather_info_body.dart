import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yly_app/cubits/get_weather_cubit/get_waether_cubit.dart';

class WeatherInfoBody extends StatelessWidget {
   WeatherInfoBody({super.key});
  @override
  Widget build(BuildContext context) {
   var weatherModel = BlocProvider.of<WeatherCubit>(context).weatherModel;
    return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(weatherModel.cityName,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32
            ),),
             Text(
                'updated at: ${weatherModel.date.hour}:${weatherModel.date.minute}',
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network('https:${weatherModel.image}'),
                Text('${weatherModel.temp}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),),
                Column(
                  children: [
                    Text('Maxtemp : ${weatherModel.maxTemp.round()}',style: TextStyle(fontSize: 16),),
                    Text('Mintemp : ${weatherModel.minTemp.round()}',style: TextStyle(fontSize: 16),),
                  ],
                ),
              ],
            ),
            Text(
                weatherModel.weatherCondition,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32
              ),
            ),
          ],
        ),
      );
  }
}