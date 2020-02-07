import 'package:event_app/core/classes/category.dart';
import 'package:event_app/core/classes/event.dart';
import 'package:event_app/core/viewmodels/widget_models/content_card_model.dart';
import 'package:event_app/ui/shared/styling.dart';
import 'package:flutter/material.dart';

import 'package:event_app/core/data/placeholders.dart';

import '../base_view.dart';

class ContentCardView extends StatelessWidget {
  ContentCardView({this.event, this.onSearch, this.categories});

  final List<Event> event;
  final bool onSearch;
  List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return BaseView<ContentCardModel>(
      builder: (context, model, child) => onSearch
          ? Container(
              height: MediaQuery.of(context).size.height * 0.38,
              child: ListView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: event.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 16.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: onSearch ? Colors.white : Colors.black38,
                          border:
                              Border.all(color: Colors.black38, width: 0.1)),
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 150,
                            width: 275,
                            child: Stack(
                              children: <Widget>[
                                Image.network(
                                  filteredEvents.isEmpty
                                      ? databaseEvents[index].image
                                      : filteredEvents[index].image,
                                  fit: BoxFit.fill,
                                  width: double.infinity,
                                ),
                                Container(
                                  alignment: Alignment.bottomCenter,
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Wrap(
                                        children: <Widget>[
                                          Container(
                                            alignment: Alignment.center,
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 2.0, horizontal: 8.0),
                                            decoration: BoxDecoration(
                                              color: Colors.black38,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(30.0)),
                                            ),
                                            child: Text(
                                              event[index].distance + ' Mi',
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
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(30.0)),
                                            ),
                                            child: Text(
                                              '\%${event[index].price}',
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
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(30.0)),
                                            ),
                                            child: Text(
                                              filteredEvents.isEmpty
                                                  ? databaseEvents[index]
                                                      .category
                                                  : filteredEvents[index]
                                                      .category,
                                              style: stylingInactiveCardNum,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                              filteredEvents.isEmpty
                                  ? databaseEvents[index].name
                                  : filteredEvents[index].name,
                              style: onSearch
                                  ? stylingActiveCard
                                  : stylingInactiveCard),
                          Text(
                            ' - ${event[index].organization} -',
                            style: onSearch
                                ? stylingActiveCardNumItalics
                                : stylingInactiveCardNumItalics,
                          ),
                          Container(
                            width: 275,
                            padding: const EdgeInsets.all(8.0),
                            alignment: Alignment.topCenter,
                            child: Wrap(
                              children: <Widget>[
                                Text(
                                  event[index].description,
                                  style: onSearch
                                      ? stylingActiveCardNum
                                      : stylingInactiveCardNum,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.all(8.0),
                            width: 275,
                            child: GestureDetector(
                              onTap: () => Navigator.of(context)
                                  .push(model.eventDetailsRoute(event[index])),
                              child: Text(
                                'Read More',
                                style: onSearch
                                    ? stylingActiveCardNumItalics
                                    : stylingInactiveCardNumItalics,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          : Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  padding: const EdgeInsets.fromLTRB(32.0, 64.0, 0.0, 64.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: filteredEvents.isEmpty
                        ? databaseEvents.length
                        : filteredEvents.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding:
                            const EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 16.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: onSearch ? Colors.white : Colors.black38,
                              border: Border.all(
                                  color: Colors.black38, width: 0.1)),
                          child: Column(
                            children: <Widget>[
                              Container(
                                height: 150,
                                width: 275,
                                child: Stack(
                                  children: <Widget>[
                                    Image.network(
                                      filteredEvents.isEmpty
                                          ? databaseEvents[index].image
                                          : filteredEvents[index].image,
                                      fit: BoxFit.fill,
                                      width: double.infinity,
                                    ),
                                    Container(
                                      alignment: Alignment.bottomCenter,
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          Wrap(
                                            children: <Widget>[
                                              Container(
                                                alignment: Alignment.center,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 2.0,
                                                        horizontal: 8.0),
                                                decoration: BoxDecoration(
                                                  color: Colors.black38,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              30.0)),
                                                ),
                                                child: Text(
                                                  filteredEvents.isEmpty
                                                      ? '${databaseEvents[index].distance}'
                                                      : '${filteredEvents[index].distance}' +
                                                          ' Mi',
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
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 4.0,
                                                        horizontal: 8.0),
                                                decoration: BoxDecoration(
                                                  color: Colors.black38,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              30.0)),
                                                ),
                                                child: Text(
                                                  filteredEvents.isEmpty
                                                      ? '\$${databaseEvents[index].price}'
                                                      : '\$${filteredEvents[index].price}',
                                                  style: stylingInactiveCardNum,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Wrap(
                                            children: <Widget>[
                                              Container(
                                                alignment: Alignment.center,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 4.0,
                                                        horizontal: 8.0),
                                                decoration: BoxDecoration(
                                                  color: Colors.black38,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              30.0)),
                                                ),
                                                child: Text(
                                                  filteredEvents.isEmpty
                                                      ? databaseEvents[index]
                                                          .category
                                                      : filteredEvents[index]
                                                          .category,
                                                  style: stylingInactiveCardNum,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                  filteredEvents.isEmpty
                                      ? databaseEvents[index].name
                                      : filteredEvents[index].name,
                                  style: onSearch
                                      ? stylingActiveCard
                                      : stylingInactiveCard),
                              Text(
                                filteredEvents.isEmpty
                                    ? '- ${databaseEvents[index].organization} -'
                                    : '- ${filteredEvents[index].organization} -',
                                style: onSearch
                                    ? stylingActiveCardNumItalics
                                    : stylingInactiveCardNumItalics,
                              ),
                              Expanded(
                                child: Container(
                                  width: 275,
                                  padding: const EdgeInsets.all(8.0),
                                  alignment: Alignment.topCenter,
                                  child: Wrap(
                                    children: <Widget>[
                                      Text(
                                        filteredEvents.isEmpty
                                            ? databaseEvents[index].description
                                            : filteredEvents[index].description,
                                        style: onSearch
                                            ? stylingActiveCardNum
                                            : stylingInactiveCardNum,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerRight,
                                padding: const EdgeInsets.all(8.0),
                                width: 275,
                                child: GestureDetector(
                                  onTap: () => Navigator.of(context)
                                      .push(model.eventDetailsRoute(event[index])),
                                  child: Text(
                                    'Read More',
                                    style: onSearch
                                        ? stylingActiveCardNumItalics
                                        : stylingInactiveCardNumItalics,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  padding: const EdgeInsets.all(32.0),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (BuildContext context, int index) {
                      // categories.sort((a, b) => a
                      //     .calculateCounter(databaseEvents)
                      //     .compareTo(b.calculateCounter(databaseEvents)));
                      // categories = categories.reversed.toList();
                      return GestureDetector(
                        onTap: () {
                          if (filterCards[index]) {
                            model.deactivate(categories[index].category, index);
                            model.refreshUI();
                          } else {
                            model.activate(categories[index].category, index);
                            model.refreshUI();
                          }
                        },
                        child: Container(
                          width: 100,
                          child: Card(
                            color: filterCards[index]
                                ? Colors.white
                                : Colors.black38,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Icon(
                                    categories[index].iconData,
                                    color: filterCards[index]
                                        ? Colors.black54
                                        : Colors.white,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 16.0),
                                    child: Text(
                                      '${categories[index].category}',
                                      style: filterCards[index]
                                          ? stylingActiveCard
                                          : stylingInactiveCard,
                                    ),
                                  ),
                                  Text(
                                    '${categories[index].calculateCounter(databaseEvents)}x',
                                    style: filterCards[index]
                                        ? stylingActiveCardNum
                                        : stylingInactiveCardNum,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
