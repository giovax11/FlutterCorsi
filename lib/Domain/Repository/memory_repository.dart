import 'dart:core';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutterproject/Domain/Repository/peristenceRepository.dart';

import '../Aggregate/Courses.dart';
import '../entity/lesson.dart';

class MemoryRepository extends IPersistenceRepository with ChangeNotifier {
  final List<Course> _currentCourses = <Course>[];
  final List<Lesson> _currentLessons = <Lesson>[];
  Stream<List<Course>>? _courseStream;
  Stream<List<Lesson>>? _lessonStream;
  final StreamController _courseStreamController =
      StreamController<List<Course>>();
  final StreamController _lessonStreamController =
      StreamController<List<Lesson>>();

  @override
  Stream<List<Course>> watchAllCourses() {
    _courseStream ??= _courseStreamController.stream as Stream<List<Course>>;
    return _courseStream!;
  }

  @override
  Stream<List<Lesson>> watchAllLessons() {
    _lessonStream ??= _lessonStreamController.stream as Stream<List<Lesson>>;
    return _lessonStream!;
  }

  @override
  Future<List<Course>> findAllCourses() {
    return Future.value(_currentCourses);
  }

  @override
  Future<Course> findCourseById(int id) {
    return Future.value(
        _currentCourses.firstWhere((course) => course.id == id));
  }

  @override
  Future<List<Lesson>> findAllLessons() {
    return Future.value(_currentLessons);
  }

  @override
  Future<List<Lesson>> findCourseLessons(int courseId) {
    final course =
        _currentCourses.firstWhere((course) => course.id == courseId);
    final courseLessons = _currentLessons
        .where((lesson) => lesson.courseId == course.id)
        .toList();
    return Future.value(courseLessons);
  }

  @override
  Future<int> insertCourse(Course course) {
    _currentCourses.add(course);
    _courseStreamController.sink.add(_currentCourses);
    if (course.lesson != null) {
      insertLessons(course.lesson!);
    }
    return Future.value(0);
  }

  @override
  Future<List<int>> insertLessons(List<Lesson> lessons) {
    if (lessons.isNotEmpty) {
      _currentLessons.addAll(lessons);
      _lessonStreamController.sink.add(_currentLessons);
    }
    return Future.value(<int>[]);
  }

  @override
  Future<void> deleteCourse(Course course) {
    _currentCourses.remove(course);
    _courseStreamController.sink.add(_currentCourses);
    if (course.id != null) {
      deleteCourseLessons(int.parse(course.id!));
    }
    return Future.value();
  }

  @override
  Future<void> deleteLesson(Lesson lesson) {
    _currentLessons.remove(lesson);
    _lessonStreamController.sink.add(_currentLessons);
    return Future.value();
  }

  @override
  Future<void> deleteLessons(List<Lesson> lessons) {
    _currentLessons.removeWhere((lesson) => lessons.contains(lesson));
    _lessonStreamController.sink.add(_currentLessons);
    return Future.value();
  }

  @override
  Future<void> deleteCourseLessons(int courseId) {
    _currentLessons.removeWhere((lesson) => lesson.courseId == courseId);
    _lessonStreamController.sink.add(_currentLessons);
    return Future.value();
  }

  @override
  Future init() {
    return Future.value();
  }

  @override
  void close() {
    _courseStreamController.close();
    _lessonStreamController.close();
  }
}
