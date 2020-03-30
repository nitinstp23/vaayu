import 'package:flutter/material.dart';
import 'package:vaayu/aqi_level.dart';
import 'package:vaayu/station.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<AqiLevel> aqiLevels = AqiLevel.getAqiLevels();
  final List<Station> stationList = Station.getStations();

  Station _selectedStation;
  List<DropdownMenuItem<Station>> _stationDropDownItems;

  @override
  void initState() {
    _stationDropDownItems = buildStationDropDownItems(stationList);

    super.initState();
  }

  List<DropdownMenuItem<Station>> buildStationDropDownItems(List<Station> stations) {
    List<DropdownMenuItem<Station>> items = List();

    for(Station station in stations) {
      items.add(
        DropdownMenuItem(
          value: station,
          child: Text(
            station.displayName,
            style: TextStyle(
              fontSize: 28.0,
              letterSpacing: 2.0,
              color: Colors.grey[800],
            ),
          )
        )
      );
    }

    return items;
  }

  changeStation(Station station) {
    Navigator.pushNamed(context, '/loading', arguments: {'station': station});
  }

  @override
  Widget build(BuildContext context) {
    Map stationData = ModalRoute.of(context).settings.arguments;

    _selectedStation = stationData['station'];
    int aqiValue = _selectedStation.aqiValue;

    AqiLevel aqiLevel = aqiLevels.firstWhere((aqiLevel) =>
      aqiValue >= aqiLevel.min  && aqiValue <= aqiLevel.max
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    DropdownButton(
                      items: _stationDropDownItems,
                      value: _selectedStation,
                      onChanged: changeStation,
                    ),
                  ],
                ),
                SizedBox(height: 50.0),
                Text(
                  '(AQI)',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.grey[800]
                  )
                ),
                Container(
                  child: Text(
                    '$aqiValue',
                    style: TextStyle(
                      fontSize: 86.0,
                      color: Colors.grey[800]
                    )
                  ),
                ),
                SizedBox(height: 50.0),
                Container(
                  child: Card(
                    child: ListTile(
                      title: Text(
                        'Overall Status',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey[500]
                        )
                      ),
                      subtitle: Row(
                        children: <Widget>[
                          Container(
                            child: Text(
                              aqiLevel.name,
                              style: TextStyle(
                                fontSize: aqiLevel.fontSize,
                                color: Colors.white
                              )
                            ),
                            decoration: BoxDecoration(
                              color: aqiLevel.color
                            ),
                            padding: EdgeInsets.fromLTRB(4.0, 0, 4.0, 0),
                            margin: EdgeInsets.only(top: 8.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Card(
                    child: ListTile(
                      title: Text(
                        'Health Implications',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey[500]
                        )
                      ),
                      subtitle: Container(
                        margin: EdgeInsets.only(top: 8.0),
                        child: Text(
                          aqiLevel.healthImplications,
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.grey[800]
                          )
                        ),
                      ),
                      isThreeLine: true,
                    ),
                  ),
                ),
                Container(
                  child: Card(
                    child: ListTile(
                      title: Text(
                        'Cautionary Statement',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey[500]
                        )
                      ),
                      subtitle: Container(
                        margin: EdgeInsets.only(top: 8.0),
                        child: Text(
                          aqiLevel.cautionaryStatement,
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.grey[800]
                          )
                        ),
                      ),
                      isThreeLine: true,
                    ),
                  ),
                ),
                Container(
                  child: Card(
                    child: ListTile(
                      title: Text(
                        'Measurement Time',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey[500]
                        )
                      ),
                      subtitle: Container(
                        margin: EdgeInsets.only(top: 8.0),
                        child: Text(
                          _selectedStation.measurementTime,
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.grey[800]
                          )
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Card(
                    child: ListTile(
                      title: Text(
                        'Time Zone',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey[500]
                        )
                      ),
                      subtitle: Container(
                        margin: EdgeInsets.only(top: 8.0),
                        child: Text(
                          'UTC $_selectedStation.timezone',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.grey[800]
                          )
                        ),
                      ),
                    ),
                  ),
                ),
              ]
            )
          ),
        )
      ),
    );
  }
}
