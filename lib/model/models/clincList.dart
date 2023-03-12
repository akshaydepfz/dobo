// To parse this JSON data, do
//
//     final clinicList = clinicListFromJson(jsonString);

import 'dart:convert';

List<ClinicList> clinicListFromJson(String str) =>
    List<ClinicList>.from(json.decode(str).map((x) => ClinicList.fromJson(x)));

String clinicListToJson(List<ClinicList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ClinicList {
  ClinicList({
    required this.id,
    required this.created,
    required this.updated,
    required this.isActive,
    required this.code,
    required this.clinicName,
    required this.description,
    this.email,
    required this.phone,
    required this.address,
    this.image,
    this.logo,
    required this.city,
    required this.location,
    required this.status,
    this.ownerName,
    this.ownerPhone,
    this.ownerEmail,
    this.ownerAddress,
    this.creator,
    required this.user,
  });

  String id;
  DateTime created;
  DateTime updated;
  bool isActive;
  String code;
  String clinicName;
  String description;
  String? email;
  String phone;
  String address;
  dynamic image;
  String? logo;
  String city;
  String location;
  String status;
  dynamic ownerName;
  dynamic ownerPhone;
  dynamic ownerEmail;
  dynamic ownerAddress;
  dynamic creator;
  int user;

  factory ClinicList.fromJson(Map<String, dynamic> json) => ClinicList(
        id: json["id"],
        created: DateTime.parse(json["created"]),
        updated: DateTime.parse(json["updated"]),
        isActive: json["is_active"],
        code: json["code"],
        clinicName: json["clinic_name"],
        description: json["description"],
        email: json["email"],
        phone: json["phone"],
        address: json["address"],
        image: json["image"],
        logo: json["logo"],
        city: json["city"],
        location: json["location"],
        status: json["status"],
        ownerName: json["owner_name"],
        ownerPhone: json["owner_phone"],
        ownerEmail: json["owner_email"],
        ownerAddress: json["owner_address"],
        creator: json["creator"],
        user: json["user"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created": created.toIso8601String(),
        "updated": updated.toIso8601String(),
        "is_active": isActive,
        "code": code,
        "clinic_name": clinicName,
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
        "creator": creator,
        "user": user,
      };
}
