import 'package:flutter/material.dart';
import 'second_route.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Recibo como parámetro el curso (Course course)
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SecondRoute()), // Aca le paso course
        );
      },
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            ElevatedButton(child: const Text('Open route'), onPressed: () {})
          ]),
        ),
      ),
    );
  }
}
