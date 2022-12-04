import 'package:flutterproject/Domain/Aggregate/Courses.dart';
import 'package:flutterproject/Domain/entity/lesson.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqlbrite/sqlbrite.dart';
import 'package:synchronized/synchronized.dart';

class DatabaseHelper {
  // 1
  static const _databaseName = 'Corsi.db';
  static const _databaseVersion = 1;
  // 2
  static const courseTable = 'Course';
  static const lessonTable = 'Lesson';
  static const courseId = 'courseId';
  static const lessonId = 'lessonId';
  // 3
  static late BriteDatabase _streamDatabase;
  // make this a singleton class
  // 4
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  // 5
  static var lock = Lock();
  // only have a single app-wide reference to the database
  // 6
  static Database? _database;

  // SQL code to create the database table
  // 1
  Future _onCreate(Database db, int version) async {
    // 2
    await db.execute('''
      CREATE TABLE $courseTable (
        $courseId INTEGER PRIMARY KEY,
        name TEXT,
        description TEXT,
        photo TEXT
      )
    ''');
    //3
    await db.execute('''
      CREATE TABLE $lessonTable(
        $lessonId INTEGER PRIMARY KEY,
        $courseId INTEGER,
        name TEXT,
        description TEXT
      )
    ''');
  }

  // this opens the database (and creates it if it doesn't exist)
  // 1
  Future<Database> _initDatabase() async {
    // 2
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, _databaseName);
    // 4
    // TODO: Remember to turn off debugging before deploying app to store(s).
    Sqflite.setDebugModeOn(true);
    // 5
    return openDatabase(path, version: _databaseVersion, onCreate: _onCreate);
  }

  Future<Database> get database async {
    // 2
    if (_database != null) return _database!;
    // Use this object to prevent concurrent access to data
    // 3
    await lock.synchronized(() async {
      // lazily instantiate the db the first time it is accessed
      // 4
      if (_database == null) {
        // 5
        _database = await _initDatabase();
        // 6
        _streamDatabase = BriteDatabase(_database!);
      }
    });
    return _database!;
  }

  // 1
  Future<BriteDatabase> get streamDatabase async {
    // 2
    await database;
    return _streamDatabase;
  }

  List<Course> parseCourse(List<Map<String, dynamic>> courseList) {
    final courses = <Course>[];
    // 1
    courseList.forEach((courseMap) {
      // 2
      final course = Course.fromJson(courseMap);
      // 3
      courses.add(course);
    });
    // 4
    return courses;
  }

  List<Lesson> parseLessons(List<Map<String, dynamic>> lessonList) {
    final lessons = <Lesson>[];
    lessonList.forEach((lessonMap) {
      // 5
      final lesson = Lesson.fromJson(lessonMap);
      lessons.add(lesson);
    });
    return lessons;
  }

  Future<List<Course>> findAllRecipes() async {
    // 1
    final db = await instance.streamDatabase;
    // 2
    final courseList = await db.query(courseTable);
    // 3
    final courses = parseCourse(courseList);
    return courses;
  }

  Stream<List<Course>> watchAllRecipes() async* {
    final db = await instance.streamDatabase;
    // 1
    yield* db
        // 2
        .createQuery(courseTable)
        // 3
        .mapToList((row) => Course.fromJson(row));
  }

  Stream<List<Lesson>> watchAllIngredients() async* {
    final db = await instance.streamDatabase;
    yield* db.createQuery(lessonTable).mapToList((row) => Lesson.fromJson(row));
  }

  Future<Course> findCourseById(int id) async {
    final db = await instance.streamDatabase;
    final courseList = await db.query(courseTable, where: 'id = $id');
    final courses = parseCourse(courseList);
    return courses.first;
  }

  Future<List<Lesson>> findAllLessons() async {
    final db = await instance.streamDatabase;
    final lessonList = await db.query(lessonTable);
    final lessons = parseLessons(lessonList);
    return lessons;
  }

  Future<List<Lesson>> findCourseLessons(int recipeId) async {
    final db = await instance.streamDatabase;
    final lessonList =
        await db.query(lessonTable, where: 'courseId = $courseId');
    final lessons = parseLessons(lessonList);
    return lessons;
  }
}
