import 'package:event_app/core/viewmodels/search_model.dart';
import 'package:event_app/ui/views/base_view.dart';
import 'package:flutter/material.dart';
import 'package:event_app/ui/shared/styling.dart';

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
                height: MediaQuery.of(context).size.height / 9,
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
                        onTap: () => print('Tapped Avatar'),
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
                height: MediaQuery.of(context).size.height / 9,
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
                height: MediaQuery.of(context).size.height / 9,
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
                          '501 Broadway,\nNashville, TN 37203',
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
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.55,
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
    return Container(
      height: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(16, 32, 0, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: model.places.length,
              itemBuilder: (BuildContext context, int index) {
                return model.places[index];
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            color: Colors.white,
            child: Divider(
              color: Theme.of(context).accentColor,
              thickness: 1,
              indent: 8.0,
              endIndent: 8.0,
            ),
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Text(
              'Participants',
              style: stylingHeader,
            ),
          ),
          Container(
            height: 70,
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
