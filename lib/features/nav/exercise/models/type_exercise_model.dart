class TypeExerciseModel {
  final int id;
  final String name;
  final String description;
  final String image;

  TypeExerciseModel({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
  });

  factory TypeExerciseModel.fromJson(Map<String, dynamic> json) {
    return TypeExerciseModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
    );
  }
}
