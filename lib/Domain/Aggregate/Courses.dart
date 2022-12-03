//import 'dart:ffi';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../entity/lesson.dart';


import 'dart:convert';

List<Course> courseFromJson(String str) => List<Course>.from(json.decode(str).map((x) => Course.fromJson(x)));

String courseToJson(List<Course> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Course {
  Course({
    required this.name,
    required this.description,
    required this.photo,
    required this.lesson,
    required this.id,
  });

  String name;
  String description;
  String photo;
  List<Lesson> lesson;
  String id;

  factory Course.fromJson(Map<String, dynamic> json) => Course(
    name: json["name"],
    description: json["description"],
    photo: json["photo"],
    lesson: List<Lesson>.from(json["lesson"].map((x) => Lesson.fromJson(x))),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "description": description,
    "photo": photo,
    "lesson": List<dynamic>.from(lesson.map((x) => x.toJson())),
    "id": id,
  };
}