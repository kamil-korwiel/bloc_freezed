

import 'package:bloc_freezed/weather_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/weather_bloc.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => WeatherBloc(FakeWeatherRepository()),
        child: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            return state.when(
              inital: () => const FomatedText(text: 'Push Button',), 
              loading: () =>  const SizedBox(child: CircularProgressIndicator(),height: 100.0,width: 100.0,),
              loaded: (weather) => FomatedText(text: "In City ' ${weather.cityName} ' is right now ${weather.temperatureCelsius.toStringAsFixed(2)} \u2103"), 
              error: (e) => FomatedText(text: e.toString(),)
              );
          },
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          BlocProvider.of<WeatherBloc>(context).add(const WeatherEvent.get("TOR"));
        },
        tooltip: 'New request',
        child: const Icon(Icons.refresh_sharp),
        )
    );
  }
}

class FomatedText extends StatelessWidget {
  const FomatedText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(text,
                overflow: TextOverflow.visible,
                style: const TextStyle(fontSize: 24.0),
                textAlign: TextAlign.center,),
              );
}
