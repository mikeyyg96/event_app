import 'package:event_app/core/viewmodels/contentPages/event_details_model.dart';
import 'package:event_app/core/viewmodels/contentPages/profile/profile_model.dart';
import 'package:event_app/core/viewmodels/widget_models/organization_card_model.dart';
import 'package:get_it/get_it.dart';

import 'core/viewmodels/contentPages/preferences_model.dart';
import 'core/viewmodels/loginPages/frame_login_model.dart';
import 'core/viewmodels/widget_models/content_card_model.dart';
import  'core/viewmodels/search_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerFactory(() => FrameLoginModel());

  locator.registerFactory(() => SearchModel());
  locator.registerFactory(() => ContentCardModel());
  locator.registerFactory(() => EventDetailsModel());
  locator.registerFactory(() => PreferencesModel());
  locator.registerFactory(() => OrganizationCardModel());
  locator.registerFactory(() => ProfileModel());
}