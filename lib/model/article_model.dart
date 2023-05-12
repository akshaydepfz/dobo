class ArticleModel {
  String id;
  DateTime created;
  DateTime updated;
  bool isActive;
  String title;
  String summary;
  String description;
  DateTime date;
  String image;
  bool isTrending;
  dynamic creator;

  ArticleModel({
    required this.id,
    required this.created,
    required this.updated,
    required this.isActive,
    required this.title,
    required this.summary,
    required this.description,
    required this.date,
    required this.image,
    required this.isTrending,
    this.creator,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
        id: json["id"],
        created: DateTime.parse(json["created"]),
        updated: DateTime.parse(json["updated"]),
        isActive: json["is_active"],
        title: json["title"],
        summary: json["summary"],
        description: json["description"],
        date: DateTime.parse(json["date"]),
        image: json["image"],
        isTrending: json["is_trending"],
        creator: json["creator"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created": created.toIso8601String(),
        "updated": updated.toIso8601String(),
        "is_active": isActive,
        "title": title,
        "summary": summary,
        "description": description,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "image": image,
        "is_trending": isTrending,
        "creator": creator,
      };
}
