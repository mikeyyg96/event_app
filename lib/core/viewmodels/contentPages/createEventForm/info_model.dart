import 'package:event_app/core/enums/viewstate.dart';
import 'package:event_app/core/config/config.dart';
import 'package:event_app/core/viewmodels/base_model.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:intl/intl.dart';

class InfoModel extends BaseModel {
  GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: googleAPIKey);
  Prediction p;
  DateTime _dateTime;
  DateFormat _dateFormat = DateFormat("yMMMd");
  String _selectedDate;
  String _selectedTime;

  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  TextEditingController _locationController = TextEditingController();

  String _name = '';
  String _category = '';
  String _location = '';
  String _date = '';
  String _time = '';
  String _organization = '';
  String _description = '';
  bool _isComplete = false;

  DateTime get dateTime => _dateTime;
  String get selectedDate => _selectedDate;
  String get selectedTime => _selectedTime;

  TextEditingController get dateController => _dateController;
  TextEditingController get timeController => _timeController;
  TextEditingController get locationController => _locationController;

  String get name => _name;
  String get category => _category;
  String get location => _location;
  String get date => _date;
  String get time => _time;
  String get organization => _organization;
  String get description => _description;
  bool get isComplete => _isComplete;

  void checkForm() {
    setState(ViewState.Busy);

    print(_name);
    print(_category);
    print(_location);
    print(_date);
    print(_time);
    print(_organization);
    print(_description);
    if(_name != '' && _category != '' && _location != '' && _date != '' && _time != '' && _organization != '' && _description != ''){
      _isComplete = true;
    } else {
      _isComplete = false;
    }

    notifyListeners();
    setState(ViewState.Idle);
  }

  void setFormValues(key, value) {
    setState(ViewState.Busy);

    switch (key) {
      case 'name':
        {
          _name = value;
        }
        break;

      case 'category':
        {
          _category = value;
        }
        break;

      case 'location':
        {
          _location = value;
        }
        break;

      case 'date':
        {
          _date = value;
        }
        break;

      case 'time':
        {
          _time = value;
        }
        break;

      case 'organization':
        {
          _organization = value;
        }
        break;

      case 'description':
        {
          _description = value;
        }
        break;

      default:
        {
          break;
        }
        break;
    }

    checkForm();
    notifyListeners();
    setState(ViewState.Idle);
  }

  Future<Null> handleDate(context, currentValue) async {
    setState(ViewState.Busy);

    final date = await showDatePicker(
        context: context,
        firstDate: DateTime(1900),
        initialDate: currentValue ?? DateTime.now(),
        lastDate: DateTime(2100));

    if (date != null) {
      final time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
      );

      _selectedDate = _dateFormat.format(date);
      _selectedTime = time.format(context).toString();

      _dateController.text = _selectedDate;
      setFormValues('date', _selectedDate);

      _timeController.text = _selectedTime;
      setFormValues('time', _selectedTime);
    } else {
      notifyListeners();
      setState(ViewState.Idle);

      return currentValue;
    }

    notifyListeners();

    setState(ViewState.Idle);
  }

  void onError(PlacesAutocompleteResponse response) {
    print(response.errorMessage);
  }

  Future<void> handleAddress(context) async {
    setState(ViewState.Busy);

    // show input autocomplete with selected mode
    // then get the Prediction selected]
    p = await PlacesAutocomplete.show(
        context: context, apiKey: googleAPIKey, onError: onError);
    displayPrediction(p);

    notifyListeners();
    setState(ViewState.Idle);
  }

  Future<Null> displayPrediction(Prediction p) async {
    setState(ViewState.Busy);

    var address;
    print(p);
    if (p != null) {
      PlacesDetailsResponse detail =
          await _places.getDetailsByPlaceId(p.placeId);

      var placeId = p.placeId;
      double lat = detail.result.geometry.location.lat;
      double lng = detail.result.geometry.location.lng;

      address = await Geocoder.local.findAddressesFromQuery(p.description);

      print(lat);
      print(lng);
      print(address);
    }

    notifyListeners();
    setState(ViewState.Idle);
  }
}
