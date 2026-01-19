// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    final int code;
    final bool success;
    final LoginData data;
    final String token;

    LoginModel({
        required this.code,
        required this.success,
        required this.data,
        required this.token,
    });

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        code: json["code"],
        success: json["success"],
        data: LoginData.fromJson(json["data"]),
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "success": success,
        "data": data.toJson(),
        "token": token,
    };
}

class LoginData {
    final int id;
    final String name;
    final String email;
    final DateTime emailVerifiedAt;
    final String role;
    final String status;
    final String otp;
    final DateTime createdAt;
    final DateTime updatedAt;

    LoginData({
        required this.id,
        required this.name,
        required this.email,
        required this.emailVerifiedAt,
        required this.role,
        required this.status,
        required this.otp,
        required this.createdAt,
        required this.updatedAt,
    });

    factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
        role: json["role"],
        status: json["status"],
        otp: json["otp"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt.toIso8601String(),
        "role": role,
        "status": status,
        "otp": otp,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
