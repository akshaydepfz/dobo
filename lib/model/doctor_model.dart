class DoctorListModel {
  String id;
  String profileId;
  DateTime created;
  DateTime updated;
  bool isActive;
  String fullName;
  String gender;
  String phone;
  String designation;
  String qualification;
  String experience;
  dynamic image;
  DateTime joiningDate;
  String address;
  String description;
  dynamic creator;
  Department department;

  DoctorListModel({
    required this.id,
    required this.profileId,
    required this.created,
    required this.updated,
    required this.isActive,
    required this.fullName,
    required this.gender,
    required this.phone,
    required this.designation,
    required this.qualification,
    required this.experience,
    this.image,
    required this.joiningDate,
    required this.address,
    required this.description,
    this.creator,
    required this.department,
  });

  factory DoctorListModel.fromJson(Map<String, dynamic> json) =>
      DoctorListModel(
        id: json["id"],
        profileId: json["profile_id"],
        created: DateTime.parse(json["created"]),
        updated: DateTime.parse(json["updated"]),
        isActive: json["is_active"],
        fullName: json["full_name"],
        gender: json["gender"] ?? "",
        phone: json["phone"] ?? "",
        designation: json["designation"],
        qualification: json["qualification"] ?? "",
        experience: json["experience"] ?? '',
        image: json["image"] ?? "",
        joiningDate: DateTime.parse(
            json["joining_date"] ?? '2023-07-13 02:45:27.983267'),
        address: json["address"] ?? "",
        description: json["description"] ?? "",
        creator: json["creator"],
        department: Department.fromJson(json["department"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "profile_id": profileId,
        "created": created.toIso8601String(),
        "updated": updated.toIso8601String(),
        "is_active": isActive,
        "full_name": fullName,
        "gender": gender,
        "phone": phone,
        "designation": designation,
        "qualification": qualification,
        "experience": experience,
        "image": image,
        "joining_date":
            "${joiningDate.year.toString().padLeft(4, '0')}-${joiningDate.month.toString().padLeft(2, '0')}-${joiningDate.day.toString().padLeft(2, '0')}",
        "address": address,
        "description": description,
        "creator": creator,
        "department": department.toJson(),
      };
}

class Department {
  String id;
  DateTime created;
  DateTime updated;
  bool isActive;
  String name;
  String description;
  String image;
  String category;
  dynamic creator;

  Department({
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

  factory Department.fromJson(Map<String, dynamic> json) => Department(
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
