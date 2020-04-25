import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:vaayu/models/models.dart';
import 'dart:convert';

class AqiClient {
  static const String apiHost = 'api.openaq.org';
  final http.Client httpClient;

  AqiClient({
    @required this.httpClient,
  }) : assert(httpClient != null);

  Future<List<Measurement>> getAqiInfo(Station station) async {
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
      List<Measurement> measurements = [];

      for(Map m in aqiJson['results'][0]['measurements']) {
        final String name = m['parameter'];
        final double value = m['value'].toDouble();
        final DateTime lastUpdated = DateTime.parse(m['lastUpdated']);
        final String unit = m['unit'];

        Measurement measurement = Measurement(name: name, value: value, lastUpdated: lastUpdated, unit: unit);
        measurements.add(measurement);
      }

      return measurements;
    } else {
      throw Exception('error getting aqiInfo for station');
    }
  }
}
