import 'package:event_app/core/viewmodels/contentPages/event_details_model.dart';
import 'package:flutter/material.dart';

import '../base_view.dart';

class EventDetailsView extends StatelessWidget {

  // Temporary
  EventDetailsView({this.tag, this.img});

  final String tag;
  final String img;

  @override
  Widget build(BuildContext context) {
    return BaseView<EventDetailsModel> (
      builder: (context, model, child) => Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 200,
              child: Hero(
                tag: tag,
                child: Image.asset(img),
              ),
            ),
            Expanded(
              child: Container(color: Colors.white,),
            )
          ],
        ),
      ),
    );
  }
}