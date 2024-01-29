import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weather_app_2_provider/models/weather_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app_2_provider/secrets/api.dart';

class WeatherServiceProvider extends ChangeNotifier {
  WeatherModel? _weather;

  WeatherModel? get weather => _weather;

  bool _isLoading = false;

  bool? get isLoading => _isLoading;

  String _error = "";

  String get error => _error;

  Future<void> fetchWeatherDataByCity(String city) async {
    _isLoading = true;
    _error = "";
    try {
      final String apiUrl =
          "${APIEndpoints().cityUrl}${city}&appid=${APIEndpoints().apikey}${APIEndpoints().unit}";
          print(apiUrl);
      /// this is how we have to hit the url
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        print(data);

        _weather = WeatherModel.fromJson(data);
        notifyListeners();
      } else {
        _error = "failed to load data";
      }
    } catch (e) {
      _error = "Failed to load data $e";
    } finally {
      _isLoading = false;
    }
  }
}
