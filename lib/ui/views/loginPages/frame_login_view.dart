import 'dart:ui';

import 'package:event_app/core/classes/event.dart';
import 'package:event_app/core/data/placeholders.dart';
import 'package:event_app/core/viewmodels/loginPages/frame_login_model.dart';
import 'package:event_app/ui/views/base_view.dart';
import 'package:event_app/ui/views/contentPages/preferences_view.dart';
import 'package:event_app/ui/views/search_view.dart';
import 'package:event_app/ui/views/widget_views/content_card_view.dart';
import 'package:event_app/ui/views/widget_views/content_category_view.dart';
import 'package:flutter/material.dart';

import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

// Data
import 'package:event_app/core/data/events.dart';
import 'package:event_app/core/data/categories.dart';

class FrameLoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<FrameLoginModel>(
      builder: (context, model, child) => model.isTransitioned
          ? FutureBuilder<List<Event>>(
              future: model.getEvents(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Stack(
                    children: <Widget>[
                      Container(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 0.9, sigmaY: 0.9),
                          child: Container(
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(model.image), fit: BoxFit.fill),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: Container(
                          child: AnimationLimiter(
                            child: Column(
                              children: AnimationConfiguration.toStaggeredList(
                                delay: Duration(milliseconds: 300),
                                duration: const Duration(milliseconds: 1000),
                                childAnimationBuilder: (widget) =>
                                    SlideAnimation(
                                  horizontalOffset: 200.0,
                                  child: FadeInAnimation(
                                    child: widget,
                                  ),
                                ),
                                children: <Widget>[
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.2,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 32.0, vertical: 64.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          IconButton(
                                            onPressed: () =>
                                                Navigator.of(context).push(
                                                    model.searchRoute(
                                                        SearchView(),
                                                        Offset(-1.0, 0.0))),
                                            icon: Icon(Icons.search),
                                            color:
                                                Colors.white.withOpacity(0.75),
                                            iconSize: 32,
                                          ),
                                          IconButton(
                                            onPressed: () =>
                                                Navigator.of(context).push(
                                                    model.searchRoute(
                                                        PreferencesView(),
                                                        Offset(1.0, 0.0))),
                                            icon: Icon(Icons.tune),
                                            color:
                                                Colors.white.withOpacity(0.75),
                                            iconSize: 32,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.5,
                                    width: double.infinity,
                                    padding: const EdgeInsets.fromLTRB(
                                        32.0, 64.0, 0.0, 64.0),
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      physics: ClampingScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      itemCount: filteredEvents.isEmpty
                                          ? databaseEvents.length
                                          : filteredEvents.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return ContentCardView(
                                          event: filteredEvents.isEmpty
                                              ? databaseEvents[index]
                                              : filteredEvents[index],
                                          onSearch: false,
                                        );
                                      },
                                    ),
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.3,
                                    padding: const EdgeInsets.all(32.0),
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: categories.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        categories.sort((a, b) => a
                                            .calculateCounter(databaseEvents)
                                            .compareTo(
                                                b.calculateCounter(databaseEvents)));
                                        categories =
                                            categories.reversed.toList();
                                        return ContentCategoryView(
                                            category: categories[index],
                                            callback: model.refreshUI);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return Container(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 0.9, sigmaY: 0.9),
                      child: Container(
                        color: Colors.black.withOpacity(0.5),
                        child: Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(model.image), fit: BoxFit.fill),
                    ),
                  );
                }
              },
            )
          : Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(model.image), fit: BoxFit.fill),
                  ),
                ),
                Container(
                  color: Colors.transparent,
                ),
                AnimatedPositioned(
                  curve: Curves.easeIn,
                  duration: Duration(milliseconds: 500),
                  onEnd: () => model.pressed ? model.transition() : {},
                  bottom: model.pressed
                      ? -100
                      : MediaQuery.of(context).size.height / 6,
                  left: 125,
                  child: Material(
                    color: Theme.of(context).primaryColor.withOpacity(0.5),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    child: InkWell(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      onTap: () {
                        model.animateDown();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        width: MediaQuery.of(context).size.width / 2.2,
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Text('Explore',
                                  style: TextStyle(
                                      color: Theme.of(context).accentColor,
                                      fontSize: 32)),
                            ),
                            Icon(
                              Icons.place,
                              color: Theme.of(context).accentColor,
                              size: 32,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
