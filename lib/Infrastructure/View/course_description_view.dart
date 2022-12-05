// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutterproject/Infrastructure/View/course_image.dart';
import 'package:flutterproject/Infrastructure/View/course_title.dart';
import 'package:flutterproject/Infrastructure/View/description_content.dart';
import 'package:flutterproject/Infrastructure/View/lesson_list.dart';
import 'action_button.dart';

class CourseDescriptionView extends StatelessWidget {
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
        CourseImage(
            'https://storage.googleapis.com/cms-storage-bucket/70760bf1e88b184bb1bc.png'),
        CourseTitle('Curso Profesional de Flutter'),
        DescriptionContent(
            'Flutter es el framework de Google para desarrollar interfaces móviles nativas en iOS y Android, basado en los principios de Material Design y Cupertino (iOS) tendrás un look and feel totalmente natural en tus aplicaciones. Desarrolla aplicaciones móviles nativas de alta calidad y mucho más rápido usando Flutter.'),
        ActionButton('Empezar Curso'),
        lessons_subtitle,
        LessonsList(), // Aqui puedo recibir course.lesson
      ],
    );
  }
}
