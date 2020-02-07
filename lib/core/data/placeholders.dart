import 'package:event_app/core/classes/event.dart';
import 'package:event_app/core/viewmodels/widget_models/content_card_model.dart';

List<String> filters = List();
List<bool> filterCards = [false, false, false, false, false, false, false];
List<Event> filteredEvents = List();
List<Event> filteredEventsFromSearch = List();
List<Event> databaseEvents = List();

ContentCardModel contentCardModel = new ContentCardModel();