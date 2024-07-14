import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yly_app/cubits/get_weather_cubit/get_waether_cubit.dart';
import 'package:yly_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:yly_app/screens/search_screen.dart';
import 'package:yly_app/widgets/no_waether_body.dart';
import 'package:yly_app/widgets/weather_info_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.blue,
            title: const Text(
              'Weather App',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context, MaterialPageRoute(
                    builder: (context) {
                      return const SearchScreen();
                    },
                  ),
                  );
                },
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
            ]),
        body: BlocBuilder<WeatherCubit, InitialState>(
          builder: (context, state) {
            if (state is NoWeatherState) {
              return const NoWeatherBody();
            } else if (state is WeatherLoadedState) {
              return WeatherInfoBody();
            } else {
              return const Center(
                child: Text('oops there was an error'),
              );
            }
          },
        ),
    );
  }
}
