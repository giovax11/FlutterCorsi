
import 'package:equatable/equatable.dart';

import '../Domain/Aggregate/Courses.dart';

abstract class CourseState extends Equatable {
  const CourseState();

  @override
  List<Object?> get props => [];
}

class CourseInitial extends CourseState {}

class CourseLoading extends CourseState {}

class CourseLoaded extends CourseState {
  final List<Course>? courseModel;
  const CourseLoaded(this.courseModel);
}

class CourseError extends CourseState {
  final String? message;
  const CourseError(this.message);
}


class NetworkError extends Error {}