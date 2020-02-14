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
            onTap: (index) {
              model.tabTapped(index);
            },
            tabs: [
              Padding(
                padding: const EdgeInsets.only(top: 6.0),
                child: Tab(
                  child: Column(
                    children: <Widget>[
                      Icon(Icons.info,
                          color: model.selectedIndex == 0
                              ? Theme.of(context).primaryColor
                              : Colors.black38),
                      Text(
                        'Info',
                        style: model.selectedIndex == 0
                            ? TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 14.0)
                            : TextStyle(color: Colors.black38, fontSize: 14.0),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 6.0),
                child: Tab(
                  child: Column(
                    children: <Widget>[
                      Icon(Icons.photo_camera,
                          color: model.selectedIndex == 1
                              ? Theme.of(context).primaryColor
                              : Colors.black38),
                      Text(
                        'Photo',
                        style: model.selectedIndex == 1
                            ? TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 14.0)
                            : TextStyle(color: Colors.black38, fontSize: 14.0),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 6.0),
                child: Tab(
                  child: Column(
                    children: <Widget>[
                      Icon(Icons.attach_money,
                          color: model.selectedIndex == 2
                              ? Theme.of(context).primaryColor
                              : Colors.black38),
                      Text(
                        'Pricing',
                        style: model.selectedIndex == 2
                            ? TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 14.0)
                            : TextStyle(color: Colors.black38, fontSize: 14.0),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 6.0),
                child: Tab(
                  child: Column(
                    children: <Widget>[
                      Icon(Icons.security,
                          color: model.selectedIndex == 3
                              ? Theme.of(context).primaryColor
                              : Colors.black38),
                      Text(
                        'Agreement',
                        style: model.selectedIndex == 3
                            ? TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 14.0)
                            : TextStyle(color: Colors.black38, fontSize: 14.0),
                      ),
                    ],
                  ),
                ),
              ),
            ],
            // indicatorSize: TabBarIndicatorSize.tab,
            // indicatorPadding: EdgeInsets.all(5.0),
            indicatorColor: Theme.of(context).accentColor,
            indicatorWeight: 0.1,
          )),
          body: PageView(
            controller: model.pageController,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index) {
              model.tabScrolled(index);
            },
            physics: (model.isComplete && model.selectedIndex == 0)
                ? null
                : (model.containsPhoto && model.selectedIndex == 1) ? null : NeverScrollableScrollPhysics(),
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
