import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

class Station extends Equatable{
  final String name;
  final String displayName;
  final String image;

  Station({
    @required this.name,
    @required this.displayName,
    @required this.image,
  });

  @override
  List<Object> get props => [
    name,
    displayName,
    image,
  ];

  static List<Station> getStations() {
    return [
      Station(name: 'Bengaluru', displayName: 'Bengaluru', image: ''),
      Station(name: 'Chennai', displayName: 'Chennai', image: ''),
      Station(name: 'Delhi', displayName: 'New Delhi', image: ''),
      Station(name: 'Gurgaon', displayName: 'Gurugram', image: ''),
      Station(name: 'Hyderabad', displayName: 'Hyderabad', image: ''),
      Station(name: 'Kolkata', displayName: 'Kolkata', image: ''),
      Station(name: 'Mumbai', displayName: 'Mumbai', image: ''),
      Station(name: 'Pune', displayName: 'Pune', image: ''),
    ];
  }
}
