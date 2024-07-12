import 'dart:async';
import 'dart:core';

import 'package:dropoff/constants/colors.dart';
import 'package:dropoff/controllers/helper_method.dart';
import 'package:dropoff/services/firebase_global_method.dart';
import 'package:dropoff/services/google_map_key.dart';
import 'package:dropoff/utilities/extensions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as loc;

import '../models/directions.dart';

class HomeController extends GetxController {
  final sizee = 19.0.obs;
  LatLng? pickLocation;
  loc.Location location = loc.Location();
  String? address;
  String? mapStyle;

  final Completer<GoogleMapController> controllerGoogleMap = Completer();
  GoogleMapController? newGoogleMapController;

  static const CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  double searchLocationContainerHeight = 220.0.h;
  double waitingResponseFromDriverContainerHeight = 220.0.h;
  double assignedDriverInfoContainerHeight = 220.0.h;

  Position? userCurrentPosition;
  var geoLocator = Geolocator();

  LocationPermission? locationPermission;
  double bottomPaddingOfMap = 0;

  List<LatLng> pLineCoordinatedList = [];
  Set<Polyline> polyLineSet = {};

  Set<Marker> markersSet = {};
  Set<Circle> circlesSet = {};

  String userName = "";
  String userEmail = "";

  bool openNavigationDrawer = true;
  bool activeNearbyDriverKeysLoaded = false;

  BitmapDescriptor? activeNearbyIcon;

  @override
  void onInit() {
    super.onInit();
    requestLocationPermission();
    rootBundle.loadString('assets/map_style.txt').then((string) {
      mapStyle = string;
    });
  }

  void onMapCreated(GoogleMapController controller) {
    controllerGoogleMap.complete(controller);
    newGoogleMapController = controller;
    newGoogleMapController!.setMapStyle(mapStyle);
    locationUserPosition();
    update();
  }

  void onCameraMove(CameraPosition position) {
    if (pickLocation != position.target) {
      pickLocation = position.target;
      update();
    }
  }

  Future<void> requestLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        // Permissions are denied, handle appropriately.
        return;
      }
    }

    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled, handle appropriately.
      return;
    }
  }

  Future<void> locationUserPosition() async {
    try {
      Position cPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      userCurrentPosition = cPosition;

      LatLng latLngPosition =
          LatLng(userCurrentPosition!.latitude, userCurrentPosition!.longitude);
      CameraPosition cameraPosition =
          CameraPosition(target: latLngPosition, zoom: 15);

      newGoogleMapController!
          .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

      String humanReadableAddress =
          await HelperMethods.searchLocationForGeographicCoordinate(
              userCurrentPosition!, Get.context!);

      if (kDebugMode) print("YOur address is $humanReadableAddress");

      userName = userModelCurrentInfo!.name!;
      userEmail = userModelCurrentInfo!.email!;

      // initializeGeoFireListener();

      // HelperMethods.readDeliveryKeysForOnlineUser(Get.context);
    } catch (e) {
      // Handle exceptions, such as location permissions denied
      print(e);
    }
  }

  Future<void> getAddressFromLatLng(LatLng position) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = placemarks[0];
      address = "${place.street}, ${place.locality}, ${place.country}";
      Directions userPickUpAddress = Directions();
      userPickUpAddress.locationLatitude = pickLocation!.latitude;
      userPickUpAddress.locationLongitude = pickLocation!.longitude;
      userPickUpAddress.locationName = address;
      update();
    } catch (e) {
      print(e);
    }
  }
}
