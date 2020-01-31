import 'package:event_app/core/viewmodels/search_model.dart';
import 'package:event_app/ui/views/base_view.dart';
import 'package:flutter/material.dart';
import 'package:event_app/ui/shared/styling.dart';

class SearchView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<SearchModel>(
      builder: (context, model, child) => Scaffold(
        body: Container(
          color: Theme.of(context).accentColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 48.0, 24.0, 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      color: Theme.of(context).accentColor,
                      child: IconButton(
                        onPressed: () => print('Button pressed'),
                        iconSize: 32.0,
                        color: Colors.black,
                        icon: Icon(Icons.arrow_back),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => print('Tapped Avatar'),
                      child: CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 24.0,
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text('Hi, Mikey. \nWhat are you looking for?',
                        style: stylingHeader),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width / 1.15,
                      child: TextField(
                        minLines: 2,
                        maxLines: 2,
                        onChanged: (value) {},
                        // controller: editingController,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 16.0,
                          ),
                          hintText: "501 Broadway, \nNashville, TN 37203",
                          prefixIcon: Icon(
                            Icons.place,
                            size: 28.0,
                            color: Theme.of(context).primaryColor,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 24.0, top: 8.0, bottom: 32.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width / 1.15,
                      color: Colors.white,
                      child: TextField(
                        onChanged: (value) {},
                        // controller: Controller Goes Here,
                        autocorrect: true,
                        style: stylingInputText,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: Theme.of(context).primaryColor,
                            size: 28,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 0),
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      color: Theme.of(context).accentColor,
                      child: DefaultTabController(
                        length: 3,
                        child: TabBar(
                          labelColor: Colors.black,
                          labelStyle: TextStyle(fontWeight: FontWeight.bold),
                          indicatorColor: Colors.black,
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicatorPadding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                          tabs: <Widget>[
                            Tab(text: 'NEAR'),
                            Tab(text: 'POPULAR'),
                            Tab(text: 'BEST PRICE'),
                          ],
                        ),
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
}