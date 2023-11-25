import 'package:get_it/get_it.dart';
import 'package:tdd_pattern_bloc/data/data_sources/remote_data_sources.dart';
import 'data/repositories/weather_repositories_impl.dart';
import 'domain/repositories/weather_repository.dart';
import 'domain/usecase/getCurrentWather.dart';
import 'presentation/bloc/weather_bloc.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;

void setupLocator() {
  // bloc
  locator.registerFactory(() => WeatherBloc(locator()));

  // usecase
  locator.registerLazySingleton(() => GetCurrentWeather(locator()));

  // repository
  locator.registerLazySingleton<WeatherRepository>(
    () => WeatherRepositoryImpl(weatherRemoteDataSource: locator()),
  );

  // data source
  locator.registerLazySingleton<WeatherRemoteDataSources>(
    () => WeatherRemoteDataSourceImpl(
      client: locator(),
    ),
  );

  // external
  locator.registerLazySingleton(() => http.Client());
}
