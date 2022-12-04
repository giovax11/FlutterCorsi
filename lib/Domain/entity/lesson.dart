import 'package:uuid/uuid.dart';

class Lesson {
  Lesson({
    required this.name,
    required this.description,
    required id,
  });

  String name;
  String description;
  Uuid id = Uuid();

  factory Lesson.fromJson(Map<String, dynamic> json) => Lesson(
        name: json["name"],
        description: json["description"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "id": id,
      };
}
