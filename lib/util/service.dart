import 'package:location/location.dart';
import 'package:flutter/services.dart';

class Service {
  Future<LocationData> getLocation() async {
    var location = new Location();
    LocationData currentLocation;

    try {
      currentLocation = await location.getLocation();
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        var error = 'Permission denied';
      }
    }
    return currentLocation;
  }
}
