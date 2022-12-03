import 'package:flutter/material.dart';
import 'package:flutterproject/Infrastructure/Repository/controllerCourses.dart';
import 'package:flutterproject/description_place.dart';
import 'package:http/http.dart';
import 'Infrastructure/View/courses_list_page.dart';
import 'review.dart';
import 'package:flutterproject/Recipe.dart';
import 'Domain/Aggregate/Courses.dart';
import 'package:http/http.dart' as http;
import 'package:flutterproject/Domain/Repository/courseIrepository.dart';
import 'dart:convert';
import 'Infrastructure/Repository/courserepositoryApi.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  Image appLogo = Image(
      image: new ExactAssetImage("assets/CORSI_logo.png"),
      height: 290.0,
      width: 110.0,
      alignment: FractionalOffset.center);

  Text title = const Text(
    "Corsi",
    style: TextStyle(
      fontSize: 20.0,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.w700,
    ),
  );

  get text => null;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: title,
          actions: [
            appLogo,
          ],
        ),
        body: const MyHomePage(          
          title: "Courses",
        ),
      ),
    ); //const MyHomePage(title: 'Flutter Demo Home Page'),
  }
}
