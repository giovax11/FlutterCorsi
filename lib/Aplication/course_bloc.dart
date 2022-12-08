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
        final listOldCourses = await event.repository.findAllCourses();
        listc = listOldCourses;
        print(listc);
        listc?.forEach((course) {
          event.repository.deleteCourseLessons(int.parse(course.id));
          event.repository.deleteCourse(course);
        });
        final mList = await apiRepository.getAllCourse();
        listc = mList;
        listc?.forEach((course) {
          event.repository.insertCourse(course);
        });
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
    on<GetCourseList2>((event, emit) async {
      /*final listA = await event.repository.findAllCourses();
      listA.forEach((course) {
        event.repository.deleteCourse(course);
      });*/
      /*if (listc != null) {
        listc?.forEach((course) {
          event.repository.insertCourse(course);
        });
        /*for (var courlis in listc!) {
          event.repository.insertCourse(courlis);
          //print(event.repository.findCourseById(1));
          print(courlis.name);
        }*/
      }*/
      final listC = await event.repository.findAllCourses();
      emit(CourseLoaded(listC));
    });
  }
}
