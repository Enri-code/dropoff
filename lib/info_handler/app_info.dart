import 'package:get/get.dart';

import '../models/directions.dart';

class AppInfoController extends GetxController {
  var userPickUpLocation = Rx<Directions?>(null);
  var userDropOffLocation = Rx<Directions?>(null);
  var countTotalTrips = 0.obs;

  void updatePickUpLocationAddress(Directions userPickUpAddress) {
    userPickUpLocation.value = userPickUpAddress;
    update();
  }

  void updateDropOffLocationAddress(Directions dropOffAddress) {
    userDropOffLocation.value = dropOffAddress;
    update();
  }
}
