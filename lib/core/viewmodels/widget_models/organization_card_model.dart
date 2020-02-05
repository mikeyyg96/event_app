import 'package:event_app/core/enums/viewstate.dart';
import 'package:event_app/core/viewmodels/base_model.dart';

class OrganizationCardModel extends BaseModel {

  bool _active = false;

  bool get active => _active;

  void activate() {
    setState(ViewState.Busy);

    _active = true;
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