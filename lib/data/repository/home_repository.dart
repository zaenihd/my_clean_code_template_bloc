import 'package:my_clean_code_template/core/network/dio_client.dart';
import 'package:my_clean_code_template/data/model/lowongan_model.dart';

class HomeRepository {
  final DioClient dioClient;

  HomeRepository(this.dioClient);

  Future<dynamic> getLowongan() async {
    final response = await dioClient.get('/vacancy');
    final lowongan = lowonganModelFromJson(response.toString());
    return lowongan.data.data;
  }
}
