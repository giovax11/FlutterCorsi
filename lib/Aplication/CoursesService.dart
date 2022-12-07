import 'package:flutterproject/Domain/Aggregate/Courses.dart';
import 'package:flutterproject/Domain/Repository/courseIrepository.dart';
import '../Infrastructure/Repository/courserepositoryApi.dart';

class CourseService {
  ICourseRepository repository ;
    CourseService(this.repository);

  getAllCourse() {
    return repository.getAll();
  }
}
