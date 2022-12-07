import 'package:bloc/bloc.dart';
import 'package:flutterproject/Infrastructure/Repository/courserepositoryApi.dart';
import 'CoursesService.dart';
import 'course_event.dart';
import 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  CourseBloc() : super(CourseInitial()) {
    final CourseService apiRepository = CourseService(RepositoryApi('https://6383f3913fa7acb14fea74f1.mockapi.io/api/Courses'));

    on<GetCourseList>((event, emit) async {
      try {
        
        emit(CourseLoading());
        final mList = await apiRepository.getAllCourse();
        emit(CourseLoaded(mList));
      } catch(_) {
        emit(CourseError("Fallo en la busqueda de datos"));
      }
    });
  }
}
