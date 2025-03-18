import 'package:flutter/material.dart';

class AnimatedDot extends AnimatedWidget {
  final Color color;
  static final double size = 26.0;

  AnimatedDot({
    Key ?key,
    required Animation<double> animation,
    required this.color,
  }) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    Animation<double> animation = super.listenable as Animation<double> ;
    return Positioned(
      top: animation.value,
      child: Container(
          height: size,
          width: size,
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: Color(0xFFDDDDDD), width: 2.0)),
          child:Container(
            height: size-3,
            width: size-3,
            decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black54, width: 2.0)),
            child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: DecoratedBox(
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            ),
          )),
    ));
  }
}
