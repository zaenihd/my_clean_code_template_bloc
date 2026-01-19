import 'dart:convert';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

DateTime? parseDate(dynamic value) {
  if (value == null || value.toString().isEmpty) return null;
  return DateTime.tryParse(value.toString());
}

/* ===================== PROFILE MODEL ===================== */

class ProfileModel {
  final int code;
  final bool success;
  final String message;
  final ProfileData? data;

  ProfileModel({
    required this.code,
    required this.success,
    required this.message,
    this.data,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        code: json["code"] ?? 0,
        success: json["success"] ?? false,
        message: json["message"] ?? '',
        data: json["data"] == null
            ? null
            : ProfileData.fromJson(json["data"]),
      );
}

/* ===================== PROFILE DATA ===================== */

class ProfileData {
  final int id;
  final String name;
  final String email;
  final DateTime? emailVerifiedAt;
  final String role;
  final String status;
  final String otp;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<Client> client;
  final List<CardAk1> cardAk1;

  ProfileData({
    required this.id,
    required this.name,
    required this.email,
    this.emailVerifiedAt,
    required this.role,
    required this.status,
    required this.otp,
    this.createdAt,
    this.updatedAt,
    required this.client,
    required this.cardAk1,
  });

  factory ProfileData.fromJson(Map<String, dynamic> json) => ProfileData(
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
        email: json["email"] ?? '',
        emailVerifiedAt: parseDate(json["email_verified_at"]),
        role: json["role"] ?? '',
        status: json["status"] ?? '',
        otp: json["otp"] ?? '',
        createdAt: parseDate(json["created_at"]),
        updatedAt: parseDate(json["updated_at"]),
        client: (json["client"] as List?)
                ?.map((e) => Client.fromJson(e))
                .toList() ??
            [],
        cardAk1: (json["card_ak1"] as List?)
                ?.map((e) => CardAk1.fromJson(e))
                .toList() ??
            [],
      );
}

/* ===================== CARD AK1 ===================== */

class CardAk1 {
  final int id;
  final String userId;
  final String fullName;
  final String placeOfBirth;
  final DateTime? dateOfBirth;
  final String gender;
  final String religion;
  final String nik;
  final String status;
  final String address;

  CardAk1({
    required this.id,
    required this.userId,
    required this.fullName,
    required this.placeOfBirth,
    this.dateOfBirth,
    required this.gender,
    required this.religion,
    required this.nik,
    required this.status,
    required this.address,
  });

  factory CardAk1.fromJson(Map<String, dynamic> json) => CardAk1(
        id: json["id"] ?? 0,
        userId: json["user_id"] ?? '',
        fullName: json["full_name"] ?? '',
        placeOfBirth: json["place_of_birth"] ?? '',
        dateOfBirth: parseDate(json["date_of_birth"]),
        gender: json["gender"] ?? '',
        religion: json["religion"] ?? '',
        nik: json["nik"] ?? '',
        status: json["status"] ?? '',
        address: json["address"] ?? '',
      );
}

/* ===================== CLIENT ===================== */

class Client {
  final int id;
  final String userName;
  final String gender;
  final DateTime? birthDate;
  final String phone;
  final String province;
  final String subdistrict;
  final String address;
  final String image;
  final String age;
  final String high;
  final String description;
  final String noAk1;
  final List<Education> education;
  final List<Experience> experience;
  final List<Education> lastEducation;
  final List<Cv> cv;
  final List<Skill> skills;
  final List<Language> language;

  Client({
    required this.id,
    required this.userName,
    required this.gender,
    this.birthDate,
    required this.phone,
    required this.province,
    required this.subdistrict,
    required this.address,
    required this.image,
    required this.age,
    required this.high,
    required this.description,
    required this.noAk1,
    required this.education,
    required this.experience,
    required this.lastEducation,
    required this.cv,
    required this.skills,
    required this.language,
  });

  factory Client.fromJson(Map<String, dynamic> json) => Client(
        id: json["id"] ?? 0,
        userName: json["user_name"] ?? '',
        gender: json["gender"] ?? '',
        birthDate: parseDate(json["birth_date"]),
        phone: json["phone"] ?? '',
        province: json["province"] ?? '',
        subdistrict: json["subdistrict"] ?? '',
        address: json["address"] ?? '',
        image: json["image"] ?? '',
        age: json["age"] ?? '',
        high: json["high"] ?? '',
        description: json["description"] ?? '',
        noAk1: json["noAk1"] ?? '',
        education: (json["education"] as List?)
                ?.map((e) => Education.fromJson(e))
                .toList() ??
            [],
        experience: (json["experience"] as List?)
                ?.map((e) => Experience.fromJson(e))
                .toList() ??
            [],
        lastEducation: (json["last_education"] as List?)
                ?.map((e) => Education.fromJson(e))
                .toList() ??
            [],
        cv: (json["cv"] as List?)
                ?.map((e) => Cv.fromJson(e))
                .toList() ??
            [],
        skills: (json["skills"] as List?)
                ?.map((e) => Skill.fromJson(e))
                .toList() ??
            [],
        language: (json["language"] as List?)
                ?.map((e) => Language.fromJson(e))
                .toList() ??
            [],
      );
}

/* ===================== CV ===================== */

class Cv {
  final int id;
  final String cv;

  Cv({
    required this.id,
    required this.cv,
  });

  factory Cv.fromJson(Map<String, dynamic> json) => Cv(
        id: json["id"] ?? 0,
        cv: json["cv"] ?? '',
      );
}

/* ===================== EDUCATION ===================== */

class Education {
  final int id;
  final String grade;
  final String university;
  final String major;
  final String graduationYear;
  final dynamic ipk;

  Education({
    required this.id,
    required this.grade,
    required this.university,
    required this.major,
    required this.graduationYear,
    this.ipk,
  });

  factory Education.fromJson(Map<String, dynamic> json) => Education(
        id: json["id"] ?? 0,
        grade: json["grade"] ?? '',
        university: json["university"] ?? '',
        major: json["major"] ?? '',
        graduationYear: json["graduation_year"] ?? '',
        ipk: json["ipk"],
      );
}

/* ===================== EXPERIENCE ===================== */

class Experience {
  final int id;
  final String company;
  final String position;
  final String duration;
  final String salary;
  final dynamic description;

  Experience({
    required this.id,
    required this.company,
    required this.position,
    required this.duration,
    required this.salary,
    this.description,
  });

  factory Experience.fromJson(Map<String, dynamic> json) => Experience(
        id: json["id"] ?? 0,
        company: json["company"] ?? '',
        position: json["position"] ?? '',
        duration: json["duration"] ?? '',
        salary: json["salary"] ?? '',
        description: json["description"],
      );
}

/* ===================== SKILL ===================== */

class Skill {
  final int id;
  final String nameTraining;
  final String issueBy;
  final String description;

  Skill({
    required this.id,
    required this.nameTraining,
    required this.issueBy,
    required this.description,
  });

  factory Skill.fromJson(Map<String, dynamic> json) => Skill(
        id: json["id"] ?? 0,
        nameTraining: json["name_training"] ?? '',
        issueBy: json["issue_by"] ?? '',
        description: json["description"] ?? '',
      );
}

/* ===================== LANGUAGE ===================== */

class Language {
  final int id;
  final String language;
  final String level;

  Language({
    required this.id,
    required this.language,
    required this.level,
  });

  factory Language.fromJson(Map<String, dynamic> json) => Language(
        id: json["id"] ?? 0,
        language: json["language"] ?? '',
        level: json["level"] ?? '',
      );
}
