import 'package:event_app/core/viewmodels/contentPages/event_details_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:event_app/core/classes/event.dart';
import 'package:event_app/ui/shared/styling.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
              height: 300,
              child: Stack(
                children: <Widget>[
                  Image.network(
                    event.image,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 32.0, horizontal: 8.0),
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
                        vertical: 32.0, horizontal: 8.0),
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
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Wrap(
                        children: <Widget>[
                          Container(
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
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Stack(
                children: <Widget>[
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'Event Info',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        stylingListDivider,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text('Date'),
                              Text(DateTime.fromMicrosecondsSinceEpoch(event.date.microsecondsSinceEpoch).toString()),
                            ],
                          ),
                        ),
                        stylingListDivider,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text('Distance'),
                              Text(event.distance),
                            ],
                          ),
                        ),
                        stylingListDivider,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text('Organization'),
                              Text(event.organization),
                            ],
                          ),
                        ),
                        stylingListDivider,
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'Description',
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(event.description),
                        ),
                        Container(
                          height: 400,
                          width: double.infinity,
                          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 128.0),
                          child: GoogleMap(
                            gestureRecognizers:
                                <Factory<OneSequenceGestureRecognizer>>[
                              new Factory<OneSequenceGestureRecognizer>(
                                () => new EagerGestureRecognizer(),
                              ),
                            ].toSet(),
                            scrollGesturesEnabled: true,
                            initialCameraPosition: CameraPosition(
                                target: LatLng(27.2, 77.5), zoom: 14),
                            onMapCreated: (controller) {
                              model.googleMapController.complete(controller);
                            },
                            mapToolbarEnabled: true,
                            mapType: MapType.hybrid,
                            compassEnabled: true,
                            minMaxZoomPreference: MinMaxZoomPreference(12, 15),
                            myLocationButtonEnabled: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    alignment: Alignment.bottomCenter,
                    height: double.infinity,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () => print('hello world'),
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
                                  'Going',
                                  style: stylingInactiveCardNum,
                                ),
                              )),
                        ),
                        GestureDetector(
                          onTap: () => print('hello world'),
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            height: 70,
                            width: 120,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30.0),
                                ),
                                border: Border.all(
                                    color: Theme.of(context).primaryColor)),
                            child: Center(
                              child: Text(
                                'Maybe',
                                style: stylingLocationText,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
