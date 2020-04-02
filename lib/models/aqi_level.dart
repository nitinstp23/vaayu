import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

enum AqiStatus {
  great,
  good,
  moderate,
  unhealthy_for_sensitive_groups,
  unhealthy,
  very_unhealthy,
  hazardous
}

class AqiLevel extends Equatable {
  final int min;
  final int max;
  final Color color;
  final AqiStatus status;
  final double fontSize;
  final String healthImplications;
  final String cautionaryStatement;

  const AqiLevel({
    this.min,
    this.max,
    this.status,
    this.color,
    this.fontSize,
    this.healthImplications,
    this.cautionaryStatement
  });

  @override
  List<Object> get props => [
    min,
    max,
    status,
    color,
    fontSize,
    healthImplications,
    cautionaryStatement
  ];

  static List<AqiLevel> getAqiLevels() {
    return <AqiLevel>[
      AqiLevel(min: 0, max: 30, status: AqiStatus.great, color: Colors.blue[400], fontSize: 26.0, healthImplications: 'Air quality is excellent and air pollution poses no risk', cautionaryStatement: 'None'),
      AqiLevel(min: 30, max: 50, status: AqiStatus.good, color: Colors.green[400], fontSize: 26.0, healthImplications: 'Air quality is considered satisfactory and air pollution poses little or no risk', cautionaryStatement: 'None'),
      AqiLevel(min: 51, max: 100, status: AqiStatus.moderate, color: Colors.yellow[600], fontSize: 26.0, healthImplications: 'Air quality is acceptable, however for some pollutants there may be a moderate health concern for a very small number of people who are unusually sensitive to air pollution', cautionaryStatement: 'Active children and adults, and people with respiratory disease, such as asthma, should limit prolonged outdoor exertion'),
      AqiLevel(min: 101, max: 150, status: AqiStatus.unhealthy_for_sensitive_groups, color: Colors.orange[400], fontSize: 20.0, healthImplications: 'Members of sensitive groups may experience health effects. The general public is not likely to be affected', cautionaryStatement: 'Active children and adults, and people with respiratory disease, such as asthma, should limit prolonged outdoor exertion'),
      AqiLevel(min: 151, max: 200, status: AqiStatus.unhealthy, color: Colors.red[400], fontSize: 26.0, healthImplications: 'Everyone may begin to experience health effects, members of sensitive groups may experience more serious health effects', cautionaryStatement: 'Active children and adults, and people with respiratory disease, such as asthma, should avoid prolonged outdoor exertion; everyone else, especially children, should limit prolonged outdoor exertion'),
      AqiLevel(min: 201, max: 300, status: AqiStatus.very_unhealthy, color: Colors.purple[400], fontSize: 26.0, healthImplications: 'Health warnings of emergency conditions. The entire population is more likely to be affected', cautionaryStatement: 'Active children and adults, and people with respiratory disease, such as asthma, should avoid all outdoor exertion; everyone else, especially children, should limit outdoor exertion'),
      AqiLevel(min: 301, max: 999999999, status: AqiStatus.hazardous, color: Colors.red[900], fontSize: 26.0, healthImplications: 'Health alert: everyone may experience more serious health effects', cautionaryStatement: 'Everyone should avoid all outdoor exertion'),
    ];
  }

  String statusText() {
    return this.status.toString().split('.')[1];
  }
}
