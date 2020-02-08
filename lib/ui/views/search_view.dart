import 'package:event_app/core/data/placeholders.dart';
import 'package:event_app/core/viewmodels/search_model.dart';
import 'package:event_app/ui/views/base_view.dart';
import 'package:flutter/material.dart';
import 'package:event_app/ui/shared/styling.dart';
import 'package:flutter_dash/flutter_dash.dart';

import 'widget_views/content_card_view.dart';

class SearchView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<SearchModel>(
      builder: (context, model, child) => Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          color: Theme.of(context).accentColor,
          height: MediaQuery.of(context).size.height,
          child: ListView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 12,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 0, 24.0, 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        color: Theme.of(context).accentColor,
                        child: IconButton(
                          onPressed: () => Navigator.pop(context),
                          iconSize: 32.0,
                          color: Colors.black,
                          icon: Icon(Icons.arrow_back),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context).push(model.accountRoute()),
                        child: CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: 24.0,
                          backgroundImage:
                              AssetImage('assets/people/person_6.jpg'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 12,
                child: Padding(
                  padding: const EdgeInsets.only(left: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text('Hi, Mikey. \nWhat are you looking for?',
                          style: stylingHeader),
                    ],
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 11,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                  child: Row(
                    children: <Widget>[
                      IconButton(
                          onPressed: () {
                            // Refresh user's target location if user presses it
                          },
                          icon: Icon(Icons.place,
                              size: 28.0,
                              color: Theme.of(context).primaryColor)),
                      Expanded(
                        child: Text(
                          '501 Broadway, Nashville, TN 37203',
                          style: stylingLocationText,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 9,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 24.0, top: 8.0, bottom: 32.0, right: 24.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.15,
                    color: Colors.white,
                    child: TextField(
                      maxLines: 1,
                      controller: model.controller,
                      onChanged: (value) {
                        model.changeText(value);
                      },
                      autocorrect: true,
                      style: stylingInputText,
                      decoration: InputDecoration(
                        hintText: 'Enter city or name of event',
                        hintStyle: stylingInputHintText,
                        prefixIcon: Icon(
                          Icons.search,
                          color: Theme.of(context).primaryColor,
                          size: 28,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor, width: 0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor, width: 0),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.6,
                child: Container(
                  child: DefaultTabController(
                    length: 3,
                    child: Scaffold(
                      backgroundColor: Theme.of(context).accentColor,
                      appBar: TabBar(
                        labelColor: Colors.black,
                        labelStyle: TextStyle(fontWeight: FontWeight.bold),
                        indicatorColor: Colors.black,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicatorPadding:
                            EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                        tabs: <Widget>[
                          Tab(text: 'NEAR'),
                          Tab(text: 'POPULAR'),
                          Tab(text: 'BEST PRICE'),
                        ],
                      ),
                      body: TabBarView(
                        children: <Widget>[
                          _buildEventContainer(context, model),
                          _buildEventContainer(context, model),
                          _buildEventContainer(context, model)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEventContainer(BuildContext context, SearchModel model) {
    var string = model.controller.text;
    filteredEventsFromSearch = databaseEvents
        .where(
            (event) => event.name.toLowerCase().contains(string.toLowerCase()))
        .toList();

    return Container(
      height: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ContentCardView(
            event: filteredEventsFromSearch.isNotEmpty
                ? filteredEventsFromSearch
                : databaseEvents,
            onSearch: true,
          ),
          Container(
              padding: const EdgeInsets.symmetric(vertical: 0.0),
              color: Colors.white,
              alignment: Alignment.center,
              child: Dash(
                dashColor: Theme.of(context).primaryColor,
                dashGap: 10,
                dashLength: 12,
                length: MediaQuery.of(context).size.width - 50,
              )),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Text(
              'Participants',
              style: stylingHeader,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 12,
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(16.0, 0.0, 95.0, 0.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: model.people.length,
                    itemBuilder: (BuildContext context, int index) {
                      return model.people[index];
                    },
                  ),
                ),
                GestureDetector(
                  onTap: () => print('add participants'),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 32.0),
                    child: Text(
                      '+ Add',
                      style: stylingHeader,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
