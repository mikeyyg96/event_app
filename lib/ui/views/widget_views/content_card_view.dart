import 'package:event_app/core/classes/event.dart';
import 'package:event_app/core/viewmodels/widget_models/content_card_model.dart';
import 'package:event_app/ui/shared/styling.dart';
import 'package:flutter/material.dart';

import '../base_view.dart';

class ContentCardView extends StatelessWidget {
  ContentCardView({this.event});

  final Event event;

  @override
  Widget build(BuildContext context) {
    return BaseView<ContentCardModel>(
      builder: (context, model, child) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          color: Colors.black38,
          child: Column(
            children: <Widget>[
              Container(
                height: 150,
                width: 275,
                child: Stack(
                  children: <Widget>[
                    Image.asset(
                      event.image,
                      fit: BoxFit.fill,
                      width: double.infinity,
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Wrap(
                            children: <Widget>[
                              Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 2.0, horizontal: 8.0),
                                decoration: BoxDecoration(
                                  color: Colors.black38,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30.0)),
                                ),
                                child: Text(
                                  event.distance.toStringAsFixed(2) + ' Mi',
                                  style: stylingInactiveCardNum,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          Wrap(
                            children: <Widget>[
                              Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 4.0, horizontal: 8.0),
                                decoration: BoxDecoration(
                                  color: Colors.black38,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30.0)),
                                ),
                                child: Text(
                                  '\$' + event.price.toStringAsFixed(2),
                                  style: stylingInactiveCardNum,
                                ),
                              ),
                            ],
                          ),
                          Wrap(
                            children: <Widget>[
                              Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 4.0, horizontal: 8.0),
                                decoration: BoxDecoration(
                                  color: Colors.black38,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30.0)),
                                ),
                                child: Text(
                                  event.category,
                                  style: stylingInactiveCardNum,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Text(event.name, style: stylingInactiveCard),
              Text(
                '- ' + event.organization + ' -',
                style: stylingInactiveCardNumItalics,
              ),
              Expanded(
                child: Container(
                  width: 275,
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.topCenter,
                  child: Wrap(
                    children: <Widget>[
                      Text(
                        event.description,
                        style: stylingInactiveCardNum,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.all(8.0),
                width: 275,
                child: GestureDetector(
                  onTap: () => print('Read More'),
                  child: Text(
                    'Read More',
                    style: stylingInactiveCardNumItalics,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
