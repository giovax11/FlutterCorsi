import 'package:flutter/material.dart';
import 'package:flutterproject/Domain/entity/lesson.dart';
import 'package:flutterproject/Infrastructure/View/lesson_item.dart';

import '../../Domain/Aggregate/Courses.dart';

class LessonsList extends StatelessWidget {

  Course course;
  LessonsList(this.course);
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        for (var lesson in this.course.lesson) LessonItem(lesson.name.capitalize()) // lesson.name
      ],
    );
  }

}
extension MyExtension on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${this.substring(1).toLowerCase()}';
  }
 }
