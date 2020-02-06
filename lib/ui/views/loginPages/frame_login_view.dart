import 'dart:ui';

import 'package:event_app/core/classes/event.dart';
import 'package:event_app/core/data/placeholders.dart';
import 'package:event_app/core/viewmodels/loginPages/frame_login_model.dart';
import 'package:event_app/ui/shared/styling.dart';
import 'package:event_app/ui/views/base_view.dart';
import 'package:event_app/ui/views/contentPages/preferences_view.dart';
import 'package:event_app/ui/views/search_view.dart';
import 'package:event_app/ui/views/widget_views/content_card_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

// Data
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
                                  ContentCardView(
                                      event: filteredEvents.isEmpty
                                          ? databaseEvents
                                          : filteredEvents,
                                      onSearch: false,
                                      categories: categories),
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
                  color: Theme.of(context).accentColor,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(128.0),
                    child: Image.asset(
                      'assets/icon/logo.png',
                      height: 100,
                      width: 100,
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height / 2.15,
                  left: MediaQuery.of(context).size.width / 5,
                  child: Material(
                    color: Colors.transparent,
                    child: Text(
                      'Sign in with your phone number',
                      style: stylingActiveCard,
                    ),
                  ),
                ),
                AnimatedPositioned(
                  curve: Curves.easeIn,
                  duration: Duration(milliseconds: 500),
                  onEnd: () => model.pressed ? model.transition() : {},
                  bottom: model.pressed
                      ? -300
                      : MediaQuery.of(context).size.height / 2.5,
                  left: MediaQuery.of(context).size.width / 8,
                  child: Material(
                    color: Colors.transparent,
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      width: MediaQuery.of(context).size.width / 1.3,
                      decoration: BoxDecoration(
                          border: Border.all(color: Theme.of(context).primaryColor),
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                      child: Center(
                        child: TextField(
                          onEditingComplete: () {
                            FocusScope.of(context).requestFocus(FocusNode());
                            model.verifyNumber(context);
                          },
                          autocorrect: false,
                          cursorColor: Colors.black38,
                          enableSuggestions: false,
                          maxLengthEnforced: true,
                          onChanged: (value) {
                            model.controller.selection =
                                TextSelection.collapsed(
                                    offset: model.controller.text.length);
                          },
                          style: stylingActiveCard,
                          textAlign: TextAlign.center,
                          controller: model.controller,
                          inputFormatters: [model.maskTextInputFormatter],
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(border: InputBorder.none),
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