import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterproject/Infrastructure/Data/moor/moor_repository.dart';
import 'package:provider/provider.dart';
import '../../Aplication/course_event.dart';
import '../../Aplication/course_bloc.dart';
import '../../Aplication/course_state.dart';
import '../../Domain/Aggregate/Courses.dart';
import '../../Domain/Repository/peristenceRepository.dart';
import '../Data/moor/moor_repository.dart';
import '../Repository/controllerCourses.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.repository});
  final IPersistenceRepository repository;
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final CourseController controller = CourseController();
  final CourseBloc newsBloc = CourseBloc();
  late IPersistenceRepository repository;

  @override
  void initState() {
    newsBloc.add(GetCourseList(
        Provider.of<IPersistenceRepository>(context, listen: false)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final repository1 =
        Provider.of<IPersistenceRepository>(context, listen: false);
    return StreamBuilder<List<Course>>(
        stream: repository1.watchAllCourses(),
        builder: (context, AsyncSnapshot<List<Course>> snapshot) {
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
                        newsBloc.add(GetCourseList2(repository1));
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.message!),
                          ),
                        );
                      }

                      //aaaque(repository1);
                    },
                    child: BlocBuilder<CourseBloc, CourseState>(
                      builder: (context, state) {
                        if (state is CourseInitial) {
                          return buildLoading();
                        } else if (state is CourseLoading) {
                          return buildLoading2();
                        } else if (state is CourseLoaded) {
                          //final mlist = state.courseModel;
                          //if (mlist != null) {
                          //  for (var courlis in mlist) {
                          //    print("antes del caos");
                          //    repository1.insertCourse(courlis);
                          //    print("diosito si tenia fe");
                          //  }
                          //}
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

Future<Widget> aaaque(IPersistenceRepository repository1) async {
  final recipes = await repository1.findAllCourses();
  return buildListCourse(recipes);
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
