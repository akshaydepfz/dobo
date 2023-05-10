class AppointmentListModel {
  String id;
  DateTime created;
  DateTime updated;
  bool isActive;
  String status;
  int tokenNumber;
  String reason;
  String symptoms;
  String prescription;
  String notes;
  dynamic creator;
  Schedule schedule;
  Patient patient;

  AppointmentListModel({
    required this.id,
    required this.created,
    required this.updated,
    required this.isActive,
    required this.status,
    required this.tokenNumber,
    required this.reason,
    required this.symptoms,
    required this.prescription,
    required this.notes,
    this.creator,
    required this.schedule,
    required this.patient,
  });

  factory AppointmentListModel.fromJson(Map<String, dynamic> json) =>
      AppointmentListModel(
        id: json["id"],
        created: DateTime.parse(json["created"]),
        updated: DateTime.parse(json["updated"]),
        isActive: json["is_active"],
        status: json["status"],
        tokenNumber: json["token_number"],
        reason: json["reason"],
        symptoms: json["symptoms"],
        prescription: json["prescription"],
        notes: json["notes"],
        creator: json["creator"],
        schedule: Schedule.fromJson(json["schedule"]),
        patient: Patient.fromJson(json["patient"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created": created.toIso8601String(),
        "updated": updated.toIso8601String(),
        "is_active": isActive,
        "status": status,
        "token_number": tokenNumber,
        "reason": reason,
        "symptoms": symptoms,
        "prescription": prescription,
        "notes": notes,
        "creator": creator,
        "schedule": schedule.toJson(),
        "patient": patient.toJson(),
      };
}

class Patient {
  String id;
  DateTime created;
  DateTime updated;
  bool isActive;
  String fullName;
  DateTime dob;
  String gender;
  String phone;
  String? whatsappNo;
  String address;
  String email;
  String? image;
  String? city;
  String location;
  dynamic creator;
  int user;

  Patient({
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
    this.city,
    required this.location,
    this.creator,
    required this.user,
  });

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
        id: json["id"],
        created: DateTime.parse(json["created"]),
        updated: DateTime.parse(json["updated"]),
        isActive: json["is_active"],
        fullName: json["full_name"],
        dob: DateTime.parse(json["dob"]),
        gender: json["gender"],
        phone: json["phone"],
        whatsappNo: json["whatsapp_no"],
        address: json["address"],
        email: json["email"],
        image: json["image"],
        city: json["city"],
        location: json["location"],
        creator: json["creator"],
        user: json["user"],
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
        "user": user,
      };
}

class Schedule {
  String id;
  DateTime created;
  DateTime updated;
  bool isActive;
  String startTime;
  String endTime;
  DateTime date;
  int maxAppointments;
  dynamic creator;
  String clinic;
  String doctor;

  Schedule({
    required this.id,
    required this.created,
    required this.updated,
    required this.isActive,
    required this.startTime,
    required this.endTime,
    required this.date,
    required this.maxAppointments,
    this.creator,
    required this.clinic,
    required this.doctor,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        id: json["id"],
        created: DateTime.parse(json["created"]),
        updated: DateTime.parse(json["updated"]),
        isActive: json["is_active"],
        startTime: json["start_time"],
        endTime: json["end_time"],
        date: DateTime.parse(json["date"]),
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
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "max_appointments": maxAppointments,
        "creator": creator,
        "clinic": clinic,
        "doctor": doctor,
      };
}
