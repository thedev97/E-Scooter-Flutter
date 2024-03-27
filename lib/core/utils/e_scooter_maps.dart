import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';

class ChargingStationsMap extends StatelessWidget {
  final double latitude;
  final double longitude;
  final Set<Marker> markers;
  final Set<Polyline> polyLines;

  ChargingStationsMap({
    required this.latitude,
    required this.longitude,
    required this.markers,
    required this.polyLines,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.25,
      width: Get.width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: CameraPosition(
            target: LatLng(latitude, longitude),
            zoom: 15.0,
            tilt: 90,
          ),
          onMapCreated: (GoogleMapController mapController) {
            // Your map controller initialization code here
          },
          zoomGesturesEnabled: true,
          myLocationEnabled: true,
          buildingsEnabled: true,
          fortyFiveDegreeImageryEnabled: true,
          liteModeEnabled: true,
          trafficEnabled: true,
          tiltGesturesEnabled: true,
          scrollGesturesEnabled: true,
          rotateGesturesEnabled: true,
          indoorViewEnabled: true,
          mapToolbarEnabled: false,
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
          compassEnabled: false,
          markers: markers,
          polylines: polyLines,
        ),
      ),
    );
  }
}