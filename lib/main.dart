import 'package:flutter/material.dart';
import 'package:flutterproject/controllerCourses.dart';
import 'package:flutterproject/description_place.dart';
import 'package:http/http.dart';
import 'review.dart';
import 'package:flutterproject/Recipe.dart';
import 'Courses.dart';
import 'package:http/http.dart'as http;
import 'package:flutterproject/courseIrepository.dart';
import 'dart:convert';
import 'courserepositoryApi.dart';
void main() {

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
 MyApp({super.key});

  Image appLogo = Image(
      image: new ExactAssetImage("assets/CORSI_logo.png"),
      height: 290.0,
      width: 110.0,
      alignment: FractionalOffset.center);

  Text title=const Text(
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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
      appBar:AppBar(
        leading: title ,
        actions: [
          appLogo,
        ],
      ) ,
        body:MyHomePage(title: "Courses",),
        ) ,

      );  //const MyHomePage(title: 'Flutter Demo Home Page'),
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final CourseController controller=CourseController();


  /*Future <List<Course>> fetchCourses() async {
    final response =
    await http.get(Uri.parse('https://6383f3913fa7acb14fea74f1.mockapi.io/api/courses'));

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      return parsed.map<Course>((json) => Course.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load');
    }
  }*/
  
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('CURSOS'),
        ),
        body: Center(
          child: FutureBuilder <List<Course>>(
            future: controller.getAllCourse(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return
                  ListView.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return  buildRecipeCard(snapshot.data![index]);
                      }
                  );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              // By default show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}


  Widget buildRecipeCard(Course course) {
    return Card(
      // 1
      elevation: 2.0,
      // 2
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)),
      // 3
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        // 4
        child: Column(
          children: <Widget>[
            Image.network(course.photo),
            // 5
            const SizedBox(
              height: 14.0,
            ),
            // 6
            Text(
              course.name,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
                fontFamily: 'Palatino',
              ),
            )
          ],
        ),
      ),
    );
  }
