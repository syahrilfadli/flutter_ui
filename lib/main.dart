import 'package:flutter/material.dart';
import 'package:flutter_ui/AppFeature/UIScreens/flightUI/Screens/FlightHomePage.dart';
import 'package:flutter_ui/AppFeature/UIScreens/TravelUI/TravelUIPath.dart';
import 'package:flutter_ui/AppFeature/UIScreens/TravelUI/TravelUI1/ui/screens/homeScreen.dart';
import 'package:flutter_ui/AppFeature/UIScreens/TravelUI/TravelUI2/TourUIFirst.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TravelUIPath(),
      title: 'Flight Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routes: {
        '/flight': (context) => FlightHomePage(),
        '/travelui1': (context) => HomeScreen(),
        '/travelui2': (context) => TourUIFirst(),
      },
    );
  }
}
