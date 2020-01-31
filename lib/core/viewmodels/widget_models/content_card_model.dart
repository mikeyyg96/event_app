import 'package:event_app/core/classes/event.dart';
import 'package:event_app/core/viewmodels/base_model.dart';

class ContentCardModel extends BaseModel {
  Event _event = new Event(
    name: 'Burger Fridays',
    category: 'Food',
    date: DateTime.now(),
    distance: 2.12,
    image: 'assets/events/burger_food.jpg',
    organization: 'Verified',
    price: 15.00
  );

  Event get event => _event;

}