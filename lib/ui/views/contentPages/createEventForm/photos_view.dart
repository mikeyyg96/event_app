import 'package:event_app/core/viewmodels/contentPages/createEventForm/photos_model.dart';
import 'package:event_app/ui/shared/styling.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../base_view.dart';

class PhotosView extends StatelessWidget {

  final void Function(bool value) onUpload;

  PhotosView({Key key, @required this.onUpload}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<PhotosModel>(
      builder: (context, model, child) => Container(
        color: Theme.of(context).accentColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Opacity(
              opacity: model.photo == null ? 0.5 : 1.0,
              child: model.photo == null
                  ? Icon(
                      Icons.add_a_photo,
                      size: 200.0,
                      color: Theme.of(context).primaryColor,
                    )
                  : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 4,
                      child: Image.file(
                          model.photo,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                    ),
                  ),
            ),
            MaterialButton(
              onPressed: () => {model.getPhoto(), onUpload(model.containsPhoto)},
              child: Container(
                  padding: const EdgeInsets.all(8.0),
                  height: 70,
                  width: 120,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30.0),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      model.photo != null ? 'Change Photo' : 'Upload Photo',
                      style: stylingBoldButton,
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
