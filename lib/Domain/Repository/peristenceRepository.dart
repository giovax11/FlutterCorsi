import 'package:flutterproject/Domain/Aggregate/Courses.dart';
import 'package:flutterproject/Domain/entity/lesson.dart';

abstract class IPersistenceRepository {
  // 1
  List<Course> findAllCourses();
  // 2
  Course findCourseById(int id);
  // 3
  List<Lesson> findAllLessons();
  // 4
  List<Lesson> findCourseLessons(int courseId);

  // 5
  int insertCourse(Course course);
  // 6
  List<int> insertLessons(List<Lesson> ingredients);

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
