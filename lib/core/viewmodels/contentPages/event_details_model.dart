import 'dart:async';

import 'package:event_app/core/viewmodels/base_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class EventDetailsModel extends BaseModel {
  Completer<GoogleMapController> _googleMapController = new Completer();

  Completer<GoogleMapController> get googleMapController => _googleMapController;
}