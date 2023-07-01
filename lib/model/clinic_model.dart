// To parse this JSON data, do
//
//     final clinicModel = clinicModelFromJson(jsonString);

class ClinicModel {
  String id;
  List<Image> images;
  List<Timing> timings;
  double avgRating;
  List<dynamic> departments;
  DateTime created;
  DateTime updated;
  bool isActive;
  String code;
  String clinicName;
  String subtext;
  String description;
  String email;
  String phone;
  String address;
  dynamic image;
  dynamic logo;
  String city;
  String location;
  String status;
  String ownerName;
  String ownerPhone;
  String ownerEmail;
  String ownerAddress;
  String patientsServed;
  String yearsOfExperience;
  dynamic creator;
  int user;

  ClinicModel({
    required this.id,
    required this.images,
    required this.timings,
    required this.avgRating,
    required this.departments,
    required this.created,
    required this.updated,
    required this.isActive,
    required this.code,
    required this.clinicName,
    required this.subtext,
    required this.description,
    required this.email,
    required this.phone,
    required this.address,
    this.image,
    this.logo,
    required this.city,
    required this.location,
    required this.status,
    required this.ownerName,
    required this.ownerPhone,
    required this.ownerEmail,
    required this.ownerAddress,
    required this.patientsServed,
    required this.yearsOfExperience,
    this.creator,
    required this.user,
  });

  factory ClinicModel.fromJson(Map<String, dynamic> json) => ClinicModel(
        id: json["id"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        timings:
            List<Timing>.from(json["timings"].map((x) => Timing.fromJson(x))),
        avgRating: json["avg_rating"] ?? 0,
        departments: List<dynamic>.from(json["departments"].map((x) => x)),
        created: DateTime.parse(json["created"]),
        updated: DateTime.parse(json["updated"]),
        isActive: json["is_active"],
        code: json["code"],
        clinicName: json["clinic_name"],
        subtext: json["subtext"],
        description: json["description"],
        email: json["email"],
        phone: json["phone"],
        address: json["address"],
        image: json["image"],
        logo: json["logo"],
        city: json["city"],
        location: json["location"],
        status: json["status"],
        ownerName: json["owner_name"] ?? "",
        ownerPhone: json["owner_phone"] ?? "",
        ownerEmail: json["owner_email"] ?? "",
        ownerAddress: json["owner_address"] ?? "",
        patientsServed: json["patients_served"],
        yearsOfExperience: json["years_of_experience"],
        creator: json["creator"],
        user: json["user"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "timings": List<dynamic>.from(timings.map((x) => x.toJson())),
        "avg_rating": avgRating,
        "departments": List<dynamic>.from(departments.map((x) => x)),
        "created": created.toIso8601String(),
        "updated": updated.toIso8601String(),
        "is_active": isActive,
        "code": code,
        "clinic_name": clinicName,
        "subtext": subtext,
        "description": description,
        "email": email,
        "phone": phone,
        "address": address,
        "image": image,
        "logo": logo,
        "city": city,
        "location": location,
        "status": status,
        "owner_name": ownerName,
        "owner_phone": ownerPhone,
        "owner_email": ownerEmail,
        "owner_address": ownerAddress,
        "patients_served": patientsServed,
        "years_of_experience": yearsOfExperience,
        "creator": creator,
        "user": user,
      };
}

class Image {
  int id;
  String image;
  String clinic;

  Image({
    required this.id,
    required this.image,
    required this.clinic,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        image: json["image"],
        clinic: json["clinic"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "clinic": clinic,
      };
}

class Timing {
  int id;
  String day;
  String startTime;
  String endTime;
  String clinic;

  Timing({
    required this.id,
    required this.day,
    required this.startTime,
    required this.endTime,
    required this.clinic,
  });

  factory Timing.fromJson(Map<String, dynamic> json) => Timing(
        id: json["id"],
        day: json["day"],
        startTime: json["start_time"],
        endTime: json["end_time"],
        clinic: json["clinic"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "day": day,
        "start_time": startTime,
        "end_time": endTime,
        "clinic": clinic,
      };
}
