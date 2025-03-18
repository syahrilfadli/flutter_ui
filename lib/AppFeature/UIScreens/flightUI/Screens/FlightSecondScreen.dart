import 'dart:async';

import 'package:flutter/material.dart';
import '../helperAndAnimation/FlightFadeAnimationRoute.dart';
import '../helperAndAnimation/Flight_animated_dot.dart';
import '../helperAndAnimation/Flight_animated_plane_icon.dart';
import '../helperAndAnimation/flight_stop.dart';
import '../helperAndAnimation/flight_stop_card.dart';

import 'FlightThirdScreen.dart';

class FlightSecondScreen extends StatefulWidget {
  final double height;
  final VoidCallback onPlaneFlightStart;

  const FlightSecondScreen({
    Key? key,
    required this.height,
    required this.onPlaneFlightStart,
  }) : super(key: key);

  @override
  _FlightSecondScreenState createState() => _FlightSecondScreenState();
}

class _FlightSecondScreenState extends State<FlightSecondScreen>
    with TickerProviderStateMixin {
  final double _initialPlanePaddingBottom = 16.0;
  final double _minPlanePaddingTop = 16.0;
  final List<FlightStop> _flightStops = [
    FlightStop("JFK", "ORY", "JUN 05", "6h 25m", "\$923", "9:00 am - 3:25 pm"),
    FlightStop("MRG", "FTB", "JUN 10", "5h 25m", "\$632", "9:00 am - 2:25 pm"),
    FlightStop("ERT", "TVS", "JUN 20", "6h 25m", "\$780", "9:00 am - 3:25 pm"),
    FlightStop("KKR", "RTY", "JUN 25", "6h 25m", "\$666", "9:00 am - 3:25 pm"),
    FlightStop("MRG", "FTB", "JUN 10", "5h 25m", "\$632", "9:00 am - 2:25 pm"),
    FlightStop("KKR", "RTY", "JUN 25", "6h 25m", "\$900", "9:00 am - 8:25 pm"),
  ];
  final List<GlobalKey<FlightStopCardState>> _stopKeys = [];

  late AnimationController _planeSizeAnimationController;
  late AnimationController _planeTravelController;
  late AnimationController _dotsAnimationController;
  late AnimationController _fabAnimationController;
  late Animation<double> _planeSizeAnimation;
  late Animation _planeTravelAnimation;
  late Animation<double> _fabAnimation;

  List<Animation<double>> _dotPositions = [];

  double get _planeTopPadding =>
      _minPlanePaddingTop +
      (1 - _planeTravelAnimation.value) * _maxPlaneTopPadding;

  double get _maxPlaneTopPadding =>
      widget.height -
      _minPlanePaddingTop -
      _initialPlanePaddingBottom -
      _planeSize;

  double get _planeSize => _planeSizeAnimation.value;

  @override
  void initState() {
    super.initState();
    _initSizeAnimations();
    _initPlaneTravelAnimations();
    _initDotAnimationController();
    _initDotAnimations();
    _initFabAnimationController();
    _flightStops.forEach(
      (stop) => _stopKeys.add(new GlobalKey<FlightStopCardState>()),
    );
    _planeSizeAnimationController.forward();
  }

  @override
  void dispose() {
    _planeSizeAnimationController.dispose();
    _planeTravelController.dispose();
    _dotsAnimationController.dispose();
    _fabAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children:
            <Widget>[_buildPlane()]
              ..addAll(_flightStops.map(_buildStopCard))
              ..addAll(_flightStops.map(_mapFlightStopToDot))
              ..add(_buildFab()),
      ),
    );
  }

  Widget _buildStopCard(FlightStop stop) {
    int index = _flightStops.indexOf(stop);
    double topMargin =
        _dotPositions[index].value -
        0.5 * (FlightStopCard.height - AnimatedDot.size);
    bool isLeft = index.isOdd;
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(top: topMargin),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            isLeft ? Container() : Expanded(child: Container()),
            Expanded(
              child: FlightStopCard(
                key: _stopKeys[index],
                flightStop: stop,
                isLeft: isLeft,
              ),
            ),
            !isLeft ? Container() : Expanded(child: Container()),
          ],
        ),
      ),
    );
  }

  Widget _mapFlightStopToDot(stop) {
    int index = _flightStops.indexOf(stop);
    Color color = /*isStartOrEnd*/
        index.isEven ? Colors.deepPurple : Colors.green;
    return AnimatedDot(animation: _dotPositions[index], color: color);
  }

  Widget _buildPlane() {
    return AnimatedBuilder(
      animation: _planeTravelAnimation,
      child: Column(
        children: <Widget>[
          AnimatedPlaneIcon(animation: _planeSizeAnimation),
          Container(
            width: 2.0,
            height: _flightStops.length * FlightStopCard.height * 0.8,
            color: Color.fromARGB(255, 200, 200, 200),
          ),
        ],
      ),
      builder:
          (context, child) => Positioned(top: _planeTopPadding, child: child!),
    );
  }

  Widget _buildFab() {
    return Positioned(
      bottom: 0.0,
      child: ScaleTransition(
        scale: _fabAnimation,
        child: FloatingActionButton(
          backgroundColor: Colors.deepPurple,
          onPressed:
              () => Navigator.of(
                context,
              ).push(FadeRoute(builder: (context) => FlightThirdScreen())),
          child: Icon(Icons.check, color: Colors.white, size: 36.0),
        ),
      ),
    );
  }

  _initSizeAnimations() {
    _planeSizeAnimationController = AnimationController(
      duration: const Duration(milliseconds: 340),
      vsync: this,
    )..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(Duration(milliseconds: 500), () {
          widget.onPlaneFlightStart();
          _planeTravelController.forward();
        });
        Future.delayed(Duration(milliseconds: 700), () {
          _dotsAnimationController.forward();
        });
      }
    });
    _planeSizeAnimation = Tween<double>(begin: 60.0, end: 36.0).animate(
      CurvedAnimation(
        parent: _planeSizeAnimationController,
        curve: Curves.easeOut,
      ),
    );
  }

  _initPlaneTravelAnimations() {
    _planeTravelController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _planeTravelAnimation = CurvedAnimation(
      parent: _planeTravelController,
      curve: Curves.fastOutSlowIn,
    );
  }

  void _initDotAnimations() {
    //what part of whole animation takes one dot travel
    //what are delays between dot animations
    final double slideDelayInterval = 0.2;
    //at the bottom of the screen
    double startingMarginTop = widget.height;
    //minimal margin from the top (where first dot will be placed)
    double minMarginTop =
        _minPlanePaddingTop + _planeSize + 0.5 * (0.8 * FlightStopCard.height);

    for (int i = 0; i < _flightStops.length; i++) {
      final start = slideDelayInterval * i;

      double finalMarginTop = minMarginTop + i * (0.8 * FlightStopCard.height);
      Animation<double> animation = new Tween(
        begin: startingMarginTop,
        end: finalMarginTop,
      ).animate(
        new CurvedAnimation(
          parent: _dotsAnimationController,
          curve: new Interval(start, 1.0, curve: Curves.easeOut),
        ),
      );
      _dotPositions.add(animation);
    }
  }

  void _initDotAnimationController() {
    _dotsAnimationController = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    )..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animateFlightStopCards().then((_) => _animateFab());
      }
    });
  }

  Future _animateFlightStopCards() async {
    return Future.forEach(_stopKeys, (GlobalKey<FlightStopCardState> stopKey) {
      return new Future.delayed(Duration(milliseconds: 250), () {
        setState(() {
          stopKey.currentState?.runAnimation();
        });
      });
    });
  }

  void _initFabAnimationController() {
    _fabAnimationController = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _fabAnimation = new CurvedAnimation(
      parent: _fabAnimationController,
      curve: Curves.easeOut,
    );
  }

  _animateFab() {
    _fabAnimationController.forward();
  }
}
