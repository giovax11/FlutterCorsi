import 'package:flutterproject/Domain/Aggregate/Courses.dart';
import 'package:flutterproject/Domain/entity/lesson.dart';

abstract class IPersistenceRepository {
  // 1
  Future<List<Course>> findAllCourses();
  // 2
  Future<Course> findCourseById(int id);
  // 3
  Future<List<Lesson>> findAllLessons();
  Stream<List<Course>> watchAllCourses();
  Stream<List<Lesson>> watchAllLessons();
  // 4
  Future<List<Lesson>> findCourseLessons(int courseId);

  // 5
  Future<int> insertCourse(Course course);
  // 6
  Future<List<int>> insertLessons(List<Lesson> lessons);

  // 7
  void deleteCourse(Course course);
  // 8
  void deleteLesson(Lesson lesson);
  // 9
  void deleteLessons(List<Lesson> lessons);
  // 10
  void deleteCourseLessons(int courseId);

  // 11
  Future init();
// 12
  void close();
}
