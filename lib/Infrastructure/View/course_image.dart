import 'package:flutter/material.dart';

class CourseImage extends StatelessWidget {
  String image_url;

  CourseImage(this.image_url);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
          top: 20, left: 20, right: 20), // Aqui va course.photo
      child: Image.network(this.image_url),
    );
  }
}
