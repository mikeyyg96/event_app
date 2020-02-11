import 'package:event_app/core/enums/viewstate.dart';
import 'package:event_app/core/viewmodels/base_model.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class PhotosModel extends BaseModel {
  File _photo;
  bool _containsPhoto = false;

  File get photo => _photo;
  bool get containsPhoto => _containsPhoto;

  Future getPhoto() async {
    setState(ViewState.Busy);

    var photoCall = await ImagePicker.pickImage(source: ImageSource.gallery);

    _photo = photoCall;

    if(_photo != null) {
      _containsPhoto = true;
    } else {
      _containsPhoto = false;
    }

    print('photo model');
    print(_containsPhoto);

    notifyListeners();
    setState(ViewState.Idle);
  }
}
