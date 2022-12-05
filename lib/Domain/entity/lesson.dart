class Lesson {
  Lesson({
    required this.idLesson,
    required this.name,
    required this.description,
    required this.courseId,
  });
  String idLesson;
  String name;
  String description;
  String courseId;

  factory Lesson.fromJson(Map<String, dynamic> json) => Lesson(
        idLesson: json["idlesson"],
        name: json["name"],
        description: json["description"],
        courseId: json["courseId"],
      );

  Map<String, dynamic> toJson() => {
        "idlesson": idLesson,
        "name": name,
        "description": description,
        "courseId": courseId,
      };
}
