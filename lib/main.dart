import 'package:flutter/material.dart';
import 'package:vaayu/pages/home.dart';
import 'package:vaayu/pages/loading.dart';
import 'package:vaayu/station.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/loading': (context) => Loading(),
      '/home': (context) => Home(),
    },
  ));
}
