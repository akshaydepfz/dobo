class DepartmentModel {
  String id;
  DateTime created;
  DateTime updated;
  bool isActive;
  String name;
  String description;
  String image;
  String category;
  dynamic creator;

  DepartmentModel({
    required this.id,
    required this.created,
    required this.updated,
    required this.isActive,
    required this.name,
    required this.description,
    required this.image,
    required this.category,
    this.creator,
  });

  factory DepartmentModel.fromJson(Map<String, dynamic> json) =>
      DepartmentModel(
        id: json["id"],
        created: DateTime.parse(json["created"]),
        updated: DateTime.parse(json["updated"]),
        isActive: json["is_active"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        category: json["category"],
        creator: json["creator"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created": created.toIso8601String(),
        "updated": updated.toIso8601String(),
        "is_active": isActive,
        "name": name,
        "description": description,
        "image": image,
        "category": category,
        "creator": creator,
      };
}
