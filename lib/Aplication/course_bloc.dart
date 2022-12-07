import 'package:bloc/bloc.dart';
import 'package:flutterproject/Domain/Repository/peristenceRepository.dart';
import 'package:flutterproject/Infrastructure/Data/moor/moor_repository.dart';
import '../Infrastructure/Repository/controllerCourses.dart';
import 'course_event.dart';
import 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  CourseBloc() : super(CourseInitial()) {
    final CourseController apiRepository = CourseController();
    final IPersistenceRepository persistenceRepository = MoorRepository();

    on<GetCourseList>((event, emit) async {
      try {
        emit(CourseLoading());
        final mList = await apiRepository.getAllCourse();
        print(mList);
        mList.forEach((course) => persistenceRepository.insertCourse(course));
        //print(await persistenceRepository.findAllCourses());
        emit(CourseLoaded(mList));
      } catch (_) {
        emit(CourseError("Fallo en la busqueda de datos"));
        final mlist = await persistenceRepository.findAllCourses();
        if (mlist != null) {
          emit(CourseLoaded(mlist));
        }
      }
    });
  }
}
