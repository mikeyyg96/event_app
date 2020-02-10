import 'package:event_app/core/viewmodels/contentPages/createEventForm/create_event_model.dart';
import 'package:flutter/material.dart';

import '../../base_view.dart';
import 'package:event_app/ui/views/contentPages/createEventForm/info_view.dart';

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
                text: 'Photos',
              ),
              Tab(
                icon: Icon(Icons.security),
                text: 'Security',
              ),
              Tab(
                icon: Icon(Icons.attach_money),
                text: 'Price',
              ),
            ],
            labelStyle: TextStyle(fontSize: 16.0),
            labelColor: Colors.orange,
            unselectedLabelColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding: EdgeInsets.all(5.0),
            indicatorColor: Colors.orange,
          )),
          body: TabBarView(
            physics: model.isComplete ? null : NeverScrollableScrollPhysics(),
            children: <Widget>[
              InfoView(onFormChange: model.checkFrom),
              Container(
                color: Colors.red,
              ),
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
