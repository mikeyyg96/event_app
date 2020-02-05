import 'package:event_app/core/viewmodels/contentPages/preferences_model.dart';
import 'package:event_app/core/viewmodels/widget_models/organization_card_model.dart';
import 'package:event_app/ui/shared/styling.dart';
import 'package:event_app/ui/views/base_view.dart';
import 'package:event_app/ui/views/widget_views/organization_card_view.dart';
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
                      OrganizationCardView(
                          type: 'Member', icon: Icons.person),
                      OrganizationCardView(type: 'Verified', icon: Icons.star),
                      OrganizationCardView(
                          type: 'Sponsored', icon: Icons.local_atm),
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
                  child: Row(
                    children: <Widget>[
                      Text('\$${model.startPrice.toStringAsFixed(0)}',
                          style: stylingActiveCardNum),
                      Expanded(
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
                      Text(
                        model.endPrice == 100
                            ? '\$${model.endPrice.toStringAsFixed(0)} +'
                            : '\$${model.endPrice.toStringAsFixed(0)}',
                        style: stylingActiveCardNum,
                      )
                    ],
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
                  child: Row(
                    children: <Widget>[
                      Text('${model.startMiles.toStringAsFixed(0)}',
                          style: stylingActiveCardNum),
                      Expanded(
                        child: SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                              activeTickMarkColor: Colors.black54,
                              activeTrackColor: Theme.of(context).primaryColor,
                              thumbColor: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.9),
                              inactiveTrackColor: Colors.grey,
                              overlayColor: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.5),
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
                      Text(
                          model.endMiles == 100
                              ? '${model.endMiles.toStringAsFixed(0)} +'
                              : '${model.endMiles.toStringAsFixed(0)}',
                          style: stylingActiveCardNum),
                    ],
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
                  firstDate: DateTime.now().subtract(Duration(days: 2)),
                  lastDate: DateTime.now().add(Duration(days: 365)),
                  selectedPeriod: model.period,
                  onChanged: (DatePeriod period) {
                    model.changeDate(period);
                  },
                  onSelectionError: (UnselectablePeriodException exception) {
                    model.changeDate(DatePeriod(
                        DateTime.now(), DateTime.now().add(Duration(days: 2))));
                    SnackBar(content: null);
                  },
                  selectableDayPredicate: (DateTime date) {
                    if (date
                        .isBefore(DateTime.now().subtract(Duration(days: 2)))) {
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
                Material(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  elevation: model.pressed ? 0 : 12,
                  color: Theme.of(context).accentColor,
                  child: InkWell(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    splashColor: Theme.of(context).primaryColor.withOpacity(0.2),
                    highlightColor: Colors.transparent,
                    onTap: () => model.pressButton(),
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      height: 75,
                      child: model.pressed ? CircularProgressIndicator(backgroundColor: Colors.greenAccent) :  Text('Save Changes', style: stylingActiveCard),
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
