import 'package:event_app/core/enums/viewstate.dart';
import 'package:event_app/core/viewmodels/base_model.dart';

class CreateEventModel extends BaseModel {

  bool _isComplete = false;
  bool _containsPhoto = false;

  bool get isComplete => _isComplete;
  dynamic get checkForm => _checkForm;
  bool get containsPhoto => _containsPhoto;
  dynamic get checkUpload => _checkUpload;

  _checkForm(bool value) {
    setState(ViewState.Busy);
    
      _isComplete = value;

    notifyListeners();
    setState(ViewState.Idle);    
  }

  _checkUpload(bool value) {
    setState(ViewState.Busy);
    
      _containsPhoto= value;

      print('create model');
      print(_containsPhoto);

    notifyListeners();
    setState(ViewState.Idle);    
  }
  
}
