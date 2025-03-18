import 'package:flutter/material.dart';

class FlightAppbarDesign extends StatelessWidget {
  final double height;
  final bool back;
  const FlightAppbarDesign({Key ?key, required this.height,required this.back}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        new Container(
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.deepPurple, const Color(0xFFE64C85)],
            ),
          ),
          height: height,
        ),
        new AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: true,
          elevation: 0.0,
          centerTitle: true,
          /*leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.white,), onPressed: () {
            Navigator.pop(context,true);
          },),*/
          title: new Text(
            "Flight",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
