import 'package:my_clean_code_template/data/model/ktp_model.dart';


class KtpParser {
  static KtpModel parse(String text) {
    final lines = text.split('\n');

    String nik = '';
    String name = '';
    String birth = '';
    String gender = '';
    String address = '';

    for (final line in lines) {
      final lower = line.toLowerCase();

      if (lower.contains('nik')) {
        nik = _extractNik(line);
      } else if (lower.startsWith('nama')) {
        name = _extractValue(line);
      } else if (lower.contains('lahir')) {
        birth = _extractValue(line);
      } else if (lower.contains('jenis kelamin')) {
        gender = _extractValue(line);
      } else if (lower.startsWith('alamat')) {
        address = _extractValue(line);
      }
    }

    return KtpModel(
      nik: nik,
      name: name,
      birth: birth,
      gender: gender,
      address: address,
    );
  }

  static String _extractValue(String line) {
    return line.contains(':')
        ? line.split(':').last.trim()
        : line.trim();
  }

  static String _extractNik(String line) {
    final regex = RegExp(r'\d{16}');
    return regex.firstMatch(line)?.group(0) ?? '';
  }
}
