import 'package:get_it/get_it.dart';
import 'package:my_clean_code_template/data/storage/app_shared.dart';
import 'package:shared_preferences/shared_preferences.dart';


final sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  // ======================
  // External
  // ======================
  final prefs = await SharedPreferences.getInstance();

  // ======================
  // Core
  // ======================
  sl.registerLazySingleton<AppPreferences>(
    () => AppPreferences(prefs),
  );

  // ======================
  // Repository
  // ======================
}
