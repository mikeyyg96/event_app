import 'package:event_app/core/viewmodels/contentPages/createEventForm/create_event_model.dart';
import 'package:event_app/ui/shared/styling.dart';
import 'package:flutter/material.dart';

import '../../base_view.dart';
import 'package:event_app/ui/views/contentPages/createEventForm/info_view.dart';
import 'package:event_app/ui/views/contentPages/createEventForm/photos_view.dart';


class CreateEventView extends StatelessWidget {

  static bool value = false;
  
  @override
  Widget build(BuildContext context) {
    return BaseView<CreateEventModel>(
      builder: (context, model, child) => DefaultTabController(
        length: 4,
        initialIndex: 0,
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Theme.of(context).accentColor,
          appBar: (TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.info),
                text: 'Info',
                
              ),
              Tab(
                icon: Icon(Icons.photo_camera),
                text: 'Photo',
              ),
              Tab(
                icon: Icon(Icons.attach_money),
                text: 'Pricing',
              ),
              Tab(
                icon: Icon(Icons.security),
                text: 'Agreement',
              ),
            ],
            labelStyle: TextStyle(fontSize: 14.0),
            labelColor: Theme.of(context).primaryColor,
            unselectedLabelColor: Colors.black38,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding: EdgeInsets.all(5.0),
            indicatorColor: Theme.of(context).primaryColor,
          )),
          body: TabBarView(
            physics: model.containsPhoto ? null : NeverScrollableScrollPhysics(),
            children: <Widget>[
              InfoView(onFormChange: model.checkForm),
              PhotosView(onUpload: model.checkUpload),
              Container(
                color: Colors.blue,
              ),
              Container(
                color: Colors.orange,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
