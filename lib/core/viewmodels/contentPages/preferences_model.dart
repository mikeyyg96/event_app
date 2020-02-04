import 'package:event_app/core/enums/viewstate.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart';

import '../base_model.dart';

class PreferencesModel extends BaseModel {
  double _startPrice = 20.0, _endPrice = 60.0;
  double _startMiles = 20.0, _endMiles = 60.0;
  DatePeriod _period = DatePeriod(DateTime.now().subtract(Duration(days: 1)), DateTime.now().add(Duration(days: 1)));

  double get startPrice => _startPrice;
  double get endPrice => _endPrice;
  
  double get startMiles => _startMiles;
  double get endMiles => _endMiles;

  DatePeriod get period => _period;

  void changeValuesPrice(double start, double end) {
    setState(ViewState.Busy);
    _startPrice = start;
    _endPrice = end;
    notifyListeners();

    setState(ViewState.Idle);
  }

  void changeValuesMiles(double start, double end) {
    setState(ViewState.Busy);
    _startMiles = start;
    _endMiles = end;
    notifyListeners();

    setState(ViewState.Idle);
  }

  void changeDate(DatePeriod period) {
    setState(ViewState.Busy);
    _period = period;
    notifyListeners();

    setState(ViewState.Idle);
  }
}