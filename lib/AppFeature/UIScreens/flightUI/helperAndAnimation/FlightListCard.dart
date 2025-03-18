import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../Screens/FlightSecondScreen.dart';

import 'FlightTextFieldEnter.dart';

class ContentCard extends StatefulWidget {
  @override
  _ContentCardState createState() => _ContentCardState();
}

class _ContentCardState extends State<ContentCard> {
  bool showInput = true;
  bool showInputTabOptions = true;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (!showInput) {
          setState(() {
            showInput = true;
            showInputTabOptions = true;
          });
          return Future(() => false);
        } else {
          return Future(() => true);
        }
      },
      child: new Card(
        elevation: 4.0,
        margin: const EdgeInsets.all(8.0),
        child: new LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return Column(
              children: <Widget>[_buildContentContainer(viewportConstraints)],
            );
          },
        ),
      ),
    );
  }

  Widget _buildContentContainer(BoxConstraints viewportConstraints) {
    return Expanded(
      child: SingleChildScrollView(
        child: new ConstrainedBox(
          constraints: new BoxConstraints(
            minHeight: viewportConstraints.maxHeight - 80.0,
          ),
          child: new IntrinsicHeight(
            child:
                showInput
                    ? _buildMulticityTab()
                    : FlightSecondScreen(
                      height: viewportConstraints.maxHeight - 80.0,
                      onPlaneFlightStart:
                          () => setState(() => showInputTabOptions = false),
                    ),
          ),
        ),
      ),
    );
  }

  Widget _buildMulticityTab() {
    return Column(
      children: <Widget>[
        MulticityInput(),
        Expanded(child: Container()),
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0, top: 8.0),
          child: FloatingActionButton(
            backgroundColor: Colors.deepPurple,
            onPressed: () => setState(() => showInput = false),
            child: Icon(Icons.check, color: Colors.white, size: 36.0),
          ),
        ),
      ],
    );
  }
}
