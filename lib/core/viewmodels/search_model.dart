import 'package:event_app/core/enums/viewstate.dart';
import 'package:event_app/core/viewmodels/base_model.dart';

class SearchModel extends BaseModel {
  bool _pressed = false;

  bool get pressed => _pressed;

  void transition() {
    setState(ViewState.Busy);

    _pressed = true;
    notifyListeners();

    setState(ViewState.Idle);
  }



}