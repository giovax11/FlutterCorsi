// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class MoorCourseData extends DataClass implements Insertable<MoorCourseData> {
  final int id;
  final String name;
  final String description;
  final String photo;
  MoorCourseData(
      {required this.id,
      required this.name,
      required this.description,
      required this.photo});
  factory MoorCourseData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return MoorCourseData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description'])!,
      photo: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}photo'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    map['photo'] = Variable<String>(photo);
    return map;
  }

  MoorCourseCompanion toCompanion(bool nullToAbsent) {
    return MoorCourseCompanion(
      id: Value(id),
      name: Value(name),
      description: Value(description),
      photo: Value(photo),
    );
  }

  factory MoorCourseData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return MoorCourseData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      photo: serializer.fromJson<String>(json['photo']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'photo': serializer.toJson<String>(photo),
    };
  }

  MoorCourseData copyWith(
          {int? id, String? name, String? description, String? photo}) =>
      MoorCourseData(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        photo: photo ?? this.photo,
      );
  @override
  String toString() {
    return (StringBuffer('MoorCourseData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('photo: $photo')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, description, photo);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MoorCourseData &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.photo == this.photo);
}

class MoorCourseCompanion extends UpdateCompanion<MoorCourseData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> description;
  final Value<String> photo;
  const MoorCourseCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.photo = const Value.absent(),
  });
  MoorCourseCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String description,
    required String photo,
  })  : name = Value(name),
        description = Value(description),
        photo = Value(photo);
  static Insertable<MoorCourseData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? photo,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (photo != null) 'photo': photo,
    });
  }

  MoorCourseCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? description,
      Value<String>? photo}) {
    return MoorCourseCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      photo: photo ?? this.photo,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (photo.present) {
      map['photo'] = Variable<String>(photo.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MoorCourseCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('photo: $photo')
          ..write(')'))
        .toString();
  }
}

class $MoorCourseTable extends MoorCourse
    with TableInfo<$MoorCourseTable, MoorCourseData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MoorCourseTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String?> description = GeneratedColumn<String?>(
      'description', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _photoMeta = const VerificationMeta('photo');
  @override
  late final GeneratedColumn<String?> photo = GeneratedColumn<String?>(
      'photo', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, description, photo];
  @override
  String get aliasedName => _alias ?? 'moor_course';
  @override
  String get actualTableName => 'moor_course';
  @override
  VerificationContext validateIntegrity(Insertable<MoorCourseData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('photo')) {
      context.handle(
          _photoMeta, photo.isAcceptableOrUnknown(data['photo']!, _photoMeta));
    } else if (isInserting) {
      context.missing(_photoMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MoorCourseData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return MoorCourseData.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $MoorCourseTable createAlias(String alias) {
    return $MoorCourseTable(attachedDatabase, alias);
  }
}

class MoorLessonData extends DataClass implements Insertable<MoorLessonData> {
  final int id;
  final int courseId;
  final String name;
  final String description;
  MoorLessonData(
      {required this.id,
      required this.courseId,
      required this.name,
      required this.description});
  factory MoorLessonData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return MoorLessonData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      courseId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}course_id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['course_id'] = Variable<int>(courseId);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    return map;
  }

  MoorLessonCompanion toCompanion(bool nullToAbsent) {
    return MoorLessonCompanion(
      id: Value(id),
      courseId: Value(courseId),
      name: Value(name),
      description: Value(description),
    );
  }

  factory MoorLessonData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return MoorLessonData(
      id: serializer.fromJson<int>(json['id']),
      courseId: serializer.fromJson<int>(json['courseId']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'courseId': serializer.toJson<int>(courseId),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
    };
  }

  MoorLessonData copyWith(
          {int? id, int? courseId, String? name, String? description}) =>
      MoorLessonData(
        id: id ?? this.id,
        courseId: courseId ?? this.courseId,
        name: name ?? this.name,
        description: description ?? this.description,
      );
  @override
  String toString() {
    return (StringBuffer('MoorLessonData(')
          ..write('id: $id, ')
          ..write('courseId: $courseId, ')
          ..write('name: $name, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, courseId, name, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MoorLessonData &&
          other.id == this.id &&
          other.courseId == this.courseId &&
          other.name == this.name &&
          other.description == this.description);
}

class MoorLessonCompanion extends UpdateCompanion<MoorLessonData> {
  final Value<int> id;
  final Value<int> courseId;
  final Value<String> name;
  final Value<String> description;
  const MoorLessonCompanion({
    this.id = const Value.absent(),
    this.courseId = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
  });
  MoorLessonCompanion.insert({
    this.id = const Value.absent(),
    required int courseId,
    required String name,
    required String description,
  })  : courseId = Value(courseId),
        name = Value(name),
        description = Value(description);
  static Insertable<MoorLessonData> custom({
    Expression<int>? id,
    Expression<int>? courseId,
    Expression<String>? name,
    Expression<String>? description,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (courseId != null) 'course_id': courseId,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
    });
  }

  MoorLessonCompanion copyWith(
      {Value<int>? id,
      Value<int>? courseId,
      Value<String>? name,
      Value<String>? description}) {
    return MoorLessonCompanion(
      id: id ?? this.id,
      courseId: courseId ?? this.courseId,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (courseId.present) {
      map['course_id'] = Variable<int>(courseId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MoorLessonCompanion(')
          ..write('id: $id, ')
          ..write('courseId: $courseId, ')
          ..write('name: $name, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

class $MoorLessonTable extends MoorLesson
    with TableInfo<$MoorLessonTable, MoorLessonData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MoorLessonTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _courseIdMeta = const VerificationMeta('courseId');
  @override
  late final GeneratedColumn<int?> courseId = GeneratedColumn<int?>(
      'course_id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String?> description = GeneratedColumn<String?>(
      'description', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, courseId, name, description];
  @override
  String get aliasedName => _alias ?? 'moor_lesson';
  @override
  String get actualTableName => 'moor_lesson';
  @override
  VerificationContext validateIntegrity(Insertable<MoorLessonData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('course_id')) {
      context.handle(_courseIdMeta,
          courseId.isAcceptableOrUnknown(data['course_id']!, _courseIdMeta));
    } else if (isInserting) {
      context.missing(_courseIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MoorLessonData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return MoorLessonData.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $MoorLessonTable createAlias(String alias) {
    return $MoorLessonTable(attachedDatabase, alias);
  }
}

abstract class _$CourseDatabase extends GeneratedDatabase {
  _$CourseDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $MoorCourseTable moorCourse = $MoorCourseTable(this);
  late final $MoorLessonTable moorLesson = $MoorLessonTable(this);
  late final CourseDao courseDao = CourseDao(this as CourseDatabase);
  late final LessonDao lessonDao = LessonDao(this as CourseDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [moorCourse, moorLesson];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$CourseDaoMixin on DatabaseAccessor<CourseDatabase> {
  $MoorCourseTable get moorCourse => attachedDatabase.moorCourse;
}
mixin _$LessonDaoMixin on DatabaseAccessor<CourseDatabase> {
  $MoorLessonTable get moorLesson => attachedDatabase.moorLesson;
}
