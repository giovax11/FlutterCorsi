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
}
