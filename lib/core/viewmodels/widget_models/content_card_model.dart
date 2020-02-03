import 'package:event_app/core/enums/viewstate.dart';
import 'package:event_app/core/viewmodels/base_model.dart';

class ContentCardModel extends BaseModel {
  
  void refreshUI() {
    setState(ViewState.Busy);

    notifyListeners();

    setState(ViewState.Idle);
  }
}
