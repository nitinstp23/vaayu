import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

class Measurement extends Equatable{
  final String name;
  final double value;
  final DateTime lastUpdated;
  final String unit;


  Measurement({
    @required this.name,
    @required this.value,
    @required this.lastUpdated,
    @required this.unit,
  });

  @override
  List<Object> get props => [
    name,
    value,
    lastUpdated,
    unit,
  ];
}
