import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:vaayu/models/station.dart';

class AqiClient {
  static const String apiHost = 'api.waqi.info';
  final http.Client httpClient;

  AqiClient({
    @required this.httpClient,
  }) : assert(httpClient != null);

  Future<Station> getAqiInfo(Station station) async {
    // make the request
    final Uri apiUrl = Uri(
      scheme: 'https',
      host: apiHost,
      path: '/feed/${station.name}/',
      queryParameters: {'token': DotEnv().env['API_TOKEN']}
    );

    final aqiResponse = await this.httpClient.get(apiUrl);

    if (aqiResponse.statusCode != 200) {
      throw Exception('error getting aqiInfo for station');
    }

    final aqiJson = jsonDecode(aqiResponse.body) as Map;

    if(aqiJson['status'] == 'ok') {
      final aqiData = aqiJson['data'];

      station.aqiValue = aqiData['aqi'];
      station.measurementTime = DateTime.parse(aqiData['time']['s']);
      station.timezone = aqiData['time']['tz'];

      return station;
    } else {
      throw Exception('error getting aqiInfo for station');
    }
  }
}
