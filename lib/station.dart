import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class Station {
  String name;
  String displayName;
  String image;
  int aqiValue;
  String measurementTime;
  String timezone;

  Station({ this.name, this.displayName, this.image });

  final String apiHost = 'api.waqi.info';
  final String apiToken = 'api-token';

  static List<Station> getStations() {
    return [
      Station(name: 'bangalore', displayName: 'Bengaluru', image: ''),
      Station(name: 'chennai', displayName: 'Chennai', image: ''),
      Station(name: 'gurgaon', displayName: 'Gurugram', image: ''),
      Station(name: 'hyderabad', displayName: 'Hyderabad', image: ''),
      Station(name: 'kolkata', displayName: 'Kolkata', image: ''),
      Station(name: 'mumbai', displayName: 'Mumbai', image: ''),
      Station(name: 'delhi', displayName: 'New Delhi', image: ''),
    ];
  }

  Future<void> getAqiInfo() async {
    try {
      // make the request
      Uri apiUrl = Uri(scheme: 'https', host: apiHost, path: '/feed/$name/', queryParameters: {'token': apiToken});
      print(apiUrl);
      Response response = await get(apiUrl);
      print(response);
      Map data = jsonDecode(response.body);

      if(data['status'] == 'ok') {
        data = data['data'];

        // set the aqi property
        aqiValue = data['aqi'];

        // set the time property
        measurementTime = DateFormat.jm().format(DateTime.parse(data['time']['s']));

        // get properties from json
        timezone = data['time']['tz'];
      }
    }
    catch (e) {
      print(e);
    }
  }

  @override
  int get hashCode => name.hashCode ^ aqiValue.hashCode;

  @override
  bool operator ==(o) => o is Station && name == o.name;
}
