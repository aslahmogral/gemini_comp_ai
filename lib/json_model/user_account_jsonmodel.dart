class UserAccountJsonModel {
  String className;
  String objectId;
  DateTime createdAt;
  String userName;
  String password;
  String email;
  DateTime reminderDateTime;
  String reminderTime;

  UserAccountJsonModel({
    required this.className,
    required this.objectId,
    required this.createdAt,
    required this.userName,
    required this.password,
    required this.email,
    required this.reminderDateTime,
    required this.reminderTime,
  });

  factory UserAccountJsonModel.fromJson(Map<String, dynamic> json) => UserAccountJsonModel(
        className: json["className"],
        objectId: json["objectId"],
        createdAt: DateTime.parse(json["createdAt"]),
        userName: json["userName"],
        password: json["password"],
        email: json["email"],
        reminderDateTime: DateTime.parse(json["reminderDateTime"]['iso']),
        reminderTime: json["reminderTime"],
      );

  Map<String, dynamic> toJson() => {
        "className": className,
        "objectId": objectId,
        "createdAt": createdAt.toIso8601String(),
        "userName": userName,
        "password": password,
        "email": email,
        "reminderDateTime": reminderDateTime.toIso8601String(),
        "reminderTime": reminderTime,
      };
}
