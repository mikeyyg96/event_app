import 'package:event_app/core/data/placeholders.dart';
import 'package:event_app/core/enums/viewstate.dart';
import 'package:event_app/core/viewmodels/base_model.dart';

class ContentCategoryModel extends BaseModel {
  bool _active = false;
  bool get active => _active;

  void activate(String filter) {
    setState(ViewState.Busy);

    _active = true;
    filters.add(filter);
    notifyListeners();
    setState(ViewState.Idle);
  }

  void deactivate(String filter) {
    setState(ViewState.Busy);

    _active = false;
    filters.remove(filter);
    notifyListeners();

    setState(ViewState.Idle);
  }
}