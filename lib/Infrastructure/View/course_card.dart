import 'package:flutter/material.dart';
import '../../Domain/Aggregate/Courses.dart';
import 'second_route.dart';

class CourseCard extends StatelessWidget {

  Course course;

  CourseCard(this.course);

  @override
  Widget build(BuildContext context) {
    // Recibo como parámetro el curso (Course course)
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SecondRoute(this.course)), // Aca le paso course
          );
        },
        child: Card(
          // 1
          elevation: 2.0,
          // 2
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          // 3
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            // 4
            child: Column(
              children: <Widget>[
                Image.network(course.photo),
                // 5
                const SizedBox(
                  height: 14.0,
                ),
                // 6
                Text(
                  course.name,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Palatino',
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
