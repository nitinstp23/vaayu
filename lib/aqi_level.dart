import 'dart:ui';
import 'package:flutter/material.dart';

class AqiLevel {
  int min;
  int max;
  Color color;
  String name;
  double fontSize;
  String healthImplications;
  String cautionaryStatement;

  AqiLevel({ this.min, this.max, this.name, this.color, this.fontSize, this.healthImplications, this.cautionaryStatement });

  static List<AqiLevel> getAqiLevels() {
    return <AqiLevel>[
      AqiLevel(min: 0, max: 30, name: 'Great', color: Colors.blue[400], fontSize: 26.0, healthImplications: 'Air quality is excellent', cautionaryStatement: 'None'),
      AqiLevel(min: 30, max: 50, name: 'Good', color: Colors.green[400], fontSize: 26.0, healthImplications: 'Air quality is considered satisfactory, and air pollution poses little or no risk', cautionaryStatement: 'None'),
      AqiLevel(min: 51, max: 100, name: 'Moderate', color: Colors.yellow[600], fontSize: 26.0, healthImplications: 'Air quality is acceptable, however for some pollutants there may be a moderate health concern for a very small number of people who are unusually sensitive to air pollution', cautionaryStatement: 'Active children and adults, and people with respiratory disease, such as asthma, should limit prolonged outdoor exertion'),
      AqiLevel(min: 101, max: 150, name: 'Unhealthy for Sensitive Groups', color: Colors.orange[400], fontSize: 20.0, healthImplications: 'Members of sensitive groups may experience health effects. The general public is not likely to be affected', cautionaryStatement: 'Active children and adults, and people with respiratory disease, such as asthma, should limit prolonged outdoor exertion'),
      AqiLevel(min: 151, max: 200, name: 'Unhealthy', color: Colors.red[400], fontSize: 26.0, healthImplications: 'Everyone may begin to experience health effects; members of sensitive groups may experience more serious health effects', cautionaryStatement: 'Active children and adults, and people with respiratory disease, such as asthma, should avoid prolonged outdoor exertion; everyone else, especially children, should limit prolonged outdoor exertion'),
      AqiLevel(min: 201, max: 300, name: 'Very Unhealthy', color: Colors.purple[400], fontSize: 26.0, healthImplications: 'Health warnings of emergency conditions. The entire population is more likely to be affected', cautionaryStatement: 'Active children and adults, and people with respiratory disease, such as asthma, should avoid all outdoor exertion; everyone else, especially children, should limit outdoor exertion'),
      AqiLevel(min: 301, max: 999999999, name: 'Hazardous', color: Colors.red[900], fontSize: 26.0, healthImplications: 'Health alert: everyone may experience more serious health effects', cautionaryStatement: 'Everyone should avoid all outdoor exertion'),
    ];
  }
}
