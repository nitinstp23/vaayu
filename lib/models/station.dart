import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

// TODO: Fix the immutable warning
class Station extends Equatable{
  final String name;
  final String displayName;
  final String image;
  int aqiValue;
  DateTime measurementTime;
  String timezone;

  Station({
    @required this.name,
    @required this.displayName,
    @required this.image,
    this.aqiValue,
    this.measurementTime,
    this.timezone
  });

  @override
  List<Object> get props => [
    name,
    displayName,
    image,
    aqiValue,
    measurementTime,
    timezone
  ];

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
}
