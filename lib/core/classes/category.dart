import 'package:event_app/core/classes/event.dart';
import 'package:flutter/material.dart';

class Category {
  final String category;
  final IconData iconData;

  Category({this.category, this.iconData});

  int calculateCounter(List<Event> events) {
    int counter = 0;
    events.forEach((Event event) {
      if (category == event.category) {
        counter++;
      }
    });
    return counter;
  }
}