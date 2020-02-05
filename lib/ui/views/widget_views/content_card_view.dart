import 'package:event_app/core/classes/event.dart';
import 'package:event_app/core/viewmodels/widget_models/content_card_model.dart';
import 'package:event_app/ui/shared/styling.dart';
import 'package:flutter/material.dart';

import '../base_view.dart';

class ContentCardView extends StatelessWidget {
  ContentCardView({this.event, this.onSearch});

  final Event event;
  final bool onSearch;

  @override
  Widget build(BuildContext context) {
    return BaseView<ContentCardModel>(
      builder: (context, model, child) => Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 16.0),
        child: Container(
          decoration: BoxDecoration(
            color: onSearch ? Colors.white : Colors.black38,
            border: Border.all(color: Colors.black38, width: 0.1)
          ),
          child: Column(
            children: <Widget>[
              Container(
                height: 150,
                width: 275,
                child: Stack(
                  children: <Widget>[
                    Image.network(
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
                                  '${event.distance}' + ' Mi',
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
                                  '\$' + '${event.price}',
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
              Text(event.name, style: onSearch ? stylingActiveCard : stylingInactiveCard),
              Text(
                '- ' + event.organization + ' -',
                style: onSearch ? stylingActiveCardNumItalics : stylingInactiveCardNumItalics,
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
                        style: onSearch ? stylingActiveCardNum : stylingInactiveCardNum,
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
                  onTap: () => Navigator.of(context).push(model.eventDetailsRoute(event)),
                  child: Text(
                    'Read More',
                    style: onSearch ? stylingActiveCardNumItalics : stylingInactiveCardNumItalics,
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
