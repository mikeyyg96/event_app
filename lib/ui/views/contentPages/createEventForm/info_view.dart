import 'package:event_app/core/viewmodels/contentPages/createEventForm/info_model.dart';
import 'package:event_app/ui/shared/styling.dart';
import 'package:flutter/material.dart';

import '../../base_view.dart';

class InfoView extends StatelessWidget {

  final void Function(bool value) onFormChange;

  InfoView({Key key, @required this.onFormChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<InfoModel>(
      builder: (context, model, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 0.0),
                child: Text('Event Name', style: stylingFormLabel),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: TextField(
                  onChanged: (value) => {model.setFormValues('name', value), onFormChange(model.isComplete)},
                  style: stylingFormInput,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(child: stylingFormDivider),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 0.0),
                child: Text('Category', style: stylingFormLabel),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: TextField(
                  onChanged: (value) => {model.setFormValues('category', value), onFormChange(model.isComplete)},
                  style: stylingFormInput,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(child: stylingFormDivider),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 0.0),
                child: Text('Location', style: stylingFormLabel),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: TextField(
                  onChanged: (value) => {model.setFormValues('location', value), onFormChange(model.isComplete)},
                  onTap: () => {model.handleAddress(context), onFormChange(model.isComplete)},
                  controller: model.locationController,
                  style: stylingFormInput,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(child: stylingFormDivider),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 0.0),
                child: Text('Date', style: stylingFormLabel),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: TextField(
                  onChanged: (value) => model.setFormValues('date', value),
                  onTap: () => {model.handleDate(context, model.dateTime), onFormChange(model.isComplete)},
                  controller: model.dateController,
                  style: stylingFormInput,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(child: stylingFormDivider),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 0.0),
                child: Text('Time', style: stylingFormLabel),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: TextField(
                  onTap: () => {model.handleDate(context, model.dateTime), onFormChange(model.isComplete)},
                  controller: model.timeController,
                  style: stylingFormInput,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(child: stylingFormDivider),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 0.0),
                child: Text('Organization', style: stylingFormLabel),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: TextField(
                  onChanged: (value) => {model.setFormValues('organization', value), onFormChange(model.isComplete)},
                  style: stylingFormInput,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(child: stylingFormDivider),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 0.0),
                child: Text('Description', style: stylingFormLabel),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: TextField(
                  onChanged: (value) => {model.setFormValues('description', value), onFormChange(model.isComplete)},
                  style: stylingFormInput,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(child: stylingFormDivider),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
