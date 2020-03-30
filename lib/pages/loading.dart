import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:vaayu/station.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  final List<Station> stationList = Station.getStations();

  void setupStation(Station station) async {
    await station.getAqiInfo();

    Navigator.pushReplacementNamed(context, '/home', arguments: {'station': station});
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Station station;
    Map stationData = ModalRoute.of(context).settings.arguments;

    if(stationData != null && stationData['station'] != null) {
      station = stationData['station'];
    } else {
      station = stationList[0];
    }

    print(station.name);
    setupStation(station);

    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitThreeBounce(
          color: Colors.white,
          size: 50.0,
        )
      )
    );
  }
}
