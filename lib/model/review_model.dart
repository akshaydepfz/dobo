class ReviewModel {
  String id;
  DateTime created;
  DateTime updated;
  bool isActive;
  String review;
  int rating;
  dynamic creator;
  String doctor;
  String patient;

  ReviewModel({
    required this.id,
    required this.created,
    required this.updated,
    required this.isActive,
    required this.review,
    required this.rating,
    this.creator,
    required this.doctor,
    required this.patient,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
        id: json["id"],
        created: DateTime.parse(json["created"]),
        updated: DateTime.parse(json["updated"]),
        isActive: json["is_active"],
        review: json["review"],
        rating: json["rating"],
        creator: json["creator"],
        doctor: json["doctor"],
        patient: json["patient"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created": created.toIso8601String(),
        "updated": updated.toIso8601String(),
        "is_active": isActive,
        "review": review,
        "rating": rating,
        "creator": creator,
        "doctor": doctor,
        "patient": patient,
      };
}
