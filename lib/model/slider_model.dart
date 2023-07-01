class SliderModel {
  String id;
  DateTime created;
  DateTime updated;
  bool isActive;
  String title;
  String description;
  dynamic creator;

  SliderModel({
    required this.id,
    required this.created,
    required this.updated,
    required this.isActive,
    required this.title,
    required this.description,
    this.creator,
  });

  factory SliderModel.fromJson(Map<String, dynamic> json) => SliderModel(
        id: json["id"],
        created: DateTime.parse(json["created"]),
        updated: DateTime.parse(json["updated"]),
        isActive: json["is_active"],
        title: json["title"],
        description: json["image"],
        creator: json["creator"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created": created.toIso8601String(),
        "updated": updated.toIso8601String(),
        "is_active": isActive,
        "title": title,
        "description": description,
        "creator": creator,
      };
}
