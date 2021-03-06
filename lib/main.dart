import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import 'package:vaayu/simple_bloc_delegate.dart';
import 'package:vaayu/themes/colors.dart';
import 'package:vaayu/widgets/widgets.dart';
import 'package:vaayu/repositories/repositories.dart';
import 'package:vaayu/blocs/blocs.dart';

void main() async {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  await DotEnv().load('.env');

  final StationRepository stationRepository = StationRepository(
    aqiClient: AqiClient(
      httpClient: http.Client(),
    ),
  );

  runApp(App(stationRepository: stationRepository));
}

class App extends StatelessWidget {
  final StationRepository stationRepository;

  App({Key key, @required this.stationRepository})
      : assert(stationRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vaayu',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      builder: (context, child) =>
        MediaQuery(data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false), child: child),
      home: BlocProvider(
        create: (context) =>
            StationBloc(stationRepository: stationRepository),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.6, 0.8, 1.0],
              colors: [
                Colors.purple[200],
                Colors.purple[100],
                Colors.purple[50],
              ],
            ),
          ),
          child: Home(),
        )
      ),
    );
  }
}
