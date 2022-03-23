import 'package:bloc/bloc.dart';
import 'package:bloc_freezed/weather_model.dart';
import 'package:bloc_freezed/weather_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_bloc.freezed.dart';
part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository _weatherRepository;
  
  WeatherBloc(
    this._weatherRepository,
  ) : super(const WeatherState.inital()) {
    on<GetWetherEvent>((event, emit) async {
      try{
        emit(const WeatherState.loading());
      final weather = await _weatherRepository.fetchWeather(event.name);
        emit(WeatherState.loaded(weather));
      }on Exception catch (e) {
        emit(WeatherState.error(e.toString()));
      }
    });
  }
}
