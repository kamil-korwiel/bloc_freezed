part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class GetWetherEvent extends WeatherEvent {
  final name;
  const GetWetherEvent(this.name);
}

