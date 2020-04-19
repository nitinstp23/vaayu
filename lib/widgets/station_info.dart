import 'package:flutter/material.dart';

import 'package:vaayu/themes/colors.dart';
import 'package:vaayu/widgets/widgets.dart';
import 'package:vaayu/models/models.dart';

class StationInfo extends StatelessWidget {
  final Station station;
  final List<AqiLevel> aqiLevels = AqiLevel.getAqiLevels();

  StationInfo({Key key, @required this.station})
      : assert(station != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    AqiLevel aqiLevel = aqiLevels.firstWhere((aqiLevel) =>
      station.aqiValue >= aqiLevel.min  && station.aqiValue <= aqiLevel.max
    );

    return Column(
      children: <Widget>[
        RadialAqiValue(aqiValue: station.aqiValue),
        SizedBox(height: 20.0),
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
                      aqiLevel.statusText().toUpperCase(),
                      style: TextStyle(
                        fontSize: aqiLevel.fontSize,
                        color: Colors.white,
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
                    color: greyColor
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
                    color: greyColor
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
                  TimeOfDay.fromDateTime(station.measurementTime).format(context),
                  style: TextStyle(
                    fontSize: 18.0,
                    color: greyColor
                  )
                ),
              ),
            ),
          ),
        ),
      ]
    );
  }
}
