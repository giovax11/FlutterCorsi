import 'package:moor_flutter/moor_flutter.dart';

import '../../../Domain/Aggregate/Courses.dart';

part 'moor_db.g.dart';

// 1
class MoorCourse extends Table {
  // 2
  IntColumn get id => integer().autoIncrement()();
  // 3
  TextColumn get name => text()();
  TextColumn get description => text()();
  TextColumn get photo => text()();
}

class MoorLesson extends Table {
  IntColumn get id => integer().autoIncrement()();
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
  int get schemaVersion => 1;
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
    // TODO: Add watchAllRecipes code here
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
