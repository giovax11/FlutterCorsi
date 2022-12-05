import 'package:flutterproject/Domain/Aggregate/Courses.dart';

import '../../Domain/Aggregate/Courses.dart';
import 'package:flutterproject/Domain/Repository/courseIrepository.dart';
import 'courserepositoryApi.dart';

class CourseController {
  ICourseRepository repository =
      RepositoryApi('https://6383f3913fa7acb14fea74f1.mockapi.io/api/Courses');

  getAllCourse() {
    return repository.getAll();
  }
}
