import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutterproject/Domain/Aggregate/Courses.dart';
import 'package:flutterproject/Domain/Repository/courseIrepository.dart';
import 'package:multiple_result/multiple_result.dart';

class RepositoryApi implements ICourseRepository {
  final api;
  var client = http.Client();
  RepositoryApi(this.api);

  @override
  Future<List<Course>> getAll() async {
    try {
      final response = await client
          .get(Uri.parse(api));
      switch (response.statusCode) {
        case 200:
          final parsed =
              json.decode(response.body).cast<Map<String, dynamic>>();
          return parsed.map<Course>((json) => Course.fromJson(json)).toList();
        default:
          throw Exception();
      }
    } catch (e) {
      // catch all exceptions (not just SocketException)
      // 4. return Error here too
      throw Error(e);
    }

    //return null;
  }
}
