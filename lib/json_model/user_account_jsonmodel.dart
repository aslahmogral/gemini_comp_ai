class UserAccountJsonModel {
  String className;
  String objectId;
  DateTime createdAt;
  String userName;
  String password;
  String email;

  UserAccountJsonModel({
    required this.className,
    required this.objectId,
    required this.createdAt,
    required this.userName,
    required this.password,
    required this.email,
  });

  factory UserAccountJsonModel.fromJson(Map<String, dynamic> json) => UserAccountJsonModel(
        className: json["className"],
        objectId: json["objectId"],
        createdAt: DateTime.parse(json["createdAt"]),
        userName: json["userName"],
        password: json["password"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "className": className,
        "objectId": objectId,
        "createdAt": createdAt.toIso8601String(),
        "userName": userName,
        "password": password,
        "email": email,
      };
}

