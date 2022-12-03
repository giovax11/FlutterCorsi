
import 'package:http/http.dart'as http;
import 'dart:convert';

import 'package:flutterproject/Courses.dart';
import 'package:flutterproject/courseIrepository.dart';

class RepositoryApi implements ICourseRepository {
  final api;

  RepositoryApi(this.api);

  @override
  Future<List<Course>> getAll() async {
    final response =
    await http.get(
        Uri.parse(api));

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      return parsed.map<Course>((json) => Course.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load');
    }
  }
}