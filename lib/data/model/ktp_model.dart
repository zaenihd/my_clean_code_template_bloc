class KtpModel {
  final String nik;
  final String name;
  final String birth;
  final String gender;
  final String address;

  const KtpModel({
    required this.nik,
    required this.name,
    required this.birth,
    required this.gender,
    required this.address,
  });

  factory KtpModel.empty() {
    return const KtpModel(
      nik: '',
      name: '',
      birth: '',
      gender: '',
      address: '',
    );
  }
}
