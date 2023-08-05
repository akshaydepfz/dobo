// To parse this JSON data, do
//
//     final sloteModel = sloteModelFromJson(jsonString);

import 'dart:convert';

SloteModel sloteModelFromJson(String str) => SloteModel.fromJson(json.decode(str));

String sloteModelToJson(SloteModel data) => json.encode(data.toJson());

class SloteModel {
    String id;
    String doctorName;
    dynamic doctorPhoto;
    String doctorDepartment;
    int pendingAppointmentCount;
    int completedAppointmentCount;
    int cancelledAppointmentCount;
    int absentAppointmentCount;
    DateTime created;
    DateTime updated;
    bool isActive;
    String startTime;
    String endTime;
    String weekday;
    int maxAppointments;
    dynamic creator;
    Clinic clinic;
    Doctor doctor;

    SloteModel({
        required this.id,
        required this.doctorName,
        this.doctorPhoto,
        required this.doctorDepartment,
        required this.pendingAppointmentCount,
        required this.completedAppointmentCount,
        required this.cancelledAppointmentCount,
        required this.absentAppointmentCount,
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
        doctorName: json["doctor_name"],
        doctorPhoto: json["doctor_photo"],
        doctorDepartment: json["doctor_department"],
        pendingAppointmentCount: json["pending_appointment_count"],
        completedAppointmentCount: json["completed_appointment_count"],
        cancelledAppointmentCount: json["cancelled_appointment_count"],
        absentAppointmentCount: json["absent_appointment_count"],
        created: DateTime.parse(json["created"]),
        updated: DateTime.parse(json["updated"]),
        isActive: json["is_active"],
        startTime: json["start_time"],
        endTime: json["end_time"],
        weekday: json["weekday"],
        maxAppointments: json["max_appointments"],
        creator: json["creator"],
        clinic: Clinic.fromJson(json["clinic"]),
        doctor: Doctor.fromJson(json["doctor"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "doctor_name": doctorName,
        "doctor_photo": doctorPhoto,
        "doctor_department": doctorDepartment,
        "pending_appointment_count": pendingAppointmentCount,
        "completed_appointment_count": completedAppointmentCount,
        "cancelled_appointment_count": cancelledAppointmentCount,
        "absent_appointment_count": absentAppointmentCount,
        "created": created.toIso8601String(),
        "updated": updated.toIso8601String(),
        "is_active": isActive,
        "start_time": startTime,
        "end_time": endTime,
        "weekday": weekday,
        "max_appointments": maxAppointments,
        "creator": creator,
        "clinic": clinic.toJson(),
        "doctor": doctor.toJson(),
    };
}

class Clinic {
    String id;
    DateTime created;
    DateTime updated;
    bool isActive;
    String clinicName;
    String phone;
    dynamic whatsapp;
    String streetName;
    String city;
    String pincode;
    String description;
    dynamic email;
    dynamic image;
    dynamic logo;
    String location;
    String status;
    dynamic ownerName;
    dynamic ownerPhone;
    dynamic ownerEmail;
    dynamic ownerAddress;
    dynamic patientsServed;
    dynamic yearsOfExperience;
    bool isAccepted;
    dynamic creator;
    int user;
    String district;
    String state;
    List<dynamic> departments;

    Clinic({
        required this.id,
        required this.created,
        required this.updated,
        required this.isActive,
        required this.clinicName,
        required this.phone,
        this.whatsapp,
        required this.streetName,
        required this.city,
        required this.pincode,
        required this.description,
        this.email,
        this.image,
        this.logo,
        required this.location,
        required this.status,
        this.ownerName,
        this.ownerPhone,
        this.ownerEmail,
        this.ownerAddress,
        this.patientsServed,
        this.yearsOfExperience,
        required this.isAccepted,
        this.creator,
        required this.user,
        required this.district,
        required this.state,
        required this.departments,
    });

    factory Clinic.fromJson(Map<String, dynamic> json) => Clinic(
        id: json["id"],
        created: DateTime.parse(json["created"]),
        updated: DateTime.parse(json["updated"]),
        isActive: json["is_active"],
        clinicName: json["clinic_name"],
        phone: json["phone"],
        whatsapp: json["whatsapp"],
        streetName: json["street_name"],
        city: json["city"],
        pincode: json["pincode"],
        description: json["description"],
        email: json["email"],
        image: json["image"],
        logo: json["logo"],
        location: json["location"],
        status: json["status"],
        ownerName: json["owner_name"],
        ownerPhone: json["owner_phone"],
        ownerEmail: json["owner_email"],
        ownerAddress: json["owner_address"],
        patientsServed: json["patients_served"],
        yearsOfExperience: json["years_of_experience"],
        isAccepted: json["is_accepted"],
        creator: json["creator"],
        user: json["user"],
        district: json["district"],
        state: json["state"],
        departments: List<dynamic>.from(json["departments"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "created": created.toIso8601String(),
        "updated": updated.toIso8601String(),
        "is_active": isActive,
        "clinic_name": clinicName,
        "phone": phone,
        "whatsapp": whatsapp,
        "street_name": streetName,
        "city": city,
        "pincode": pincode,
        "description": description,
        "email": email,
        "image": image,
        "logo": logo,
        "location": location,
        "status": status,
        "owner_name": ownerName,
        "owner_phone": ownerPhone,
        "owner_email": ownerEmail,
        "owner_address": ownerAddress,
        "patients_served": patientsServed,
        "years_of_experience": yearsOfExperience,
        "is_accepted": isAccepted,
        "creator": creator,
        "user": user,
        "district": district,
        "state": state,
        "departments": List<dynamic>.from(departments.map((x) => x)),
    };
}

class Doctor {
    String id;
    DateTime created;
    DateTime updated;
    bool isActive;
    String fullName;
    String gender;
    String phone;
    String designation;
    String qualification;
    dynamic image;
    DateTime dateJoined;
    String address;
    dynamic description;
    int patientsServed;
    bool isProfileCompleted;
    bool isVerified;
    dynamic creator;
    int user;
    String department;

    Doctor({
        required this.id,
        required this.created,
        required this.updated,
        required this.isActive,
        required this.fullName,
        required this.gender,
        required this.phone,
        required this.designation,
        required this.qualification,
        this.image,
        required this.dateJoined,
        required this.address,
        this.description,
        required this.patientsServed,
        required this.isProfileCompleted,
        required this.isVerified,
        this.creator,
        required this.user,
        required this.department,
    });

    factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
        id: json["id"],
        created: DateTime.parse(json["created"]),
        updated: DateTime.parse(json["updated"]),
        isActive: json["is_active"],
        fullName: json["full_name"],
        gender: json["gender"],
        phone: json["phone"],
        designation: json["designation"],
        qualification: json["qualification"],
        image: json["image"],
        dateJoined: DateTime.parse(json["date_joined"]),
        address: json["address"],
        description: json["description"],
        patientsServed: json["patients_served"],
        isProfileCompleted: json["is_profile_completed"],
        isVerified: json["is_verified"],
        creator: json["creator"],
        user: json["user"],
        department: json["department"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "created": created.toIso8601String(),
        "updated": updated.toIso8601String(),
        "is_active": isActive,
        "full_name": fullName,
        "gender": gender,
        "phone": phone,
        "designation": designation,
        "qualification": qualification,
        "image": image,
        "date_joined": "${dateJoined.year.toString().padLeft(4, '0')}-${dateJoined.month.toString().padLeft(2, '0')}-${dateJoined.day.toString().padLeft(2, '0')}",
        "address": address,
        "description": description,
        "patients_served": patientsServed,
        "is_profile_completed": isProfileCompleted,
        "is_verified": isVerified,
        "creator": creator,
        "user": user,
        "department": department,
    };
}
