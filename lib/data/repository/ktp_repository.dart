import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:my_clean_code_template/core/utils/ktp_parser.dart';
import 'package:my_clean_code_template/data/model/ktp_model.dart';


class KtpRepository {
  final ImagePicker _picker;

  KtpRepository(this._picker);

  Future<KtpModel> scanKtp() async {
    final image = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 85,
    );

    if (image == null) {
      return KtpModel.empty();
    }

    final inputImage = InputImage.fromFile(File(image.path));
    final recognizer =
        TextRecognizer(script: TextRecognitionScript.latin);

    final result = await recognizer.processImage(inputImage);
    recognizer.close();

    return KtpParser.parse(result.text);
  }
}
