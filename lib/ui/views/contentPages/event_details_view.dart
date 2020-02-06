import 'package:event_app/core/viewmodels/contentPages/event_details_model.dart';
import 'package:flutter/material.dart';
import 'package:event_app/core/classes/event.dart';
import 'package:event_app/ui/shared/styling.dart';

import '../base_view.dart';

class EventDetailsView extends StatelessWidget {
  //* Require the event data
  EventDetailsView({@required this.event});

  final Event event;

  @override
  Widget build(BuildContext context) {
    return BaseView<EventDetailsModel>(
      builder: (context, model, child) => Scaffold(
        body: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height / 3,
              child: Stack(
                children: <Widget>[
                  Image.network(
                    event.image,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fill,
                    ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 24.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        iconSize: 32.0,
                        icon: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.arrow_back,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 24.0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        onPressed: () => print('Favorite Event'),
                        iconSize: 32.0,
                        icon: CircleAvatar(
                          backgroundColor: Theme.of(context).primaryColor,
                          child: Icon(
                            Icons.favorite,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 24.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white70,

                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '\$${event.price.toString()}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            event.name,
                            style: stylingHeader,
                          ),
                        ],
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(vertical: 16.0),
                    //   child: Row(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //     children: <Widget>[
                    //       Text('10'),
                    //       Container(
                    //         width: 1,
                    //         height: MediaQuery.of(context).size.height / 48,
                    //         color: Colors.grey,
                    //         child: VerticalDivider(),
                    //       ),
                    //       Text('10'),
                    //       Text('10'),
                    //     ],
                    //   ),
                    // ),
                    stylingGreyDivider,
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(
                    //       horizontal: 24.0, vertical: 16.0),
                    //   child: Row(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     mainAxisAlignment: MainAxisAlignment.start,
                    //     children: <Widget>[
                    //       Text(
                    //         'Event Info',
                    //         style: TextStyle(
                    //             fontSize: 20.0,
                    //             fontWeight: FontWeight.bold,
                    //             color: Colors.black),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    Expanded(
                      child: Container(
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 24.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Text(
                                      'Event Info',
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ),
                                  stylingListDivider,
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text('Name'),
                                        Text(event.name),
                                      ],
                                    ),
                                  ),
                                  stylingListDivider,
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text('Price'),
                                        Text(event.price.toString()),
                                      ],
                                    ),
                                  ),
                                  stylingListDivider,
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text('Category'),
                                        Text(event.category),
                                      ],
                                    ),
                                  ),
                                  stylingListDivider,
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text('Date'),
                                        Text(event.date.toString()),
                                      ],
                                    ),
                                  ),
                                  stylingListDivider,
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text('Distance'),
                                        Text(event.distance.toString()),
                                      ],
                                    ),
                                  ),
                                  stylingListDivider,
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text('organization'),
                                        Text(event.organization),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Text(
                                      'Description',
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Text(event.description),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            height: MediaQuery.of(context).size.height / 16,
                            width: MediaQuery.of(context).size.width / 3,
                            child: RaisedButton(
                              onPressed: () => print('Going'),
                              color: Theme.of(context).primaryColor,
                              textColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(
                                    color: Theme.of(context).primaryColor),
                              ),
                              child: Text('Going', style: stylingLargeButton),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height / 16,
                            width: MediaQuery.of(context).size.width / 3,
                            child: RaisedButton(
                              onPressed: () => print('Maybe'),
                              color: Colors.white,
                              textColor: Theme.of(context).primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(
                                    color: Theme.of(context).primaryColor),
                              ),
                              child: Text(
                                'Maybe',
                                style: stylingLargeButton,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
