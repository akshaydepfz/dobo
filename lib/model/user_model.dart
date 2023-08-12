class UserModel {
  String id;
  DateTime created;
  DateTime updated;
  bool isActive;
  String fullName;
  DateTime dob;
  String gender;
  String phone;
  dynamic whatsappNo;
  String address;
  String email;
  dynamic image;
  String city;
  String location;
  dynamic creator;
  dynamic addedBy;
  int user;

  UserModel({
    required this.id,
    required this.created,
    required this.updated,
    required this.isActive,
    required this.fullName,
    required this.dob,
    required this.gender,
    required this.phone,
    this.whatsappNo,
    required this.address,
    required this.email,
    this.image,
    required this.city,
    required this.location,
    this.creator,
    this.addedBy,
    required this.user,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        created: DateTime.parse(json["created"]),
        updated: DateTime.parse(json["updated"]),
        isActive: json["is_active"],
        fullName: json["full_name"] ?? '',
        dob: DateTime.parse(json["dob"]),
        gender: json["gender"] ?? '',
        phone: json["phone"] ?? '',
        whatsappNo: json["whatsapp_no"] ?? "",
        address: json["address"] ?? '',
        email: json["email"] ?? '',
        image: json["image"] ?? '',
        city: json["city"] ?? "",
        location: json["location"] ?? '',
        creator: json["creator"] ?? "",
        addedBy: json["added_by"] ?? "",
        user: json["user"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created": created.toIso8601String(),
        "updated": updated.toIso8601String(),
        "is_active": isActive,
        "full_name": fullName,
        "dob":
            "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
        "gender": gender,
        "phone": phone,
        "whatsapp_no": whatsappNo,
        "address": address,
        "email": email,
        "image": image,
        "city": city,
        "location": location,
        "creator": creator,
        "added_by": addedBy,
        "user": user,
      };
}
