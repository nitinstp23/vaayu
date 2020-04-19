import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:vaayu/models/station.dart';

class AqiClient {
  static const String apiHost = 'api.openaq.org';
  final http.Client httpClient;

  AqiClient({
    @required this.httpClient,
  }) : assert(httpClient != null);

  Future<Station> getAqiInfo(Station station) async {
    // make the request
    final Uri apiUrl = Uri(
      scheme: 'https',
      host: apiHost,
      path: 'v1/latest',
      queryParameters: {'country': 'IN', 'city': '${station.name}', 'limit': '1'}
    );

    final aqiResponse = await this.httpClient.get(apiUrl);

    if (aqiResponse.statusCode != 200) {
      throw Exception('error getting aqiInfo for station');
    }

    final aqiJson = jsonDecode(aqiResponse.body) as Map;

    print(aqiJson);
    if(aqiJson['results'].isNotEmpty) {
      final measurements = aqiJson['results'][0]['measurements'];

      final pm25Data = measurements.firstWhere((measurement) => measurement['parameter'] == "pm25");

      station.aqiValue = pm25Data['value'].toDouble();
      station.measurementTime = DateTime.parse(pm25Data['lastUpdated']);

      return station;
    } else {
      throw Exception('error getting aqiInfo for station');
    }
  }
}
