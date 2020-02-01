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
              Container(
                height: 275,
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
                        Container(
                          color: Colors.white,
                          // height: MediaQuery.of(context).size.height * 0.3,
                          padding: const EdgeInsets.fromLTRB(16, 32, 0, 32),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: model.places.length,
                            itemBuilder: (BuildContext context, int index) {
                              return model.places[index];
                            },
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          // height: MediaQuery.of(context).size.height * 0.3,
                          padding: const EdgeInsets.fromLTRB(16, 32, 0, 32),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: model.places.length,
                            itemBuilder: (BuildContext context, int index) {
                              return model.places[index];
                            },
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          // height: MediaQuery.of(context).size.height * 0.3,
                          padding: const EdgeInsets.fromLTRB(16, 32, 0, 32),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: model.places.length,
                            itemBuilder: (BuildContext context, int index) {
                              return model.places[index];
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                child: Divider(
                  color: Theme.of(context).accentColor,
                  thickness: 1,
                  indent: 25.0,
                  endIndent: 25.0,
                ),
              ),
              // Expanded(
              //   child: Container(
              //     color: Colors.white,
              //     padding: const EdgeInsets.fromLTRB(16, 32, 175, 32),
              //     child: ListView.builder(
              //       scrollDirection: Axis.horizontal,
              //       itemCount: model.people.length,
              //       itemBuilder: (BuildContext context, int index) {
              //         return model.people[index];
              //       },
              //     ),
              //   ),
              // ),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Text(
                  'Participants',
                  style: stylingHeader,
                ),
              ),
              Expanded(
                child: Container(
                  height: 150,
                  color: Colors.white,
                  padding: const EdgeInsets.fromLTRB(16.0, 0.0, 95.0, 32.0),
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
                      Padding(
                        padding: const EdgeInsets.only(left: 32.0),
                        child: Text(
                          '+ Add',
                          style: stylingHeader,
                        ),
                      ),
                    ],
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