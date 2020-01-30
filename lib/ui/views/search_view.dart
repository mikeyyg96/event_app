import 'package:event_app/core/viewmodels/search_model.dart';
import 'package:event_app/ui/views/base_view.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<SearchModel>(
      builder: (context, model, child) => SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/background/town_background.jpg'),
                    fit: BoxFit.fill),
              ),
            ),
            Positioned(
              top: 10,
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Card(
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 40.0,
                        left: 20.0,
                        child: Text(
                          'What are you looking for?',
                          style: TextStyle(
                              fontSize: 30.0,
                              color: Theme.of(context).primaryColor),
                        ),
                      ),
                      Positioned(
                        top: 100.0,
                        left: 20.0,
                        child: Row(
                          children: <Widget>[
                            // Icon(
                            //   Icons.place,
                            //   color: Theme.of(context).primaryColor,
                            //   size: 32,
                            // ),
                            // Text(
                            //   '501 Broadway, \nNashville, TN 37203',
                            //   style: TextStyle(
                            //       color: Theme.of(context).primaryColor,
                            //       fontSize: 15.0),
                            // ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 1.3,
                              child: TextField(
                                onChanged: (value) {},
                                // controller: editingController,
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 15.0,
                                      ),
                                  hintText: "501 Broadway, Nashville, TN 37203",
                                  prefixIcon: Icon(
                                    Icons.place,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 40,
                        width: MediaQuery.of(context).size.width / 1.1,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: TextField(
                            onChanged: (value) {},
                            // controller: editingController,
                            decoration: InputDecoration(
                              labelStyle: TextStyle(
                                  color: Theme.of(context).primaryColor),
                              hintStyle: TextStyle(
                                  color: Theme.of(context).primaryColor),
                              labelText: "Search",
                              hintText: "Search",
                              prefixIcon: Icon(
                                Icons.search,
                                color: Theme.of(context).primaryColor,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(25.0),
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
            ),
            Positioned(
              bottom: 40,
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Card(
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Text('What are you looking for?'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
