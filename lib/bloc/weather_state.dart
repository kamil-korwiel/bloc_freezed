part of 'weather_bloc.dart';

@freezed
class WeatherState with _$WeatherState {
  const factory WeatherState.inital() = _WeatherInitial;
  const factory WeatherState.loading() = _WeatherLoading;
  const factory WeatherState.loaded(Weather weather) = _WeatherLoaded;
  const factory WeatherState.error(String message) = _WeatherError;
}
