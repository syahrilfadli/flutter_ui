import 'package:flutter/material.dart';

class AppKitAppbar extends StatelessWidget {
  final String title;
  AppKitAppbar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(title, style: TextStyle(color: Colors.black)),
      iconTheme: IconThemeData(color: Colors.black),
    );
  }
}
