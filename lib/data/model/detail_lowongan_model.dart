import 'dart:convert';

DetailLowongan detailLowonganFromJson(String str) =>
    DetailLowongan.fromJson(json.decode(str));

String detailLowonganToJson(DetailLowongan data) => json.encode(data.toJson());

class DetailLowongan {
  final int code;
  final bool success;
  final String message;
  final DataDetailLowongan data;

  DetailLowongan({
    required this.code,
    required this.success,
    required this.message,
    required this.data,
  });

  factory DetailLowongan.fromJson(Map<String, dynamic> json) {
    return DetailLowongan(
      code: json["code"] ?? 0,
      success: json["success"] ?? false,
      message: json["message"] ?? '',
      data: DataDetailLowongan.fromJson(json["data"] ?? {}),
    );
  }

  Map<String, dynamic> toJson() => {
    "code": code,
    "success": success,
    "message": message,
    "data": data.toJson(),
  };
}

class DataDetailLowongan {
  final int id;
  final String companyId;
  final String categoryId;
  final String jobTitle;
  final String qty;
  final String salary;
  final String description;
  final String review;
  final dynamic closed;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime closingDate;
  final int countApplication;
  final Company company;
  final List<Application> application;
  final Category category;

  DataDetailLowongan({
    required this.id,
    required this.companyId,
    required this.categoryId,
    required this.jobTitle,
    required this.qty,
    required this.salary,
    required this.description,
    required this.review,
    required this.closed,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.closingDate,
    required this.countApplication,
    required this.company,
    required this.application,
    required this.category,
  });

  factory DataDetailLowongan.fromJson(Map<String, dynamic> json) {
    return DataDetailLowongan(
      id: json["id"] ?? 0,
      companyId: json["company_id"] ?? '',
      categoryId: json["category_id"] ?? '',
      jobTitle: json["job_title"] ?? '',
      qty: json["qty"] ?? '',
      salary: json["salary"] ?? '',
      description: json["description"] ?? '',
      review: json["review"] ?? '',
      closed: json["closed"],
      status: json["status"] ?? '',
      createdAt:
          DateTime.tryParse(json["created_at"] ?? '') ??
          DateTime.fromMillisecondsSinceEpoch(0),
      updatedAt:
          DateTime.tryParse(json["updated_at"] ?? '') ??
          DateTime.fromMillisecondsSinceEpoch(0),
      closingDate:
          DateTime.tryParse(json["closing_date"] ?? '') ??
          DateTime.fromMillisecondsSinceEpoch(0),
      countApplication: json["count_application"] ?? 0,
      company: Company.fromJson(json["company"] ?? {}),
      application:
          (json["application"] as List?)
              ?.map((e) => Application.fromJson(e))
              .toList() ??
          [],
      category: Category.fromJson(json["category"] ?? {}),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "company_id": companyId,
    "category_id": categoryId,
    "job_title": jobTitle,
    "qty": qty,
    "salary": salary,
    "description": description,
    "review": review,
    "closed": closed,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "closing_date":
        "${closingDate.year.toString().padLeft(4, '0')}-${closingDate.month.toString().padLeft(2, '0')}-${closingDate.day.toString().padLeft(2, '0')}",
    "count_application": countApplication,
    "company": company.toJson(),
    "application": application.map((e) => e.toJson()).toList(),
    "category": category.toJson(),
  };
}

class Application {
  final int id;
  final String clientId;
  final String companyId;
  final String vacancyId;
  final dynamic subject;
  final dynamic message;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;

  Application({
    required this.id,
    required this.clientId,
    required this.companyId,
    required this.vacancyId,
    required this.subject,
    required this.message,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Application.fromJson(Map<String, dynamic> json) {
    return Application(
      id: json["id"] ?? 0,
      clientId: json["client_id"] ?? '',
      companyId: json["company_id"] ?? '',
      vacancyId: json["vacancy_id"] ?? '',
      subject: json["subject"],
      message: json["message"],
      status: json["status"] ?? '',
      createdAt:
          DateTime.tryParse(json["created_at"] ?? '') ??
          DateTime.fromMillisecondsSinceEpoch(0),
      updatedAt:
          DateTime.tryParse(json["updated_at"] ?? '') ??
          DateTime.fromMillisecondsSinceEpoch(0),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "client_id": clientId,
    "company_id": companyId,
    "vacancy_id": vacancyId,
    "subject": subject,
    "message": message,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class Category {
  final int id;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;

  Category({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json["id"] ?? 0,
      name: json["name"] ?? '',
      createdAt:
          DateTime.tryParse(json["created_at"] ?? '') ??
          DateTime.fromMillisecondsSinceEpoch(0),
      updatedAt:
          DateTime.tryParse(json["updated_at"] ?? '') ??
          DateTime.fromMillisecondsSinceEpoch(0),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class Company {
  final int id;
  final String userId;
  final String location;
  final String employees;
  final String scaleEnterprise;
  final String businessField;
  final String noNpwp;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String image;

  Company({
    required this.id,
    required this.userId,
    required this.location,
    required this.employees,
    required this.scaleEnterprise,
    required this.businessField,
    required this.noNpwp,
    required this.createdAt,
    required this.updatedAt,
    required this.image,
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      id: json["id"] ?? 0,
      userId: json["user_id"] ?? '',
      location: json["location"] ?? '',
      employees: json["employees"] ?? '',
      scaleEnterprise: json["scale_enterprise"] ?? '',
      businessField: json["business_field"] ?? '',
      noNpwp: json["no_npwp"] ?? '',
      createdAt:
          DateTime.tryParse(json["created_at"] ?? '') ??
          DateTime.fromMillisecondsSinceEpoch(0),
      updatedAt:
          DateTime.tryParse(json["updated_at"] ?? '') ??
          DateTime.fromMillisecondsSinceEpoch(0),
      image: json["image"] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "location": location,
    "employees": employees,
    "scale_enterprise": scaleEnterprise,
    "business_field": businessField,
    "no_npwp": noNpwp,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "image": image,
  };
}
