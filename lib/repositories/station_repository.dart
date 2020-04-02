import 'dart:async';

import 'package:meta/meta.dart';

import 'package:vaayu/repositories/aqi_client.dart';
import 'package:vaayu/models/models.dart';

class StationRepository {
  final AqiClient aqiClient;

  StationRepository({
    @required this.aqiClient
  }) : assert(aqiClient != null);

  Future<Station> getAqiInfo(Station station) async {
    return await aqiClient.getAqiInfo(station);
  }
}
