import 'package:multiple_result/multiple_result.dart';

import '../Aggregate/Courses.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class ICourseRepository {
  Future<List<Course>> getAll();
}
