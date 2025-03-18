import 'package:flutter/material.dart';
import 'package:flutter_ui/AppFeature/Constant/AppKitColor.dart';
import 'package:flutter_ui/AppFeature/Constant/AppKitFunction.dart';
import 'package:flutter_ui/AppFeature/AppkitScreen/Screen/AppKitAppbar.dart';
import 'package:flutter_ui/AppFeature/AppkitScreen/Widget/AppKitListTile.dart';
import 'package:flutter_ui/AppFeature/UIScreens/TravelUI/TravelUI1/ui/screens/homeScreen.dart';
import 'package:flutter_ui/AppFeature/UIScreens/flightUI/Screens/FlightHomePage.dart';

import 'TravelUI2/TourUIFirst.dart';

class TravelUIPath extends StatelessWidget {
  TravelUIPath({Key? key}) : super(key: key);

  List wrNewComponents = [
    {'route': HomeScreen(), 'title': "TravelUI 1"},
    {'route': TourUIFirst(), 'title': "TravelUI 2"},
    {'route': FlightHomePage(), 'title': "Flight UI"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppKitAppbar(title: "Travel UI"),
      ),
      body: appWidget(),
    );
  }

  Widget appWidget() {
    return ListView.builder(
      itemCount: wrNewComponents.length,
      itemBuilder: (BuildContext context, int index) {
        Color bg = tilecolor[index % tilecolor.length];
        Color iconbg = tileiconbgcolor[index % tileiconbgcolor.length];
        Color textcolor = tiletextcolor[index % tiletextcolor.length];
        getletter(wrNewComponents[index]['title']);

        return Padding(
          padding: EdgeInsets.only(bottom: 10.0),
          child: ListTileUI(
            iconTitle: strs,
            title: wrNewComponents[index]['title'],
            color: bg,
            iconbg: iconbg,
            textcolor: textcolor,
            ontap: wrNewComponents[index]['route'],
          ),
        );
      },
    );
  }
}
