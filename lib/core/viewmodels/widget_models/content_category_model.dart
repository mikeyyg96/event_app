import 'package:event_app/core/enums/viewstate.dart';
import 'package:event_app/core/viewmodels/base_model.dart';
import 'package:event_app/core/viewmodels/loginPages/frame_login_model.dart';
import 'package:event_app/core/viewmodels/widget_models/content_card_model.dart';

class ContentCategoryModel extends BaseModel {
  bool _active = false;
  bool get active => _active;

  FrameLoginModel frameModel = new FrameLoginModel();
  ContentCardModel contentCardModel = new ContentCardModel();

  void activate() {
    setState(ViewState.Busy);

    _active = true;
    frameModel.refreshUI();
    contentCardModel.refreshUI();
    notifyListeners();
    setState(ViewState.Idle);
  }

  void deactivate() {
    setState(ViewState.Busy);

    _active = false;
    notifyListeners();

    setState(ViewState.Idle);
  }
}