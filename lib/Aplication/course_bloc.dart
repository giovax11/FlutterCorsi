import 'package:bloc/bloc.dart';
import 'package:flutterproject/Domain/Repository/peristenceRepository.dart';
import 'package:flutterproject/Infrastructure/Data/moor/moor_repository.dart';
import '../Domain/Aggregate/Courses.dart';
import '../Infrastructure/Repository/controllerCourses.dart';
import 'course_event.dart';
import 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  CourseBloc() : super(CourseInitial()) {
    final CourseController apiRepository = CourseController();
    final IPersistenceRepository persistenceRepository = MoorRepository();
    List<Course>? listc;
    on<GetCourseList>((event, emit) async {
      try {
        emit(CourseLoading());
        final mList = await apiRepository.getAllCourse();
        listc = mList;
        //for (var courlis in mList) {
        //  event.repository.insertCourse(courlis);
        //}
        emit(CourseLoaded(mList));
      } catch (_) {
        emit(CourseError("Fallo en la busqueda de datos"));
        //final mList = await persistenceRepository.findAllCourses();
        //if (listc != null) {
        //  emit(CourseLoaded(listc));
        //}
      }
    });
    on<GetCourseList2>((event, emit) {
      if (listc != null) {
        for (var courlis in listc!) {
          event.repository.insertCourse(courlis);
          print(listc);
        }
      }
    });
  }
}
