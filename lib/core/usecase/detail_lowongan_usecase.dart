import 'package:my_clean_code_template/data/repository/detail_lowongan_repository.dart';

class DetailLowonganUsecase {
  final DetailLowonganRepository repo;

  DetailLowonganUsecase({required this.repo});

  Future<dynamic> execute(int id) async {
   return await repo.getDetailLowongan(id);
  }
}
