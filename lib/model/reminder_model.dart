class ReminderModel {
  int id;
  String title;
  String time;
  String description;
  String token;

  ReminderModel({
    required this.id,
    required this.title,
    required this.time,
    required this.description,
    required this.token,
  });

  factory ReminderModel.fromJson(Map<String, dynamic> json) => ReminderModel(
        id: json["id"],
        title: json["title"],
        time: json["time"],
        description: json["description"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "time": time,
        "description": description,
        "token": token,
      };
}
