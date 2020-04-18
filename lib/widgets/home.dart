import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:vaayu/themes/colors.dart';
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
          value: station,
          child: Center(
            child: Text(
              station.displayName,
              style: TextStyle(
                fontSize: 20.0,
                letterSpacing: 1.0,
                color: greyColor,
              ),
            ),
          ),
        )
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Vaayu'),
        ),
      ),
      body: Center(
        child: BlocBuilder<StationBloc, StationState>(
          builder: (context, state) {
            if (state is StationInitial) {
              Station defaultStation = _stationDropDownItems[0].value;
              BlocProvider
                .of<StationBloc>(context)
                .add(FetchStationDetails(station: defaultStation));

              return Center(child: CircularProgressIndicator());
            }
            if (state is StationLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is StationLoaded) {
              final station = state.station;

              return ListView(
                children: <Widget>[
                  Center(
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        items: _stationDropDownItems,
                        value: state.station,
                        onChanged: (station) =>  {
                          BlocProvider
                            .of<StationBloc>(context)
                            .add(FetchStationDetails(station: station))
                        }
                      ),
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
