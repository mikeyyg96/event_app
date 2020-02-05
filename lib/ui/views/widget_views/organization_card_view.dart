import 'package:event_app/core/viewmodels/widget_models/organization_card_model.dart';
import 'package:event_app/ui/shared/styling.dart';
import 'package:event_app/ui/views/base_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrganizationCardView extends StatelessWidget {
  final String type;
  final IconData icon;

  OrganizationCardView({this.type, this.icon});

  @override
  Widget build(BuildContext context) {
    return BaseView<OrganizationCardModel>(
      builder: (context, model, child) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            if (model.active) {
              model.deactivate();
            } else {
              model.activate();
            }
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
            elevation: 12,
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  color: model.active
                      ? Theme.of(context).primaryColor.withOpacity(0.8)
                      : Colors.white),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      icon,
                      color: model.active ? Colors.white : Colors.black54,
                    ),
                    Text(
                      type,
                      style: model.active
                          ? stylingInactiveCardNum
                          : stylingActiveCardNum,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
