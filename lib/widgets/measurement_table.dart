import 'package:flutter/material.dart';

import 'package:vaayu/themes/colors.dart';
import 'package:vaayu/models/models.dart';

class MeasurementTable extends StatelessWidget {
  final List<Measurement> measurements;
  final List<AqiLevel> aqiLevels = AqiLevel.getAqiLevels();

  MeasurementTable({
    Key key,
    @required this.measurements
  }) : assert(measurements != null), super(key: key);

  @override
  Widget build(BuildContext context) {
    Measurement co = measurements.firstWhere((measurement) =>
      measurement.name == "co"
    );
    measurements.remove(co);

    Measurement no2 = measurements.firstWhere((measurement) =>
      measurement.name == "no2"
    );
    measurements.remove(no2);

    Measurement o3 = measurements.firstWhere((measurement) =>
      measurement.name == "o3"
    );
    measurements.remove(o3);

    Measurement so2 = measurements.firstWhere((measurement) =>
      measurement.name == "so2"
    );
    measurements.remove(so2);

    return Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        TableRow(
          children: [
            Card(
              child: ListTile(
                title: Text(
                  co.name.toUpperCase(),
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey[500]
                  ),
                ),
                subtitle: Row(
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                          Text(
                            co.value.toString(),
                            style: TextStyle(
                              fontSize: 22.0,
                              color: greyColor,
                            ),
                          ),
                          Text(
                            co.unit,
                            style: TextStyle(
                              fontSize: 12.0,
                              color: greyColor,
                            ),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.fromLTRB(4.0, 0, 4.0, 0),
                      margin: EdgeInsets.only(top: 8.0),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: Text(
                  no2.name.toUpperCase(),
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey[500]
                  ),
                ),
                subtitle: Row(
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                          Text(
                            no2.value.toString(),
                            style: TextStyle(
                              fontSize: 22.0,
                              color: greyColor,
                            ),
                          ),
                          Text(
                            no2.unit,
                            style: TextStyle(
                              fontSize: 12.0,
                              color: greyColor,
                            ),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.fromLTRB(4.0, 0, 4.0, 0),
                      margin: EdgeInsets.only(top: 8.0),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            Card(
              child: ListTile(
                title: Text(
                  o3.name.toUpperCase(),
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey[500]
                  ),
                ),
                subtitle: Row(
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                          Text(
                            o3.value.toString(),
                            style: TextStyle(
                              fontSize: 22.0,
                              color: greyColor,
                            ),
                          ),
                          Text(
                            o3.unit,
                            style: TextStyle(
                              fontSize: 12.0,
                              color: greyColor,
                            ),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.fromLTRB(4.0, 0, 4.0, 0),
                      margin: EdgeInsets.only(top: 8.0),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: Text(
                  so2.name.toUpperCase(),
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey[500]
                  ),
                ),
                subtitle: Row(
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                          Text(
                            so2.value.toString(),
                            style: TextStyle(
                              fontSize: 22.0,
                              color: greyColor,
                            ),
                          ),
                          Text(
                            so2.unit,
                            style: TextStyle(
                              fontSize: 12.0,
                              color: greyColor,
                            ),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.fromLTRB(4.0, 0, 4.0, 0),
                      margin: EdgeInsets.only(top: 8.0),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
