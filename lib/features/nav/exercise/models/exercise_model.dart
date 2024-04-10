class ExerciseModel {
  String? bodyPart;
  String? equipment;
  String? gifUrl;
  int? id;
  String? name;
  String? target;
  List<String>? secondaryMuscles;
  List<String>? instructions;
  int? bodyPartId;

  ExerciseModel({
    this.bodyPart,
    this.equipment,
    this.gifUrl,
    this.id,
    this.name,
    this.target,
    this.secondaryMuscles,
    this.instructions,
    this.bodyPartId,
  });

  factory ExerciseModel.fromJson(Map<String, dynamic> json) => ExerciseModel(
        bodyPart: json["bodyPart"],
        equipment: json["equipment"],
        gifUrl: json["gifUrl"],
        id: json["id"],
        name: json["name"],
        target: json["target"],
        secondaryMuscles: json["secondaryMuscles"] == null
            ? []
            : List<String>.from(json["secondaryMuscles"]!.map((x) => x)),
        instructions: json["instructions"] == null
            ? []
            : List<String>.from(json["instructions"]!.map((x) => x)),
        bodyPartId: json["bodyPartId"],
      );

  Map<String, dynamic> toJson() => {
        "bodyPart": bodyPart,
        "equipment": equipment,
        "gifUrl": gifUrl,
        "id": id,
        "name": name,
        "target": target,
        "secondaryMuscles": secondaryMuscles == null
            ? []
            : List<dynamic>.from(secondaryMuscles!.map((x) => x)),
        "instructions": instructions == null
            ? []
            : List<dynamic>.from(instructions!.map((x) => x)),
        "bodyPartId": bodyPartId,
      };
}
