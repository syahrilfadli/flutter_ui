import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ListTileUI extends StatelessWidget {
  const ListTileUI({
    Key? key,
    this.iconTitle,
    this.title,
    this.color,
    this.iconbg,
    this.textcolor,
    this.ontap,
  }) : super(key: key);

  final String? iconTitle;
  final String? title;
  final Color? color;
  final Color? iconbg;
  final Color? textcolor;
  final String? ontap;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Container(
      child: InkWell(
        onTap: () {
          if (ontap != null) {
            Navigator.pushNamed(context, ontap!);
          }
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: ListTile(
            leading: Container(
              alignment: Alignment.center,
              child: Text(
                "$iconTitle",
                style: TextStyle(
                  fontSize: width / 25,
                  color: textcolor,
                  fontWeight: FontWeight.bold,
                ),
              ),

              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: iconbg,
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            title: Text(
              "$title",
              style: TextStyle(
                color: textcolor,
                letterSpacing: 0.5,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: width / 20,
              color: textcolor,
            ),
          ),
        ),
      ),
    );
  }
}
