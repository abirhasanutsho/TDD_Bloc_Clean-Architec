import 'package:dartz/dartz.dart';
import 'package:tdd_pattern_bloc/core/error/failer.dart';
import 'package:tdd_pattern_bloc/domain/entities/weather.dart';
import 'package:tdd_pattern_bloc/domain/repositories/weather_repository.dart';

class GetCurrentWeather {
  final WeatherRepository _weatherRepositories;
  const GetCurrentWeather(this._weatherRepositories);

  Future<Either<Failure, WeatherEntity>?> execute(String cityName) {
    return _weatherRepositories.getCurrentWeather(cityName);
  }
}
