import 'package:flutter/material.dart';

class LessonItem extends StatelessWidget {
  String lessonName;

  LessonItem(this.lessonName);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 1, left: 12, right: 12),
      padding: const EdgeInsets.only(left: 20),
      height: 50,
      color: const Color.fromRGBO(51, 152, 210, 1),
      child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            this.lessonName, //   lesson.name
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.left,
          )),
    );
  }
}
