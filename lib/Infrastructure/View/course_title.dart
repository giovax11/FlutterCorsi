import 'package:flutter/material.dart';

class CourseTitle extends StatelessWidget {
  String title;

  CourseTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(
            top: 20.0,
            left: 20,
            right: 20.0,
          ),
          child: Text(
            this.title, // Acá va course.name
            style: const TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.w900,
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }
}
