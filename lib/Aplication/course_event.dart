import 'package:equatable/equatable.dart';

import '../Domain/Repository/peristenceRepository.dart';

abstract class CourseEvent extends Equatable {
  const CourseEvent();

  @override
  List<Object> get props => [];
}

class GetCourseList2 extends CourseEvent {
  final IPersistenceRepository repository;
  GetCourseList2(this.repository);
}

class GetCourseList extends CourseEvent {
  final IPersistenceRepository repository;
  GetCourseList(this.repository);
}
