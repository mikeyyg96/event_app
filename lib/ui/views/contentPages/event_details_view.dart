import 'package:event_app/core/viewmodels/contentPages/event_details_model.dart';
import 'package:flutter/material.dart';
import 'package:event_app/core/classes/event.dart';

import '../base_view.dart';

class EventDetailsView extends StatelessWidget {
  // Temporary
  EventDetailsView({@required this.event, this.tag, this.img});

  final String tag;
  final String img;
  final Event event;

  @override
  Widget build(BuildContext context) {
    return BaseView<EventDetailsModel>(
      builder: (context, model, child) => Scaffold(
        body: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 2.5,
                child: Stack(
                  children: <Widget>[
                    Hero(
                      tag: event.category,
                      child: Image.asset(event.image),
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
                          horizontal: 20.0, vertical: 64.0),
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
