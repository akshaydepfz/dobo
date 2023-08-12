class RelativeModel {
  String pk;
  String fullName;
  DateTime dob;
  String gender;
  dynamic whatsappNo;
  dynamic address;
  dynamic email;
  dynamic image;
  dynamic city;
  String location;
  String age;

  RelativeModel({
    required this.pk,
    required this.fullName,
    required this.dob,
    required this.gender,
    this.whatsappNo,
    this.address,
    this.email,
    this.image,
    this.city,
    required this.location,
    required this.age,
  });

  factory RelativeModel.fromJson(Map<String, dynamic> json) => RelativeModel(
        pk: json["pk"],
        fullName: json["full_name"],
        dob: DateTime.parse(json["dob"]),
        gender: json["gender"],
        whatsappNo: json["whatsapp_no"] ?? "",
        address: json["address"] ?? "",
        email: json["email"] ?? "",
        image: json["image"] ?? "",
        city: json["city"],
        location: json["location"] ?? "",
        age: json["age"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "pk": pk,
        "full_name": fullName,
        "dob":
            "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
        "gender": gender,
        "whatsapp_no": whatsappNo,
        "address": address,
        "email": email,
        "image": image,
        "city": city,
        "location": location,
        "age": age,
      };
}
