import 'package:event_app/core/classes/category.dart';
import 'package:event_app/core/viewmodels/widget_models/content_category_model.dart';
import 'package:event_app/ui/shared/styling.dart';
import 'package:event_app/ui/views/base_view.dart';
import 'package:flutter/material.dart';

class ContentCategoryView extends StatelessWidget {

  ContentCategoryView({this.category, this.callback});

  final Category category;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return BaseView<ContentCategoryModel>(
      builder: (context, model, child) => GestureDetector(
      onTap: () {
        if (model.active) {
          model.deactivate();
          callback();
        } else {
          model.activate();
          callback();
        }
      },
      child: Container(
        width: 100,
        child: Card(
          color: model.active ? Colors.white : Colors.black38,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(
                  category.iconData,
                  color: model.active ? Colors.black54 : Colors.white,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(
                    '${category.category}',
                    style: model.active ? stylingActiveCard : stylingInactiveCard,
                  ),
                ),
                Text(
                  '${category.counter.toString()}x',
                  style: model.active ? stylingActiveCardNum : stylingInactiveCardNum,
                ),
              ],
            ),
          ),
        ),
      ),
    ),
    );
  }
}