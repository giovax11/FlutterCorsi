import 'package:flutter/material.dart';

class DescriptionContent extends StatelessWidget {
  String content;

  DescriptionContent(this.content);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(
            top: 20, left: 30, right: 40, bottom: 25), // course.description
        child: Text(
          this.content,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w300,
          ),
          textAlign: TextAlign.justify,
        ));
  }
}
