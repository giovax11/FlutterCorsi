import 'package:flutter/material.dart';
import 'package:flutterproject/Infrastructure/View/course_description_view.dart';

import '../../Domain/Aggregate/Courses.dart';

class SecondRoute extends StatelessWidget {

  Course course;

  SecondRoute(this.course); // Esto recibe un course

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Course Details'),
        ),
        body: ListView(
          children: [CourseDescriptionView(this.course)], // le paso el course de nuevo
        ));
  }
}
