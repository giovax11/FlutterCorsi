import 'package:flutter/material.dart';
import 'package:flutterproject/Domain/Repository/peristenceRepository.dart';
import 'package:flutterproject/Infrastructure/Data/moor/moor_repository.dart';
import 'package:flutterproject/Infrastructure/Repository/controllerCourses.dart';
import 'package:http/http.dart';
import 'Domain/Repository/memory_repository.dart';
import 'Infrastructure/View/courses_list_page.dart';
import 'Domain/Aggregate/Courses.dart';
import 'package:http/http.dart' as http;
import 'package:flutterproject/Domain/Repository/courseIrepository.dart';
import 'dart:convert';
import 'Infrastructure/Repository/courserepositoryApi.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  final repository = MoorRepository();
  await repository.init();
  runApp(MyApp(repository: repository));
}

class MyApp extends StatelessWidget {
  final IPersistenceRepository repository;
  MyApp({Key? key, required this.repository}) : super(key: key);

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
    return MultiProvider(
      providers: [
        Provider<IPersistenceRepository>(
          lazy: false,
          create: (_) => repository,
          dispose: (_, IPersistenceRepository repository) => repository.close(),
        ),
        Provider<ServiceInterface>(
          // create: (_) => MockService()..create(),
          create: (_) => RecipeService.create(),
          lazy: false,
        ),
      ],
      child: MaterialApp(
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
      ), //const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
