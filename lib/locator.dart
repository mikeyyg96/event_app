import 'package:get_it/get_it.dart';

import 'core/viewmodels/loginPages/frame_login_model.dart';
import  'core/viewmodels/search_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerFactory(() => FrameLoginModel());
  locator.registerFactory(() => SearchModel());
}