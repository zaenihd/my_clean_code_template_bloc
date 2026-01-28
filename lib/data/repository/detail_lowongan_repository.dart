import 'package:my_clean_code_template/core/network/dio_client.dart';
import 'package:my_clean_code_template/data/model/detail_lowongan_model.dart';

class DetailLowonganRepository {
  final DioClient dioClient;
  DetailLowonganRepository({required this.dioClient});

  Future<dynamic> getDetailLowongan(int id) async {
    final response = await dioClient.get('/vacancy/detail/$id');
    final data = detailLowonganFromJson(response.toString());
    return data.data;
  }

}


