import 'dart:convert';

import 'package:flutterproject/Domain/entity/lesson.dart';
import 'package:moor_flutter/moor_flutter.dart';

import '../../../Domain/Aggregate/Courses.dart';

part 'moor_db.g.dart';

// 1
class MoorCourse extends Table {
  // 2
  IntColumn get id => integer()();
  // 3
  TextColumn get name => text()();
  TextColumn get description => text()();
  TextColumn get photo => text()();
}

class MoorLesson extends Table {
  IntColumn get id => integer()();
  IntColumn get courseId => integer()();
  TextColumn get name => text()();
  TextColumn get description => text()();
}

// 1
@UseMoor(tables: [MoorCourse, MoorLesson], daos: [CourseDao, LessonDao])
// 2
class CourseDatabase extends _$CourseDatabase {
  CourseDatabase()
      // 3
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'courses.sqlite', logStatements: true));
  // 4
  @override
  int get schemaVersion => 3;
}

// 1
@UseDao(tables: [MoorCourse])
// 2
class CourseDao extends DatabaseAccessor<CourseDatabase> with _$CourseDaoMixin {
  // 3
  final CourseDatabase db;
  CourseDao(this.db) : super(db);
  // 4
  Future<List<MoorCourseData>> findAllCourses() => select(moorCourse).get();
  // 5
  Stream<List<Course>> watchAllCourses() {
    // 1
    return select(moorCourse)
        // 2
        .watch()
        // 3
        .map(
      (rows) {
        final courses = <Course>[];
        // 4
        // ignore: avoid_function_literals_in_foreach_calls
        rows.forEach(
          (row) {
            // 5
            final course = moorCourseToCourse(row);
            // 6
            if (!courses.contains(course)) {
              course.lesson = <Lesson>[];
              courses.add(course);
            }
          },
        );
        return courses;
      },
    );
  }

  // 6
  Future<List<MoorCourseData>> findCourseById(int id) =>
      (select(moorCourse)..where((tbl) => tbl.id.equals(id))).get();
  // 7
  Future<int> insertCourse(Insertable<MoorCourseData> course) =>
      into(moorCourse).insert(course);
  // 8
  Future deleteCourse(int id) => Future.value(
      (delete(moorCourse)..where((tbl) => tbl.id.equals(id))).go());
}

// 1
@UseDao(tables: [MoorLesson])
// 2
class LessonDao extends DatabaseAccessor<CourseDatabase> with _$LessonDaoMixin {
  final CourseDatabase db;
  LessonDao(this.db) : super(db);
  Future<List<MoorLessonData>> findAllLessons() => select(moorLesson).get();
  // 3
  Stream<List<MoorLessonData>> watchAllLesson() => select(moorLesson).watch();
  // 4
  Future<List<MoorLessonData>> findCourseLessons(int id) =>
      (select(moorLesson)..where((tbl) => tbl.courseId.equals(id))).get();
  // 5
  Future<int> insertLesson(Insertable<MoorLessonData> lesson) =>
      into(moorLesson).insert(lesson);
  // 6
  Future deleteLesson(int id) => Future.value(
      (delete(moorLesson)..where((tbl) => tbl.id.equals(id))).go());
}

// Conversion Methods
Course moorCourseToCourse(MoorCourseData course) {
  return Course(
      id: course.id.toString(),
      name: course.name,
      description: course.description,
      photo: course.photo,
      lesson: List.empty());
}

Insertable<MoorCourseData> courseToInsertableMoorCourse(Course course) {
  return MoorCourseCompanion.insert(
      id: int.parse(course.id),
      name: course.name ?? '',
      description: course.description ?? '',
      photo: course.photo ?? '');
}

Lesson moorLessonToLesson(MoorLessonData lesson) {
  return Lesson(
      idLesson: lesson.id.toString(),
      name: lesson.name,
      description: lesson.description,
      courseId: lesson.courseId.toString());
}

MoorLessonCompanion lessonToInsertableMoorLesson(Lesson lesson) {
  return MoorLessonCompanion.insert(
      id: int.parse(lesson.idLesson),
      name: lesson.name,
      description: lesson.description ?? '',
      courseId: int.parse(lesson.courseId) ?? 0);
}
