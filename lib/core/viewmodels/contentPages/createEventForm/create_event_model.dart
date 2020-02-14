import 'package:event_app/core/enums/viewstate.dart';
import 'package:event_app/core/viewmodels/base_model.dart';
import 'package:flutter/material.dart';

class CreateEventModel extends BaseModel {

  bool _isComplete = false;
  bool _containsPhoto = false;
  int _selectedIndex = 0;
  PageController _pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  bool get isComplete => _isComplete;
  dynamic get checkForm => _checkForm;
  bool get containsPhoto => _containsPhoto;
  dynamic get checkUpload => _checkUpload;
  int get selectedIndex => _selectedIndex;
  PageController get pageController => _pageController;

  void pageChanged(int index) {
    setState(ViewState.Busy);

    _selectedIndex = index;

    notifyListeners();
    setState(ViewState.Idle);
  }

  void tabTapped(int index) {
    setState(ViewState.Busy);
    print('tap');
    print(index);
    _selectedIndex = index;
    _pageController.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.ease);

    notifyListeners();
    setState(ViewState.Idle);
  }

  void tabScrolled(int index) {
    setState(ViewState.Busy);
    print('scrolled');
    print(index);
    _selectedIndex = index;
    // _pageController.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.ease);

    // tabTapped(index);
    notifyListeners();
    setState(ViewState.Idle);
  }

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
