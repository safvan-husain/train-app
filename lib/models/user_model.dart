import 'dart:convert';

class UserModel {
  final String name;
  final String? phone;
  final String? email;

  UserModel({
    required this.name,
    this.phone,
    this.email,
  });

  UserModel copyWith({
    String? name,
    String? phone,
    String? email,
  }) =>
      UserModel(
        name: name ?? this.name,
        phone: phone ?? this.phone,
        email: email ?? this.email,
      );

  factory UserModel.fromRawJson(String str) =>
      UserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "phone": phone,
        "email": email,
      };
}
