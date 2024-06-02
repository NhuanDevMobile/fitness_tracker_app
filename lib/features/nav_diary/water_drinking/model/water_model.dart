class WaterModel {
  String? id;
  DateTime? dateTimeDisplay;
  DateTime? createAt;
  int? quantity;
  String? userId;

  WaterModel({
    this.dateTimeDisplay,
    this.createAt,
    this.quantity,
    this.userId,
    this.id,
  });

  factory WaterModel.fromJson(Map<String, dynamic> json) => WaterModel(
        dateTimeDisplay: json["dateTimeDisplay"] == null
            ? null
            : DateTime.parse(json["dateTimeDisplay"]),
        createAt:
            json["createAt"] == null ? null : DateTime.parse(json["createAt"]),
        quantity: json["quantity"],
        userId: json["userId"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "dateTimeDisplay": dateTimeDisplay?.toIso8601String(),
        "createAt": createAt?.toIso8601String(),
        "quantity": quantity,
        "userId": userId,
        "id": id,
      };
}
