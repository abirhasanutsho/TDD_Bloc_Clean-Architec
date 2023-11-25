import 'package:dartz/dartz.dart';
import '../../core/error/failer.dart';
import '../entities/weather.dart';

abstract class WeatherRepository {

  Future<Either<Failure,WeatherEntity>> getCurrentWeather(String cityName);
}