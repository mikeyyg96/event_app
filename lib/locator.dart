import 'package:get_it/get_it.dart';

import 'core/viewmodels/loginPages/middle_login_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerFactory(() => MiddleLoginModel());
}