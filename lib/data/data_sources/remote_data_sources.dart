import 'dart:convert';
import 'package:tdd_pattern_bloc/core/constnce/constance.dart';
import 'package:tdd_pattern_bloc/core/error/server_exception.dart';
import 'package:tdd_pattern_bloc/data/models/weather_model.dart';
import 'package:http/http.dart' as http;

abstract class WeatherRemoteDataSources {
  Future<WeatherModel> getWeatherRemoteData(String name);
}

class WeatherRemoteDataSourceImpl extends WeatherRemoteDataSources {
  final http.Client client;
  WeatherRemoteDataSourceImpl({required this.client});
  @override
  Future<WeatherModel> getWeatherRemoteData(String name) async {
    final response =
        await client.get(Uri.parse(Urls.currentWeatherByName(name)));
    if (response.statusCode == 200) {
      return WeatherModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
