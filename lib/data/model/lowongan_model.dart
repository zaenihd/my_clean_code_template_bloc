import 'dart:convert';

LowonganModel lowonganModelFromJson(String str) => LowonganModel.fromJson(json.decode(str));

String lowonganModelToJson(LowonganModel data) => json.encode(data.toJson());

class LowonganModel {
  final int code;
  final bool success;
  final String message;
  final DataLowongan data;

  LowonganModel({
    required this.code,
    required this.success,
    required this.message,
    required this.data,
  });

  factory LowonganModel.fromJson(Map<String, dynamic> json) => LowonganModel(
        code: json["code"] ?? 0,
        success: json["success"] ?? false,
        message: json["message"] ?? "",
        // Jika data null, kirim map kosong agar Data.fromJson mengembalikan default
        data: DataLowongan.fromJson(json["data"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "success": success,
        "message": message,
        "data": data.toJson(),
      };
}

class DataLowongan {
  final int currentPage;
  final List<Lowongan> data;
  final String firstPageUrl;
  final int from;
  final int lastPage;
  final String lastPageUrl;
  final List<Link> links;
  final dynamic nextPageUrl; // Tetap dynamic/nullable karena pagination bisa null
  final String path;
  final int perPage;
  final dynamic prevPageUrl; // Tetap dynamic/nullable
  final int to;
  final int total;

  DataLowongan({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.links,
    required this.nextPageUrl,
    required this.path,
    required this.perPage,
    required this.prevPageUrl,
    required this.to,
    required this.total,
  });

  factory DataLowongan.fromJson(Map<String, dynamic> json) => DataLowongan(
        currentPage: json["current_page"] ?? 0,
        // Handle list null dengan aman
        data: json["data"] == null
            ? []
            : List<Lowongan>.from(json["data"].map((x) => Lowongan.fromJson(x))),
        firstPageUrl: json["first_page_url"] ?? "",
        from: json["from"] ?? 0,
        lastPage: json["last_page"] ?? 0,
        lastPageUrl: json["last_page_url"] ?? "",
        links: json["links"] == null
            ? []
            : List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"] ?? "",
        perPage: json["per_page"] ?? 0,
        prevPageUrl: json["prev_page_url"],
        to: json["to"] ?? 0,
        total: json["total"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": List<dynamic>.from(links.map((x) => x.toJson())),
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };
}

class Lowongan {
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

  Lowongan({
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

  factory Lowongan.fromJson(Map<String, dynamic> json) => Lowongan(
        id: json["id"] ?? 0,
        companyId: json["company_id"] ?? "",
        categoryId: json["category_id"] ?? "",
        jobTitle: json["job_title"] ?? "",
        qty: json["qty"] ?? "0",
        salary: json["salary"] ?? "",
        description: json["description"] ?? "",
        review: json["review"] ?? "",
        closed: json["closed"], // Biarkan dynamic jika tipe datanya tidak pasti
        status: json["status"] ?? "",
        // Gunakan tryParse agar tidak error jika string tanggal kosong/salah
        createdAt: DateTime.tryParse(json["created_at"] ?? "") ?? DateTime.now(),
        updatedAt: DateTime.tryParse(json["updated_at"] ?? "") ?? DateTime.now(),
        closingDate: DateTime.tryParse(json["closing_date"] ?? "") ?? DateTime.now(),
        countApplication: json["count_application"] ?? 0,
        // Jika object company null, kirim map kosong {}
        company: Company.fromJson(json["company"] ?? {}),
        application: json["application"] == null
            ? []
            : List<Application>.from(
                json["application"].map((x) => Application.fromJson(x))),
        category: Category.fromJson(json["category"] ?? {}),
      );

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
        "application": List<dynamic>.from(application.map((x) => x.toJson())),
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

  factory Application.fromJson(Map<String, dynamic> json) => Application(
        id: json["id"] ?? 0,
        clientId: json["client_id"] ?? "",
        companyId: json["company_id"] ?? "",
        vacancyId: json["vacancy_id"] ?? "",
        subject: json["subject"],
        message: json["message"],
        status: json["status"] ?? "",
        createdAt: DateTime.tryParse(json["created_at"] ?? "") ?? DateTime.now(),
        updatedAt: DateTime.tryParse(json["updated_at"] ?? "") ?? DateTime.now(),
      );

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

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        createdAt: DateTime.tryParse(json["created_at"] ?? "") ?? DateTime.now(),
        updatedAt: DateTime.tryParse(json["updated_at"] ?? "") ?? DateTime.now(),
      );

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

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        id: json["id"] ?? 0,
        userId: json["user_id"] ?? "",
        location: json["location"] ?? "",
        employees: json["employees"] ?? "",
        scaleEnterprise: json["scale_enterprise"] ?? "",
        businessField: json["business_field"] ?? "",
        noNpwp: json["no_npwp"] ?? "",
        createdAt: DateTime.tryParse(json["created_at"] ?? "") ?? DateTime.now(),
        updatedAt: DateTime.tryParse(json["updated_at"] ?? "") ?? DateTime.now(),
        image: json["image"] ?? "",
      );

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

class Link {
  final String url;
  final String label;
  final bool active;

  Link({
    required this.url,
    required this.label,
    required this.active,
  });

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        // URL pada pagination seringkali null (misal: tombol 'Previous' di halaman 1)
        // Kita beri string kosong agar tidak crash
        url: json["url"] ?? "", 
        label: json["label"] ?? "",
        active: json["active"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
      };
}