import 'package:flutter/material.dart';
import 'package:flutterproject/description_place.dart';
import 'review.dart';
import 'package:flutterproject/Recipe.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor:Colors.indigo ,
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: Recipe.samples.length,
          itemBuilder: (BuildContext context, int index) {
            return buildRecipeCard(Recipe.samples[index]);
          },
        ),
      ),
    );
  }

  Widget buildRecipeCard(Recipe recipe) {
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
            Image(image: AssetImage(recipe.imageUrl)),
            // 5
            const SizedBox(
              height: 14.0,
            ),
            // 6
            Text(
              recipe.label,
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
}