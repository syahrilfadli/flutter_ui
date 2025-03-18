import 'package:flutter/material.dart';
import 'FlightTextFieldAnimation.dart';

class MulticityInput extends StatefulWidget {
  @override
  MulticityInputState createState() {
    return new MulticityInputState();
  }
}

class MulticityInputState extends State<MulticityInput>
    with TickerProviderStateMixin {
  late AnimationController textInputAnimationController;

  @override
  void initState() {
    super.initState();
    textInputAnimationController = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );
  }

  @override
  void dispose() {
    textInputAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 64.0, 8.0),
              child: TypeableTextFormField(
                finalText: "Indonesia",
                animation: _buildInputAnimation(begin: 0.0, end: 0.2),
                decoration: InputDecoration(
                  icon: Icon(Icons.flight_takeoff, color: Colors.deepPurple),
                  labelText: "From",
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: TypeableTextFormField(
                      animation: _buildInputAnimation(begin: 0.3, end: 0.5),
                      finalText: "New Zealand",
                      decoration: InputDecoration(
                        icon: Icon(Icons.flight_land, color: Colors.deepPurple),
                        labelText: "To",
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 64.0,
                  alignment: Alignment.center,
                  child: IconButton(
                    onPressed: () => textInputAnimationController.forward(),
                    icon: Icon(Icons.add_circle_outline, color: Colors.grey),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 64.0, 8.0),
              child: TypeableTextFormField(
                animation: _buildInputAnimation(begin: 0.45, end: 0.65),
                finalText: "8",
                decoration: InputDecoration(
                  icon: Icon(Icons.person, color: Colors.deepPurple),
                  labelText: "Passengers",
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Icon(Icons.date_range, color: Colors.deepPurple),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 0.0, 64.0, 8.0),
                    child: TypeableTextFormField(
                      animation: _buildInputAnimation(begin: 0.6, end: 0.8),
                      finalText: "25 May 2021",
                      decoration: InputDecoration(labelText: "Departure"),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Icon(Icons.date_range, color: Colors.deepPurple),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 0.0, 64.0, 8.0),
                    child: TypeableTextFormField(
                      animation: _buildInputAnimation(begin: 0.75, end: 0.95),
                      finalText: "27 May 2021",
                      decoration: InputDecoration(labelText: "Arrival"),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  CurvedAnimation _buildInputAnimation({
    required double begin,
    required double end,
  }) {
    return new CurvedAnimation(
      parent: textInputAnimationController,
      curve: Interval(begin, end, curve: Curves.linear),
    );
  }
}
