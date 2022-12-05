// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutterproject/Domain/Aggregate/Courses.dart';
import 'package:flutterproject/Infrastructure/View/course_image.dart';
import 'package:flutterproject/Infrastructure/View/course_title.dart';
import 'package:flutterproject/Infrastructure/View/description_content.dart';
import 'package:flutterproject/Infrastructure/View/lesson_list.dart';
import 'action_button.dart';

class CourseDescriptionView extends StatelessWidget {
  Course course;

  CourseDescriptionView(this.course);
  // Aqui voy a recibir la data del snapshot.data

  @override
  Widget build(BuildContext context) {
    final lessons_subtitle = Container(
        margin: EdgeInsets.only(top: 20, left: 30, right: 40, bottom: 15),
        child: Text(
          "Lecciones",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.left,
        ));

    return Column(
      children: <Widget>[
        CourseImage(this.course.photo),
        CourseTitle(this.course.name),
        DescriptionContent(this.course.description),
        ActionButton('Empezar Curso'),
        lessons_subtitle,
        LessonsList(), // Aqui puedo recibir course.lesson
      ],
    );
  }
}
