class JournalJsonModel {
    String className;
    String objectId;
    DateTime createdAt;
    DateTime updatedAt;
    DateTime date;
    String journal;

    JournalJsonModel({
        required this.className,
        required this.objectId,
        required this.createdAt,
        required this.updatedAt,
        required this.date,
        required this.journal,
    });

    factory JournalJsonModel.fromJson(Map<String, dynamic> json) => JournalJsonModel(
        className: json["className"],
        objectId: json["objectId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        date: DateTime.parse(json["date"]['iso']),
        journal: json["journal"],
    );

    Map<String, dynamic> toJson() => {
        "className": className,
        "objectId": objectId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "date": date,
        "journal": journal,
    };
}

