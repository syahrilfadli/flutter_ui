import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';
import 'package:flutter_ui/AppFeature/Constant/AppKitProConstant.dart';

import 'TourUIFirst.dart';

class TourUIDetail extends StatelessWidget {
  final LocationData? location;

  const TourUIDetail({Key? key, this.location}) : super(key: key);

  void _onVerticalDrag(DragUpdateDetails details, BuildContext context) {
    if (details.primaryDelta! > 3.0) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          GestureDetector(
            onVerticalDragUpdate:
                (details) => _onVerticalDrag(details, context),
            child: Hero(
              tag: location!.title!,
              child:
                  AppKitProConstant.isfirebaseimage
                      ? OctoImage(
                        image: CachedNetworkImageProvider(location!.imageUrl!),
                        placeholderBuilder: OctoPlaceholder.blurHash(
                          location!.blurUrl!,
                        ),
                        errorBuilder: OctoError.icon(color: Colors.grey),
                        fit: BoxFit.cover,
                      )
                      : Image.asset(location!.localimg!, fit: BoxFit.cover),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                location!.title!,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.0, bottom: 10.0),
                child: Text(
                  location!.price!,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10.0, bottom: 10.0),
                child: Text(
                  "/person",
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              location!.description!,
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 14, height: 1.5, letterSpacing: 0.5),
            ),
          ),
        ],
      ),
    );
  }
}
