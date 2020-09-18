import 'package:gogame/services/api_service.dart';
import 'package:gogame/services/dialog_service.dart';
import 'package:gogame/services/localization_service.dart';
import 'package:gogame/services/navigation_service.dart';
import 'package:gogame/services/repository_service.dart';
import 'package:get_it/get_it.dart';

export 'package:gogame/services/api_service.dart';
export 'package:gogame/services/dialog_service.dart';
export 'package:gogame/services/localization_service.dart';
export 'package:gogame/services/navigation_service.dart';
export 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => LocalizationService());
  locator.registerLazySingleton(() => ApiService());
  locator.registerLazySingleton(() => RepositoryService());
}
