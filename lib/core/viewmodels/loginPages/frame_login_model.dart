import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_app/core/classes/event.dart';
import 'package:event_app/core/classes/user.dart';
import 'package:event_app/core/data/placeholders.dart';
import 'package:event_app/core/enums/viewstate.dart';
import 'package:event_app/core/viewmodels/base_model.dart';
import 'package:event_app/core/viewmodels/widget_models/content_card_model.dart';
import 'package:event_app/ui/shared/styling.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class FrameLoginModel extends BaseModel {
  FirebaseUser _firebaseUser;
  User _user;
  final databaseReference = Firestore.instance;
  String _smsCode = '';
  String _verificationID = '';
  int _forceResend;

  TextEditingController _controller = new TextEditingController();
  MaskTextInputFormatter _maskTextInputFormatter = new MaskTextInputFormatter(
      mask: '+# ###-###-####', filter: {"#": RegExp(r'[0-9]')});
  String _errorText = null;

  String _image = 'assets/background/town_background.jpg';

  FirebaseUser get firebaseUser => _firebaseUser;
  User get user => _user;

  bool _pressed = false;
  bool _isTransitioned = false;

  String get errorText => _errorText;
  TextEditingController get controller => _controller;
  MaskTextInputFormatter get maskTextInputFormatter => _maskTextInputFormatter;

  String get image => _image;

  bool get pressed => _pressed;
  bool get isTransitioned => _isTransitioned;

  Future<void> verifyNumber(BuildContext context) async {
    final PhoneCodeAutoRetrievalTimeout autoRetrievalTimeout =
        (String verificationID) {
      _verificationID = verificationID;
      FirebaseAuth.instance.currentUser().then((userID) {
        if (userID != null) {
          _firebaseUser = userID;
          print('user signed in: $userID');
          animateDown();
        } else {
          smsCodeDialog(context);
        }
      });
    };

    final PhoneVerificationCompleted verificationCompleted =
        (AuthCredential credential) {
      print('Verified: ${credential.providerId}');
      FirebaseAuth.instance.currentUser().then((userID) {
        if (userID != null) {
          _firebaseUser = userID;
          print(userID.phoneNumber);
          animateDown();
        } else {
          smsCodeDialog(context);
        }
      });
    };
    final PhoneCodeSent smsCodeSent = (String verID, [int forceCodeResend]) {
      _forceResend = forceCodeResend;
      _verificationID = verID;
    };

    final PhoneVerificationFailed verificationFailed =
        (AuthException exception) {
      print('${exception.message}');
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+' + _maskTextInputFormatter.getUnmaskedText(),
        codeAutoRetrievalTimeout: autoRetrievalTimeout,
        codeSent: smsCodeSent,
        timeout: const Duration(seconds: 0),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        forceResendingToken: _forceResend);
  }

  Future<bool> smsCodeDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => AlertDialog(
              title: Center(
                  child: Text(
                'Enter SMS Code',
                style: stylingActiveCard,
              )),
              content: TextField(
                style: stylingActiveCard,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(border: InputBorder.none),
                autofocus: true,
                onChanged: (value) {
                  _smsCode = value;
                },
              ),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    FirebaseAuth.instance.currentUser().then(
                      (userID) {
                        if (userID != null) {
                          Navigator.pop(context);
                          animateDown();
                        } else {
                          Navigator.pop(context);
                          signIn();
                        }
                      },
                    );
                  },
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    FirebaseAuth.instance.currentUser().then(
                      (userID) {
                        if (userID != null) {
                          Navigator.pop(context);
                          animateDown();
                        } else {
                          Navigator.pop(context);
                          signIn();
                        }
                      },
                    );
                  },
                  child: Text(
                    'Submit',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ));
  }

  signIn() async {
    final AuthCredential credential = PhoneAuthProvider.getCredential(
      verificationId: _verificationID,
      smsCode: _smsCode,
    );
    await FirebaseAuth.instance.signInWithCredential(credential).then((user) {
      animateDown();
    }).catchError((e) {
      print(e);
      _errorText = 'Incorrect SMS code. Try again.';
      _controller.clear();
    });
  }

  void animateDown() {
    setState(ViewState.Busy);

    _pressed = true;
    notifyListeners();

    setState(ViewState.Idle);
  }

  void animateUp() {
    setState(ViewState.Busy);

    _pressed = false;
    _isTransitioned = false;
    notifyListeners();

    setState(ViewState.Idle);
  }

  void transition() {
    setState(ViewState.Busy);

    _isTransitioned = true;
    notifyListeners();

    setState(ViewState.Idle);
  }

  Future<List<Event>> getEvents(FirebaseUser user) async {
    await getUser(user.uid);

    databaseEvents.clear();
    // Eventually a parameter would be the preferences to filter
    await databaseReference
        .collection("events")
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((f) {
        databaseEvents.add(new Event(
          category: f.data['category'],
          date: f.data['date'],
          description: f.data['description'],
          distance: f.data['distance'],
          image: 'https://picsum.photos/seed/picsum/200/300',
          name: f.data['name'],
          organization: f.data['organization'],
          price: f.data['price'],
        ));
      });
    });
    return databaseEvents;
  }

  Future<User> getUser(String user) async {
    await databaseReference
        .collection('users')
        .document(user)
        .get()
        .then((datasnapshot) async {
      if (datasnapshot.exists) {
        print(datasnapshot.data['email'].toString());
        _user = new User(
          name: datasnapshot.data['name'],
          type: datasnapshot.data['type'],
          participated: datasnapshot.data['participated'],
          hosted: datasnapshot.data['hosted'],
          reserved: datasnapshot.data['reserved'],
          interested: datasnapshot.data['interested'],
          past: datasnapshot.data['past'],
        );
      } else {
        await databaseReference.collection('users').document(user).setData({
          'name': 'Michael Gallego',
          'type': 'Member',
          'participated': '0',
          'hosted': '0',
          'rewardPoints': '0',
          'reserved': [],
          'interested': [],
          'past': []
        });

        await databaseReference
            .collection('users')
            .document(user)
            .get()
            .then((datasnapshot) {
          _user = new User(
            name: datasnapshot.data['name'],
            type: datasnapshot.data['type'],
            participated: datasnapshot.data['participated'],
            hosted: datasnapshot.data['hosted'],
            reserved: datasnapshot.data['reserved'],
            interested: datasnapshot.data['interested'],
            past: datasnapshot.data['past'],
          );
        });
      }
    });
  }

  //* Route transition functions
  Route searchRoute(Object view, Offset offset) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => view,
      transitionDuration: const Duration(milliseconds: 1000),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = offset;
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
