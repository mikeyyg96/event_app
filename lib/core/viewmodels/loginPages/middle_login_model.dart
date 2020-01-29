import 'package:event_app/core/enums/viewstate.dart';
import 'package:event_app/core/viewmodels/base_model.dart';

class MiddleLoginModel extends BaseModel { // <-- extends ChangeNotifier

  int _counter = 0;

  int get counter => _counter;

  void increment() {
    setState(ViewState.Busy);

      _counter++;
   
      notifyListeners();

    setState(ViewState.Idle);
  }
}