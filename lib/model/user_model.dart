// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

class UserModel {
  int id;
  dynamic lastLogin;
  bool isSuperuser;
  String username;
  String firstName;
  String lastName;
  String email;
  bool isStaff;
  bool isActive;
  String image;
  DateTime dateJoined;
  String userType;
  List<dynamic> groups;
  List<dynamic> userPermissions;

  UserModel(
      {required this.id,
      this.lastLogin,
      required this.isSuperuser,
      required this.username,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.isStaff,
      required this.isActive,
      required this.dateJoined,
      required this.userType,
      required this.groups,
      required this.userPermissions,
      required this.image});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      id: json["id"],
      lastLogin: json["last_login"],
      isSuperuser: json["is_superuser"],
      username: json["username"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      email: json["email"],
      isStaff: json["is_staff"],
      isActive: json["is_active"],
      dateJoined: DateTime.parse(json["date_joined"]),
      userType: json["user_type"],
      groups: List<dynamic>.from(json["groups"].map((x) => x)),
      userPermissions:
          List<dynamic>.from(json["user_permissions"].map((x) => x)),
      image: json['image'] ?? "");

  Map<String, dynamic> toJson() => {
        "id": id,
        "last_login": lastLogin,
        "is_superuser": isSuperuser,
        "username": username,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "is_staff": isStaff,
        "is_active": isActive,
        "date_joined": dateJoined.toIso8601String(),
        "user_type": userType,
        "groups": List<dynamic>.from(groups.map((x) => x)),
        "user_permissions": List<dynamic>.from(userPermissions.map((x) => x)),
        image: image,
      };
}
