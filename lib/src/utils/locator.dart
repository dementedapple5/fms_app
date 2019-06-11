import 'package:fms_app/src/providers/login_provider.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt();

void setupLocator() {
  locator.registerLazySingleton(() => LoginProvider());
}