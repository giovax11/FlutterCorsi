import 'package:bloc/bloc.dart';
import '../Infrastructure/Repository/controllerCourses.dart';
import 'course_event.dart';
import 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  CourseBloc() : super(CourseInitial()) {
    final CourseController apiRepository = CourseController();

    on<GetCourseList>((event, emit) async {
      try {
        
        emit(CourseLoading());
        final mList = await apiRepository.getAllCourse();
        emit(CourseLoaded(mList));
      } on NetworkError {
        emit(CourseError("Fallo en la busqueda de datos"));
      }
    });
  }
}
