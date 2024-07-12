import 'package:dropoff/utilities/extensions.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../controllers/home_controller.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: GetBuilder<HomeController>(
          builder: (controller) {
            return Stack(
              children: [
                GoogleMap(
                  mapType: MapType.normal,
                  myLocationEnabled: true,
                  zoomGesturesEnabled: true,
                  zoomControlsEnabled: true,
                  initialCameraPosition: HomeController.kGooglePlex,
                  polylines: controller.polyLineSet,
                  markers: controller.markersSet,
                  circles: controller.circlesSet,
                  onMapCreated: controller.onMapCreated,
                  onCameraMove: controller.onCameraMove,
                  onCameraIdle: () {
                    if (controller.pickLocation != null) {
                      controller.getAddressFromLatLng(controller.pickLocation!);
                    }
                  },
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 35.0.h),
                    child: Image.asset(
                      "assets/images/location.png",
                      width: 45.0.w,
                      height: 45.0.h,
                    ),
                  ),
                ),
                Positioned(
                    top: 40,
                    right: 20,
                    left: 20,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          color: Colors.white),
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        controller.address ?? "Set a location",
                        overflow: TextOverflow.visible,
                        softWrap: true,
                      ),
                    ))
              ],
            );
          },
        ),
      ),
    );
  }
}
