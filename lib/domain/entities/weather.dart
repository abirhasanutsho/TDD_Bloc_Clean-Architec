import 'package:equatable/equatable.dart';

class WeatherEntity extends Equatable {
  const WeatherEntity(
      {required this.cityName,
      required this.main,
      required this.description,
      required this.iconCode,
      required this.tempreture,
      required this.pressure,
      required this.humidity});

  final String cityName;
  final String main;
  final String description;
  final String iconCode;
  final double tempreture;
  final int pressure;
  final int humidity;

  @override
  List<Object?> get props =>
      [cityName, main, description, iconCode, tempreture, pressure, humidity];
}
