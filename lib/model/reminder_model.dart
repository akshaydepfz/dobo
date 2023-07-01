class ReminderModel {
  int id;
  String title;
  String department;
  String clinic;
  String time;
  String description;
  String token;

  ReminderModel({
    required this.id,
    required this.title,
    required this.department,
    required this.clinic,
    required this.time,
    required this.description,
    required this.token,
  });

  factory ReminderModel.fromJson(Map<String, dynamic> json) => ReminderModel(
        id: json["id"],
        title: json["title"],
        department: json["department"],
        clinic: json["clinic"],
        time: json["time"],
        description: json["description"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "department": department,
        "clinic": clinic,
        "time": time,
        "description": description,
        "token": token,
      };
}
