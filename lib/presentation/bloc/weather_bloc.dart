
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tdd_pattern_bloc/domain/usecase/getCurrentWather.dart';
import 'package:tdd_pattern_bloc/presentation/bloc/weather_event.dart';
import 'package:tdd_pattern_bloc/presentation/bloc/weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetCurrentWeather getCurrentWeather;
  WeatherBloc(this.getCurrentWeather) : super(const WeatherEmpty()) {
    on<OnCityChange>(
      (event, emit) async {
        emit(const WeatherLoading());
        final result = await getCurrentWeather.execute(event.cityName);
        result!.fold(
          (failure) {
            emit(WeatherFailure(failure.message));
          },
          (data) {
            emit(WeatherLoaded(data));
          },
        );
      },
      transformer: debounce(const Duration(milliseconds: 500)),
    );
  }
}

EventTransformer<T> debounce<T>(Duration duration) {
  return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
}
