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
  // TODO: Add findAllRecipes()
  // TODO: Add watchAllRecipes()
  // TODO: Add watchAllIngredients()
  // TODO: Add findRecipeById()
  // TODO: Add findAllIngredients()
  // TODO: Add findRecipeIngredients()
  // TODO: Add insertRecipe()
  // TODO: Add insertIngredients()
  // TODO: Add Delete methods

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
