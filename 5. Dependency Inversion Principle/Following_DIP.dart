abstract class WeatherService {
  Future<String> getWeather();
}

class OpenWeatherMapService implements WeatherService {
  @override
  Future<String> getWeather() {
    // Fetch weather data from OpenWeatherMap
    return Future.delayed(Duration.zero);
  }
}

class WeatherApp {
  final WeatherService weatherService;

  WeatherApp(this.weatherService);

  Future<void> displayWeather() async {
    final weather = await weatherService.getWeather();
    print('Weather: $weather');
  }
}
