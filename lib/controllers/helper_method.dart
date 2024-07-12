import 'package:dropoff/controllers/request_helpers.dart';
import 'package:dropoff/info_handler/app_info.dart';
import 'package:dropoff/models/directions.dart';
import 'package:dropoff/models/user_model.dart';
import 'package:dropoff/services/firebase_global_method.dart';
import 'package:dropoff/services/google_map_key.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';

class HelperMethods {
  static void readCurrentOnlineUserInfo() async {
    currentUser = firebaseAuth.currentUser;
    DatabaseReference userRef =
        FirebaseDatabase.instance.ref().child("users").child(currentUser!.uid);

    userRef.once().then((snap) {
      if (snap.snapshot.value != null) {
        userModelCurrentInfo = UserModel.fromSnapshot(snap.snapshot);
      }
    });
  }

  static Future<String> searchLocationForGeographicCoordinate(
      Position position, BuildContext context) async {
    String apiUrl =
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=$mapKey";

    String humanReadableAddress = "";
    var requestResponse = await RequestHelper.receiveRequest(apiUrl);

    if (requestResponse != "Error Occured. Failed. No Response.") {
      humanReadableAddress = requestResponse["results"][0]["formatted_address"];

      Directions userPickUpAddress = Directions();
      userPickUpAddress.locationLatitude = position.latitude;
      userPickUpAddress.locationLongitude = position.longitude;
      userPickUpAddress.locationName = humanReadableAddress;

      Get.find<AppInfoController>()
          .updatePickUpLocationAddress(userPickUpAddress);
    }

    return humanReadableAddress;
  }
}
