import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:vaayu/widgets/widgets.dart';
import 'package:vaayu/models/models.dart';
import 'package:vaayu/blocs/blocs.dart';

class Home extends StatelessWidget {
  final List<AqiLevel> aqiLevels = AqiLevel.getAqiLevels();
  final List<Station> stationList = Station.getStations();

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<Station>> _stationDropDownItems = [];

    for(Station station in stationList) {
      _stationDropDownItems.add(
        DropdownMenuItem(
          key: Key(station.hashCode.toString()),
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

    return Scaffold(
      appBar: AppBar(
        title: Text('Vaayu'),
      ),
      body: Center(
        child: BlocBuilder<StationBloc, StationState>(
          builder: (context, state) {
            if (state is StationInitial) {
              return ListView(
                children: <Widget>[
                  Center(
                    child: DropdownButton(
                      items: _stationDropDownItems,
                      hint: Text(
                        'Please select a location',
                        style: TextStyle(
                          fontSize: 20.0,
                          letterSpacing: 2.0,
                          color: Colors.grey[800],
                        ),
                      ),
                      autofocus: true,
                      onChanged: (station) =>  {
                        BlocProvider.of<StationBloc>(context).add(FetchStationDetails(station: station))
                      }
                    ),
                  ),
                ]
              );
            }
            if (state is StationLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is StationLoaded) {
              final station = state.station;

              return ListView(
                children: <Widget>[
                  Center(
                    child: DropdownButton(
                      items: _stationDropDownItems,
                      value: state.station,
                      onChanged: (station) =>  {
                        BlocProvider.of<StationBloc>(context).add(FetchStationDetails(station: station))
                      }
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Center(
                      child: StationInfo(station: station),
                    ),
                  ),
                ],
              );
            }
            if (state is StationError) {
              return Text(
                'Something went wrong!',
                style: TextStyle(color: Colors.red),
              );
            }
            return null;
          },
        ),
      ),
    );
  }
}
