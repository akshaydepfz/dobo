class AppointmentListModel {
  String? id;
  String? clinicName;
  dynamic clinicPhoto;
  String? doctorName;
  DateTime? created;
  DateTime? updated;
  bool? isActive;
  String? status;
  int? tokenNumber;
  String? reason;
  String? symptoms;
  String? prescription;
  String? notes;
  DateTime? date;
  String? cancellationReason;
  dynamic creator;
  Schedule? schedule;
  Patient? patient;

  AppointmentListModel({
    this.id,
    this.clinicName,
    this.clinicPhoto,
    this.doctorName,
    this.created,
    this.updated,
    this.isActive,
    this.status,
    this.tokenNumber,
    this.reason,
    this.symptoms,
    this.prescription,
    this.notes,
    this.date,
    this.cancellationReason,
    this.creator,
    this.schedule,
    this.patient,
  });

  factory AppointmentListModel.fromJson(Map<String, dynamic> json) =>
      AppointmentListModel(
        id: json["id"],
        clinicName: json["clinic_name"],
        clinicPhoto: json["clinic_photo"],
        doctorName: json["doctor_name"],
        created:
            json["created"] == null ? null : DateTime.parse(json["created"]),
        updated:
            json["updated"] == null ? null : DateTime.parse(json["updated"]),
        isActive: json["is_active"],
        status: json["status"],
        tokenNumber: json["token_number"],
        reason: json["reason"],
        symptoms: json["symptoms"],
        prescription: json["prescription"],
        notes: json["notes"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        cancellationReason: json["cancellation_reason"],
        creator: json["creator"],
        schedule: json["schedule"] == null
            ? null
            : Schedule.fromJson(json["schedule"]),
        patient:
            json["patient"] == null ? null : Patient.fromJson(json["patient"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "clinic_name": clinicName,
        "clinic_photo": clinicPhoto,
        "doctor_name": doctorName,
        "created": created?.toIso8601String(),
        "updated": updated?.toIso8601String(),
        "is_active": isActive,
        "status": status,
        "token_number": tokenNumber,
        "reason": reason,
        "symptoms": symptoms,
        "prescription": prescription,
        "notes": notes,
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "cancellation_reason": cancellationReason,
        "creator": creator,
        "schedule": schedule?.toJson(),
        "patient": patient?.toJson(),
      };
}

class Patient {
  String? id;
  DateTime? created;
  DateTime? updated;
  bool? isActive;
  String? fullName;
  DateTime? dob;
  String? gender;
  String? phone;
  dynamic whatsappNo;
  String? address;
  String? email;
  String? image;
  String? city;
  String? location;
  dynamic creator;
  dynamic addedBy;
  int? user;

  Patient({
    this.id,
    this.created,
    this.updated,
    this.isActive,
    this.fullName,
    this.dob,
    this.gender,
    this.phone,
    this.whatsappNo,
    this.address,
    this.email,
    this.image,
    this.city,
    this.location,
    this.creator,
    this.addedBy,
    this.user,
  });

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
        id: json["id"],
        created:
            json["created"] == null ? null : DateTime.parse(json["created"]),
        updated:
            json["updated"] == null ? null : DateTime.parse(json["updated"]),
        isActive: json["is_active"],
        fullName: json["full_name"],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        gender: json["gender"],
        phone: json["phone"],
        whatsappNo: json["whatsapp_no"],
        address: json["address"],
        email: json["email"],
        image: json["image"],
        city: json["city"],
        location: json["location"],
        creator: json["creator"],
        addedBy: json["added_by"],
        user: json["user"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created": created?.toIso8601String(),
        "updated": updated?.toIso8601String(),
        "is_active": isActive,
        "full_name": fullName,
        "dob":
            "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
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

class Schedule {
  String? id;
  DateTime? created;
  DateTime? updated;
  bool? isActive;
  String? startTime;
  String? endTime;
  String? weekday;
  int? maxAppointments;
  dynamic creator;
  String? clinic;
  String? doctor;

  Schedule({
    this.id,
    this.created,
    this.updated,
    this.isActive,
    this.startTime,
    this.endTime,
    this.weekday,
    this.maxAppointments,
    this.creator,
    this.clinic,
    this.doctor,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        id: json["id"],
        created:
            json["created"] == null ? null : DateTime.parse(json["created"]),
        updated:
            json["updated"] == null ? null : DateTime.parse(json["updated"]),
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
        "created": created?.toIso8601String(),
        "updated": updated?.toIso8601String(),
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
