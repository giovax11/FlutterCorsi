
class Lesson {
  Lesson({
    required this.name,
    required this.description,
  });

  String name;
  String description;

  factory Lesson.fromJson(Map<String, dynamic> json) => Lesson(
    name: json["name"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "description": description,
  };
}
