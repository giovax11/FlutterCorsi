import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../../Aplication/course_event.dart';
import '../../Aplication/course_bloc.dart';
import '../../Aplication/course_state.dart';
import '../../Domain/Aggregate/Courses.dart';
import '../../Domain/Repository/peristenceRepository.dart';
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
    final repository = Provider.of<IPersistenceRepository>(context);
    return StreamBuilder<List<Course>>(
        stream: repository.watchAllCourses(),
        builder: (context, AsyncSnapshot<List<Course>> snapshot) {
          final courses = snapshot.data ?? [];
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
                      if (snapshot.data != null) {
                        final recipes = snapshot.data ?? [];
                        buildListCourse(recipes);
                      }
                    },
                    child: BlocBuilder<CourseBloc, CourseState>(
                      builder: (context, state) {
                        if (state is CourseInitial) {
                          return buildLoading();
                        } else if (state is CourseLoading) {
                          return buildLoading2();
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
        });
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
  return Card(
    // 1
    elevation: 2.0,
    // 2
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
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
