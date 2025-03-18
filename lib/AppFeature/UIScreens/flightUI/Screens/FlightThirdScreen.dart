import 'package:flutter/material.dart';
import '../helperAndAnimation/FlightAppbarDesign.dart';
import '../helperAndAnimation/flight_stop_ticket.dart';
import '../helperAndAnimation/ticket_card.dart';

class FlightThirdScreen extends StatefulWidget {
  @override
  FlightThirdScreenState createState() => FlightThirdScreenState();
}

class FlightThirdScreenState extends State<FlightThirdScreen>
    with TickerProviderStateMixin {
  List<FlightStopTicket> stops = [
    new FlightStopTicket("Indonesia", "IND", "Laos", "LAOS", "SE2341"),
    new FlightStopTicket("Laos", "LAOS", "Cambodia", "CAM", "KU2342"),
    new FlightStopTicket("Cambodia", "CAM", "Malaysia", "MALA", "KR3452"),
    new FlightStopTicket("Malaysia", "MALA", "Indonesia", "INDO", "MR4321"),
    new FlightStopTicket("Indonesia", "INDO", "Australia", "AUS", "KR3453"),
    new FlightStopTicket("Australia", "AUS", "New Zealand", "NZ", "MR4322"),
  ];
  late AnimationController cardEntranceAnimationController;
  late List<Animation> ticketAnimations;
  late Animation<double> fabAnimation;

  @override
  void initState() {
    super.initState();
    cardEntranceAnimationController = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1100),
    );
    ticketAnimations =
        stops.map((stop) {
          int index = stops.indexOf(stop);
          double start = index * 0.1;

          return new Tween<double>(begin: 800.0, end: 0.0).animate(
            new CurvedAnimation(
              parent: cardEntranceAnimationController,
              curve: new Interval(start, 1.0, curve: Curves.fastOutSlowIn),
            ),
          );
        }).toList();
    fabAnimation = new CurvedAnimation(
      parent: cardEntranceAnimationController,
      curve: Interval(0.7, 1.0, curve: Curves.fastOutSlowIn),
    );
    cardEntranceAnimationController.forward();
  }

  @override
  void dispose() {
    cardEntranceAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Stack(
        children: <Widget>[
          FlightAppbarDesign(height: 180.0, back: true),
          Positioned.fill(
            top: MediaQuery.of(context).padding.top + 64.0,
            child: SingleChildScrollView(
              child: new Column(children: _buildTickets().toList()),
            ),
          ),
        ],
      ),
      floatingActionButton: _buildFab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Iterable<Widget> _buildTickets() {
    return stops.map((stop) {
      int index = stops.indexOf(stop);
      return AnimatedBuilder(
        animation: cardEntranceAnimationController,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
          child: TicketCard(stop: stop),
        ),
        builder:
            (context, child) => new Transform.translate(
              offset: Offset(0.0, ticketAnimations[index].value),
              child: child,
            ),
      );
    });
  }

  _buildFab() {
    return ScaleTransition(
      scale: fabAnimation,
      child: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        child: new Icon(Icons.check, color: Colors.white),
      ),
    );
  }
}
