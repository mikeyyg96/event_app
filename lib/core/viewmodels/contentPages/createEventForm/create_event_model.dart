import 'package:event_app/core/enums/viewstate.dart';
import 'package:event_app/core/viewmodels/base_model.dart';

class CreateEventModel extends BaseModel {

  bool _isComplete = false;

  bool get isComplete => _isComplete;
  dynamic get checkFrom => _checkForm;

  _checkForm(bool value) {
    setState(ViewState.Busy);
    
      _isComplete = value;
      print('main page');
      print(_isComplete);

    notifyListeners();
    setState(ViewState.Idle);    
  }
  
}
