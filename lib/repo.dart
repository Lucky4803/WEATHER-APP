import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_application/weather_model.dart';

class Repo {
  getWeather(String? city) async {
    var url =
        "https://api.openweathermap.org/data/2.5/weather?q=$city&APPID=2135642f4cfdc39f761976b184eb3553";

    final res = await http.get(Uri.parse(url));

    var resBody = res.body;
    print(resBody);
    try {
      if (res.statusCode == 200) {
        return WeatherModel.fromJson(json.decode(resBody));
      }
    } catch (e) {
      throw Exception();
    }
  }
}
