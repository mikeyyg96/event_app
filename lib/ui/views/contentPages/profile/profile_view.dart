import 'package:event_app/core/classes/user.dart';
import 'package:event_app/core/data/placeholders.dart';
import 'package:event_app/core/viewmodels/contentPages/profile/profile_model.dart';
import 'package:event_app/ui/views/contentPages/createEventForm/create_event_view.dart';
import 'package:event_app/ui/shared/styling.dart';
import 'package:event_app/ui/views/loginPages/frame_login_view.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:event_app/core/classes/earnings.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import '../../base_view.dart';

class ProfileView extends StatelessWidget {
  ProfileView({this.user, this.updateUser});

  final User user;
  final Future<User> Function(User user) updateUser;

  @override
  Widget build(BuildContext context) {
    return BaseView<ProfileModel>(
      builder: (context, model, child) => Scaffold(
        backgroundColor: Theme.of(context).accentColor,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor.withOpacity(0.5),
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          title: Text(
            'Profile',
            style: stylingInactiveCard,
          ),
          actions: <Widget>[
            Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: IconButton(
                  onPressed: () async {
                    await model.signOut();
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => FrameLoginView()),
                        (Route<dynamic> route) => false);
                  },
                  icon: Icon(Icons.settings),
                )),
          ],
        ),
        body: _page(model.currentIndex, context, model),
        floatingActionButton: FloatingActionButton(
          onPressed: () => model.switchPage(2),
          tooltip: 'Create Event',
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        bottomNavigationBar: BottomAppBar(
            shape: CircularNotchedRectangle(),
            color: Theme.of(context).accentColor,
            notchMargin: 8.0,
            child: Container(
              height: 60,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 32.0),
                    child: Center(
                      child: MaterialButton(
                        onPressed: () {
                          model.switchPage(0);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.attach_money,
                                color: model.currentIndex == 0
                                    ? Theme.of(context).primaryColor
                                    : Colors.grey),
                            Text('Earnings')
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 32.0),
                    child: Center(
                      child: MaterialButton(
                        onPressed: () {
                          model.switchPage(1);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.account_circle,
                                color: model.currentIndex == 1
                                    ? Theme.of(context).primaryColor
                                    : Colors.grey),
                            Text('Account')
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  Widget _page(int index, context, model) {
    switch (index) {
      case 0:
        return Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: GestureDetector(
                  onTap: () => print('cash out'),
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5.0,
                        ),
                      ],
                    ),
                    child: Shimmer.fromColors(
                      baseColor: Theme.of(context).primaryColor,
                      highlightColor: Theme.of(context).accentColor,
                      child: Center(
                        child: Text(
                          'Cash Available: \$523.27',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                    height: double.infinity,
                    padding: const EdgeInsets.all(16.0),
                    child: EarningChart(
                      data: model.data,
                    )),
              ),
            ],
          ),
        );
        break;
      case 1:
        final List<ExpansionTile> _listofExpansions = [
          ExpansionTile(
            initiallyExpanded: true,
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RotatedBox(
                  quarterTurns: 1,
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 12,
                  ),
                ),
              ],
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RotatedBox(
                  quarterTurns: 1,
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 12,
                  ),
                ),
              ],
            ),
            title: Row(
              children: <Widget>[
                Expanded(
                  child: Divider(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Reserved Events',
                    style: stylingActiveCardNum,
                  ),
                ),
                Expanded(
                  child: Divider(),
                ),
              ],
            ),
            children: databaseEvents
                .map(
                  (data) => ListTile(
                    onTap: () => Navigator.of(context)
                        .push(model.eventDetailsRoute(data)),
                    leading: Icon(
                      Icons.event,
                      color: Colors.green,
                    ),
                    title: Text(data.name),
                    subtitle: Text(DateTime.fromMicrosecondsSinceEpoch(
                            data.date.microsecondsSinceEpoch)
                        .toString()),
                  ),
                )
                .toList(),
          ),
          ExpansionTile(
            initiallyExpanded: true,
            leading: RotatedBox(
                quarterTurns: 1,
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                )),
            trailing: RotatedBox(
                quarterTurns: 1,
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                )),
            title: Row(
              children: <Widget>[
                Expanded(
                  child: Divider(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Interested Events',
                    style: stylingActiveCardNum,
                  ),
                ),
                Expanded(
                  child: Divider(),
                ),
              ],
            ),
            children: databaseEvents
                .map(
                  (data) => ListTile(
                    onTap: () => Navigator.of(context)
                        .push(model.eventDetailsRoute(data)),
                    leading: Icon(Icons.event, color: Colors.orange),
                    title: Text(data.name),
                    subtitle: Text(DateTime.fromMicrosecondsSinceEpoch(
                            data.date.microsecondsSinceEpoch)
                        .toString()),
                  ),
                )
                .toList(),
          ),
          ExpansionTile(
            initiallyExpanded: true,
            leading: RotatedBox(
                quarterTurns: 1,
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                )),
            trailing: RotatedBox(
                quarterTurns: 1,
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                )),
            title: Row(
              children: <Widget>[
                Expanded(
                  child: Divider(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Past Events',
                    style: stylingActiveCardNum,
                  ),
                ),
                Expanded(
                  child: Divider(),
                ),
              ],
            ),
            children: databaseEvents
                .map(
                  (data) => ListTile(
                    onTap: () => Navigator.of(context)
                        .push(model.eventDetailsRoute(data)),
                    leading: Icon(Icons.event, color: Colors.red),
                    title: Text(data.name),
                    subtitle: Text(DateTime.fromMicrosecondsSinceEpoch(
                            data.date.microsecondsSinceEpoch)
                        .toString()),
                  ),
                )
                .toList(),
          ),
        ];
        return SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          child: Center(
                            child: CircleAvatar(
                              backgroundColor: Colors.black54,
                              backgroundImage:
                                  AssetImage('assets/people/person_1.jpg'),
                              radius: 100,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 100,
                            child: !model.editable
                                ? Text(
                                    user.name == '' ? '[Name Here]' : user.name,
                                    style: stylingActiveCard)
                                : TextField(
                                    decoration: InputDecoration(
                                        border: InputBorder.none),
                                    controller: model.controller,
                                    onChanged: (value) {
                                      model.controller.selection =
                                          TextSelection.collapsed(
                                              offset:
                                                  model.controller.text.length);
                                    },
                                    onEditingComplete: () {
                                      user.name = model.controller.text;
                                      updateUser(user);
                                      model.viewMode();
                                    },
                                    style: stylingHeader,
                                  ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: IconButton(
                              onPressed: () => model.editMode(),
                              icon: Icon(Icons.edit),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '- Member -',
                        style: stylingActiveCard,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        FloatingActionButton(
                            heroTag: 'participated',
                            onPressed: () => print('hello world'),
                            backgroundColor: Colors.purple,
                            child: Icon(
                              Icons.playlist_add_check,
                              color: Colors.white,
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '20',
                          style: stylingActiveCard,
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'Events\nParticipated',
                          style: stylingActiveCardNum,
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        FloatingActionButton(
                            heroTag: 'hosted',
                            onPressed: () => print('hello world'),
                            backgroundColor: Colors.red,
                            child: Icon(
                              Icons.recent_actors,
                              color: Colors.white,
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Text('7',
                            style: stylingActiveCard,
                            textAlign: TextAlign.center),
                        Text(
                          'Events\nHosted',
                          style: stylingActiveCardNum,
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        FloatingActionButton(
                          heroTag: 'rewards',
                          onPressed: () => print('hello world'),
                          backgroundColor: Colors.orange,
                          child:
                              Icon(Icons.local_activity, color: Colors.white),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '1527',
                          style: stylingActiveCard,
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'Reward\nPoints',
                          style: stylingActiveCardNum,
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                _listofExpansions[0],
                _listofExpansions[1],
                _listofExpansions[2],
              ],
            ),
          ),
        );
        break;
      case 2:
        return CreateEventView();
        break;
      default:
        return Container(
          color: Theme.of(context).accentColor,
        );
        break;
    }
  }
}

class EarningChart extends StatelessWidget {
  final List<Earnings> data;

  EarningChart({this.data});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<Earnings, String>> series = [
      charts.Series(
          id: 'Earnings',
          data: data,
          domainFn: (Earnings earnings, _) => earnings.month,
          measureFn: (Earnings earnings, _) => earnings.earnings,
          colorFn: (Earnings earnings, _) => earnings.barColor)
    ];

    return charts.BarChart(
      series,
      animate: true,
    );
  }
}
