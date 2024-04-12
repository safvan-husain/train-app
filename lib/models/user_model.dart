// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  final String name;
  final String? phone;
  final String? email;
  final String jsonWebToken;

  UserModel({
    required this.name,
    this.phone,
    this.email,
    required this.jsonWebToken,
  });

  UserModel copyWith({
    String? name,
    String? phone,
    String? email,
    String? jsonWebToken,
  }) {
    return UserModel(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      jsonWebToken: jsonWebToken ?? this.jsonWebToken,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'phone': phone,
      'email': email,
      'auth_token': jsonWebToken,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      phone: map['phone'] != null ? map['phone'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      jsonWebToken: map['auth_token'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
