import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:tdd_pattern_bloc/data/data_sources/remote_data_sources.dart';

import '../../core/error/failer.dart';
import '../../core/error/server_exception.dart';
import '../../domain/entities/weather.dart';
import '../../domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  final WeatherRemoteDataSources weatherRemoteDataSource;
  WeatherRepositoryImpl({required this.weatherRemoteDataSource});

  @override
  Future<Either<Failure, WeatherEntity>> getCurrentWeather(
      String cityName) async {
    try {
      final result =
          await weatherRemoteDataSource.getWeatherRemoteData(cityName);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure('An error has occurred'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
