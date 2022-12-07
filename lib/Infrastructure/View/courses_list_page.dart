import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterproject/Infrastructure/View/course_card.dart';
import '../../Aplication/course_event.dart';
import '../../Aplication/course_bloc.dart';
import '../../Aplication/course_state.dart';
import '../../Domain/Aggregate/Courses.dart';
import '../Repository/controllerCourses.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final CourseController controller = CourseController();
  final CourseBloc newsBloc = CourseBloc();

  @override
  void initState() {
    newsBloc.add(GetCourseList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('CURSOS'),
        ),
        body: Center(
          child: BlocProvider(
            create: (context) => newsBloc,
            child: BlocListener<CourseBloc, CourseState>(
              listener: (context, state) {
                if (state is CourseError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message!),
                    ),
                  );
                }
              },
              child: BlocBuilder<CourseBloc, CourseState>(
                builder: (context, state) {
                  if (state is CourseInitial) {
                    return buildLoading();
                  } else if (state is CourseLoading) {
                    return buildLoading();
                  } else if (state is CourseLoaded) {
                    return buildListCourse(state.courseModel!);
                  } else if (state is CourseError) {
                    return buildLoading();
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildListCourse(List<Course> courses) {
  return ListView.builder(
      itemCount: courses.length,
      itemBuilder: ((BuildContext context, int index) {
        return buildRecipeCard(courses[index]);
      }));
}

Widget buildLoading() => const Center(child: CircularProgressIndicator());
Widget buildLoading2() => const Center(
      child: Text("loading"),
    );
Widget buildLoading3() => const Center(
      child: Text("no internet"),
    );
Widget buildRecipeCard(Course course) {
  return CourseCard(course);
}
