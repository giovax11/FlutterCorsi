
class Lesson {
  Lesson({
    required this.idLesson,
    required this.name,
    required this.description,
  });
  String idLesson;
  String name;
  String description;

  factory Lesson.fromJson(Map<String, dynamic> json) => Lesson(
    idLesson: json["idlesson"],
    name: json["name"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "idlesson":idLesson,
    "name": name,
    "description": description,
  };
}
