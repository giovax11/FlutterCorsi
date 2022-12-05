import 'package:flutter/material.dart';
import 'package:flutterproject/Infrastructure/View/course_description_view.dart';

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key}); // Esto recibe un course

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Course Details'),
        ),
        body: ListView(
          children: [CourseDescriptionView()], // le paso el course de nuevo
        ));
  }
}
