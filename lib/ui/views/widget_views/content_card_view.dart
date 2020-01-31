import 'package:event_app/core/viewmodels/widget_models/content_card_model.dart';
import 'package:event_app/ui/shared/styling.dart';
import 'package:event_app/ui/views/contentPages/event_details_view.dart';
import 'package:flutter/material.dart';

import '../base_view.dart';

class ContentCardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<ContentCardModel>(
      builder: (context, model, child) => Container(
        color: Colors.black38,
        child: Column(
          children: <Widget>[
            Hero(
              tag: 'burger',
              child: Image.asset(
                model.event.image,
                height: 150,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(model.event.name, style: stylingInactiveCard),
            ),
            Text(
              '- ' + model.event.organization + ' -',
              style: stylingInactiveCardNumItalics,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    model.event.distance.toStringAsFixed(2) + ' Mi',
                    style: stylingInactiveCardNum,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    '\$' + model.event.price.toStringAsFixed(2),
                    style: stylingInactiveCardNum,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    model.event.category,
                    style: stylingInactiveCardNum,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                children: <Widget>[
                  Text(
                    model.event.description,
                    style: stylingInactiveCardNum,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  // onTap: () {
                  //   Navigator.push(
                  //       context,
                  //       PageRouteBuilder(
                  //           transitionDuration: Duration(milliseconds: 1000),
                  //           pageBuilder: (_, __, ___) => EventDetailsView(
                  //               tag: 'burger', img: model.event.image)));
                  // },
                  onTap: () => print('Learn More'),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Learn More...',
                      style: stylingInactiveCardNumItalics,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
