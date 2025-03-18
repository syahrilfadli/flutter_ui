import 'package:flutter/material.dart';
import 'package:flutter_ui/AppFeature/UIScreens/flightUI/helperAndAnimation/FlightAppbarDesign.dart';
import 'package:flutter_ui/AppFeature/UIScreens/flightUI/helperAndAnimation/FlightListCard.dart';

class FlightHomePage extends StatefulWidget {
  @override
  State<FlightHomePage> createState() => _FlightHomePageState();
}

class _FlightHomePageState extends State<FlightHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          FlightAppbarDesign(height: 210.0, back: true),
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 40.0,
              ),
              child: Column(children: [Expanded(child: ContentCard())]),
            ),
          ),
        ],
      ),
    );
  }
}
