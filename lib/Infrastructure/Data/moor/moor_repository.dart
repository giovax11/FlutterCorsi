// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'dart:async';
import 'package:flutterproject/Domain/Aggregate/Courses.dart';
import 'package:flutterproject/Domain/Repository/peristenceRepository.dart';

import '../../../Domain/entity/lesson.dart';
import 'moor_db.dart';

class MoorRepository extends IPersistenceRepository {
  // 1
  late CourseDatabase courseDatabase;
  // 2
  late CourseDao _courseDao;
  // 3
  late LessonDao _lessonDao;
  // 3
  Stream<List<Lesson>>? lessonStream;
  // 4
  Stream<List<Course>>? courseStream;

  @override
  Future<List<Course>> findAllCourses() {
    // 1
    return _courseDao.findAllCourses()
        // 2
        .then<List<Course>>(
      (List<MoorCourseData> moorCourses) {
        final courses = <Course>[];
        // 3
        moorCourses.forEach(
          (moorCourse) async {
            // 4
            final course = moorCourseToCourse(moorCourse);
            // 5
            if (course.id != null) {
              course.lesson = await findCourseLessons(int.parse(course.id!));
            }
            courses.add(course);
          },
        );
        return courses;
      },
    );
  }

  @override
  Stream<List<Course>> watchAllCourses() {
    courseStream ??= _courseDao.watchAllCourses();
    return courseStream!;
  }

  @override
  Stream<List<Lesson>> watchAllLessons() {
    if (lessonStream == null) {
      // 1
      final stream = _lessonDao.watchAllLesson();
      // 2
      lessonStream = stream.map(
        (moorLessons) {
          final lessons = <Lesson>[];
          // 3
          moorLessons.forEach(
            (moorLesson) {
              lessons.add(moorLessonToLesson(moorLesson));
            },
          );
          return lessons;
        },
      );
    }
    return lessonStream!;
  }

  @override
  Future<Course> findCourseById(int id) {
    return _courseDao
        .findCourseById(id)
        .then((listOfCourses) => moorCourseToCourse(listOfCourses.first));
  }

  @override
  Future<List<Lesson>> findAllLessons() {
    return _lessonDao.findAllLessons().then<List<Lesson>>(
      (List<MoorLessonData> moorLessons) {
        final lessons = <Lesson>[];
        moorLessons.forEach(
          (lesson) {
            lessons.add(moorLessonToLesson(lesson));
          },
        );
        return lessons;
      },
    );
  }

  @override
  Future<List<Lesson>> findCourseLessons(int courseId) {
    return _lessonDao.findCourseLessons(courseId).then(
      (listOfLessons) {
        final lessons = <Lesson>[];
        listOfLessons.forEach(
          (lesson) {
            lessons.add(moorLessonToLesson(lesson));
          },
        );
        return lessons;
      },
    );
  }

  @override
  Future<int> insertCourse(Course course) {
    return Future(
      () async {
        // 1
        final id =
            await _courseDao.insertCourse(courseToInsertableMoorCourse(course));
        if (course.lesson != null) {
          // 2
          course.lesson!.forEach(
            (lesson) {
              lesson.courseId = id.toString();
            },
          );
          // 3
          insertLessons(course.lesson!);
        }
        return id;
      },
    );
  }

  @override
  Future<List<int>> insertLessons(List<Lesson> lessons) {
    return Future(
      () {
        // 1
        // ignore: prefer_is_empty
        if (lessons.length == 0) {
          return <int>[];
        }
        final resultIds = <int>[];
        lessons.forEach(
          (lesson) {
            // 2
            final moorLesson = lessonToInsertableMoorLesson(lesson);
            // 3
            _lessonDao
                .insertLesson(moorLesson)
                .then((int id) => resultIds.add(id));
          },
        );
        return resultIds;
      },
    );
  }

  @override
  Future<void> deleteCourse(Course course) {
    if (course.id != null) {
      _courseDao.deleteCourse(int.parse(course.id!));
    }
    return Future.value();
  }

  @override
  Future<void> deleteLesson(Lesson lesson) {
    if (lesson.idLesson != null) {
      return _lessonDao.deleteLesson(int.parse(lesson.idLesson!));
    } else {
      return Future.value();
    }
  }

  @override
  Future<void> deleteLessons(List<Lesson> lessons) {
    lessons.forEach((lesson) {
      if (lesson.idLesson != null) {
        _lessonDao.deleteLesson(int.parse(lesson.idLesson!));
      }
    });
    return Future.value();
  }

  @override
  Future<void> deleteCourseLessons(int courseId) async {
    // 1
    final lessons = await findCourseLessons(courseId);
    // 2
    return deleteLessons(lessons);
  }

  @override
  Future init() async {
    // 6
    courseDatabase = CourseDatabase();
    // 7
    _courseDao = courseDatabase.courseDao;
    _lessonDao = courseDatabase.lessonDao;
  }

  @override
  void close() {
    // 8
    courseDatabase.close();
  }
}
