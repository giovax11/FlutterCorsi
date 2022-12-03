import 'package:flutterproject/Courses.dart';

import 'Courses.dart';
import 'package:flutterproject/courseIrepository.dart';
import 'courserepositoryApi.dart';

class CourseController {
  ICourseRepository repository = RepositoryApi(
      'https://6383f3913fa7acb14fea74f1.mockapi.io/api/courses');

   getAllCourse() {
    return repository.getAll();
  }
}