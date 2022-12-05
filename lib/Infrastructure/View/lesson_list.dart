import 'package:flutter/material.dart';
import 'package:flutterproject/Infrastructure/View/lesson_item.dart';

class LessonsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        for (var i = 0; i < 4; i++) LessonItem("Leccion 1") // lesson.name
      ],
    );
  }
}
