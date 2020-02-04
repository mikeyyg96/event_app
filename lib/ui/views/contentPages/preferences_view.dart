import 'package:event_app/core/viewmodels/contentPages/preferences_model.dart';
import 'package:event_app/ui/shared/styling.dart';
import 'package:event_app/ui/views/base_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart';
import 'package:flutter_range_slider/flutter_range_slider.dart' as frs;

class PreferencesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<PreferencesModel>(
      builder: (context, model, child) => Material(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            padding: const EdgeInsets.all(32.0),
            color: Theme.of(context).accentColor,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Change Preferences',
                    style: stylingHeader,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Organization Type',
                    style: stylingInputText,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                          elevation: 12,
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                color: Theme.of(context).primaryColor),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.person,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    'Non-Trusted',
                                    style: stylingInactiveCardNum,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                          elevation: 12,
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                color: Colors.white),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.star,
                                    color: Colors.black54,
                                  ),
                                  Text(
                                    'Verified',
                                    style: stylingActiveCardNum,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                          elevation: 12,
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                color: Colors.white),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.local_atm,
                                    color: Colors.black54,
                                  ),
                                  Text(
                                    'Sponsored',
                                    style: stylingActiveCardNum,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Price Range (USD)',
                    style: stylingInputText,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTickMarkColor: Colors.black54,
                      activeTrackColor: Theme.of(context).primaryColor,
                      thumbColor:
                          Theme.of(context).primaryColor.withOpacity(0.9),
                      inactiveTrackColor: Colors.grey,
                      overlayColor:
                          Theme.of(context).primaryColor.withOpacity(0.5),
                      valueIndicatorColor: Colors.black54,
                    ),
                    child: frs.RangeSlider(
                      lowerValue: model.startPrice,
                      upperValue: model.endPrice,
                      divisions: 5,
                      min: 0,
                      max: 100,
                      onChanged: (double start, double end) {
                        model.changeValuesPrice(start, end);
                      },
                      showValueIndicator: true,
                      valueIndicatorFormatter: (int index, double value) {
                        String noDecimals = value.toStringAsFixed(0);
                        if (value == 100) {
                          return '\$$noDecimals +';
                        } else {
                          return '\$$noDecimals';
                        }
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Distance (Mi)',
                    style: stylingInputText,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        activeTickMarkColor: Colors.black54,
                        activeTrackColor: Theme.of(context).primaryColor,
                        thumbColor:
                            Theme.of(context).primaryColor.withOpacity(0.9),
                        inactiveTrackColor: Colors.grey,
                        overlayColor:
                            Theme.of(context).primaryColor.withOpacity(0.5),
                        valueIndicatorColor: Colors.black54),
                    child: frs.RangeSlider(
                      lowerValue: model.startMiles,
                      upperValue: model.endMiles,
                      divisions: 5,
                      min: 0,
                      max: 100,
                      onChanged: (double start, double end) {
                        model.changeValuesMiles(start, end);
                      },
                      showValueIndicator: true,
                      valueIndicatorFormatter: (int index, double value) {
                        String noDecimals = value.toStringAsFixed(0);
                        if (value == 100) {
                          return '$noDecimals + Miles';
                        } else {
                          return '$noDecimals Miles';
                        }
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Date Range',
                    style: stylingInputText,
                  ),
                ),
                RangePicker(
                  firstDate: model.period.start,
                  lastDate: DateTime.now().add(Duration(days: 365)),
                  selectedPeriod: model.period,
                  onChanged: (DatePeriod period) {
                    model.changeDate(period);
                  },
                  selectableDayPredicate: (DateTime date) {
                    if (date.isBefore(model.period.start)) {
                      return false;
                    } else {
                      return true;
                    }
                  },
                  datePickerStyles: DatePickerRangeStyles(
                    selectedPeriodStartDecoration: BoxDecoration(
                        color: Colors.greenAccent,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            bottomLeft: Radius.circular(30.0))),
                    selectedPeriodMiddleDecoration: BoxDecoration(
                      color: Colors.black38,
                      shape: BoxShape.rectangle,
                    ),
                    selectedPeriodLastDecoration: BoxDecoration(
                        color: Colors.redAccent,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30.0),
                            bottomRight: Radius.circular(30.0))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5.0,
                        ),
                      ]),
                      child: Center(
                        child: Text('Save Changes', style: stylingHeaderWhite),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
