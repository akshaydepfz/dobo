class SloteModel {
  String id;
  DateTime created;
  DateTime updated;
  bool isActive;
  String startTime;
  String endTime;
  String weekday;
  int maxAppointments;
  dynamic creator;
  String clinic;
  String doctor;

  SloteModel({
    required this.id,
    required this.created,
    required this.updated,
    required this.isActive,
    required this.startTime,
    required this.endTime,
    required this.weekday,
    required this.maxAppointments,
    this.creator,
    required this.clinic,
    required this.doctor,
  });

  factory SloteModel.fromJson(Map<String, dynamic> json) => SloteModel(
        id: json["id"],
        created: DateTime.parse(json["created"]),
        updated: DateTime.parse(json["updated"]),
        isActive: json["is_active"],
        startTime: json["start_time"],
        endTime: json["end_time"],
        weekday: json["weekday"],
        maxAppointments: json["max_appointments"],
        creator: json["creator"],
        clinic: json["clinic"],
        doctor: json["doctor"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created": created.toIso8601String(),
        "updated": updated.toIso8601String(),
        "is_active": isActive,
        "start_time": startTime,
        "end_time": endTime,
        "weekday": weekday,
        "max_appointments": maxAppointments,
        "creator": creator,
        "clinic": clinic,
        "doctor": doctor,
      };
}
