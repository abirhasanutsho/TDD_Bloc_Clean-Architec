import '../../domain/entities/weather.dart';

class WeatherModel extends WeatherEntity {
  const WeatherModel(
      {required String cityName,
      required String main,
      required String description,
      required String iconCode,
      required double tempreture,
      required int pressure,
      required int humidity})
      : super(
            cityName: cityName,
            main: main,
            description: description,
            iconCode: iconCode,
            tempreture: tempreture,
            pressure: pressure,
            humidity: humidity);

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        cityName: json['name'],
        main: json['weather'][0]['main'],
        description: json['weather'][0]['description'],
        iconCode: json['weather'][0]['icon'],
        tempreture: json['main']['temp'],
        pressure: json['main']['pressure'],
        humidity: json['main']['humidity'],
      );

  Map<String, dynamic> toJson() => {
        'weather': [
          {
            'main': main,
            'description': description,
            'icon': iconCode,
          },
        ],
        'main': {
          'temp': tempreture,
          'pressure': pressure,
          'humidity': humidity,
        },
        'name': cityName,
      };

  WeatherEntity toEntity() => WeatherEntity(
        cityName: cityName,
        main: main,
        description: description,
        iconCode: iconCode,
        tempreture: tempreture,
        pressure: pressure,
        humidity: humidity,
      );
}
