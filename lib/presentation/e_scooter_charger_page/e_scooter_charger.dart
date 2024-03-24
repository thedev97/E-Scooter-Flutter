import 'package:e_scooter/core/utils/e_scooter_helper.dart';
import 'package:flutter/material.dart';
import '../../../core/e_scooter_export.dart';
import 'controller/e_scooter_charger_controller.dart';

class EScooterCharger extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final EScooterChargerController controller =
        Get.put(EScooterChargerController());
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25),
              _buildHeader(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildDetailsSection(controller),
                  _scooterImgDisplay(),
                ],
              ),
              _buildChargingStations(controller),
              _buildBattery(),
              _buildMaps(),
              _recentRide(),
              _features()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("ES-A1", style: theme.textTheme.displayLarge),
          SizedBox(height: 8.0),
          Text("Last synced 1min ago", style: EScooterTextStyles.displaySmall2),
        ],
      ),
    );
  }

  Widget _scooterImgDisplay() {
    return Image(
      image: AssetImage(EScooterImageConstant.imgEScooter_1),
      width: Get.width * 0.53,
      height: Get.height * 0.42,
      alignment: Alignment(-0.4, 0),
      fit: BoxFit.fitHeight,
    );
  }

  Widget _buildDetailsSection(EScooterChargerController controller) {
    return Padding(
      padding: EdgeInsets.only(left: 20, top: 20),
      child: Column(
        children: [
          _buildSyncDetails(),
        ],
      ),
    );
  }

  Widget _buildSyncDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('31',
                style: EScooterTextStyles.displayLarge.copyWith(fontSize: 25)),
            SizedBox(width: 8),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text('km left', style: EScooterTextStyles.headlineLarge2),
            ),
          ],
        ),
        SizedBox(height: 15),
        EScooterHelper.charger11(),
        _chargeNow(),
        _maintenance()
      ],
    );
  }

  Widget _chargeNow() {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 20),
      child: SizedBox(
        width: 150,
        height: 35,
        child: Container(
          decoration: EScooterDecoration.gradientBlueGray
              .copyWith(borderRadius: BorderRadius.circular(8)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EScooterImageView(imagePath: EScooterImageConstant.imgCharge),
              SizedBox(width: 8),
              Text("Charge Now",
                  style: theme.textTheme.titleMedium?.copyWith(
                      color: appTheme.yellow, fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _maintenance() {
    return Container(
      decoration: EScooterDecoration.gradientBlueGray.copyWith(
        borderRadius: BorderRadius.circular(25),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          EScooterImageView(
            imagePath: EScooterImageConstant.imgAlarm,
            height: 30.0,
            width: 30.0,
          ),
          SizedBox(height: 8.0),
          Text(
            "MAINTENANCE",
            style: EScooterTextStyles.labelMedium,
          ),
          Row(
            children: [
              Text(
                "2",
                style: theme.textTheme.displayLarge?.copyWith(fontSize: 25),
              ),
              SizedBox(width: 8),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  "Mild",
                  style: EScooterTextStyles.displayMedium
                      .copyWith(color: appTheme.amber),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.0),
        ],
      ),
    );
  }

  Widget _buildChargingStations(EScooterChargerController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Text('Charging Stations',
              style: EScooterTextStyles.displayLarge.copyWith(fontSize: 20)),
          /*SizedBox(
            height: Get.height * 0.5,
            width: Get.width,
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                target: LatLng(
                  37.43296265331129,
                  -122.08832357078792,
                ),
                zoom: 14.4746,
              ),
              onMapCreated: (GoogleMapController mapController) {
                controller.googleMapController.complete(mapController);
              },
              zoomControlsEnabled: false,
              zoomGesturesEnabled: false,
              myLocationButtonEnabled: false,
              myLocationEnabled: false,
            ),
          ),*/
        ],
      ),
    );
  }

  Widget _buildBattery() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Battery",
                  style:
                      EScooterTextStyles.displayLarge.copyWith(fontSize: 20)),
              Row(
                children: [
                  Text('31',
                      style: EScooterTextStyles.displayLarge
                          .copyWith(fontSize: 25)),
                  SizedBox(width: 8),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text('km', style: EScooterTextStyles.headlineLarge2),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.only(left: 15),
            decoration: EScooterDecoration.fillGray
                .copyWith(borderRadius: BorderRadius.circular(15)),
            child: Row(
              children: [
                for (int i = 0; i < 10; i++)
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: SizedBox(
                      height: 65.0,
                      child: VerticalDivider(
                          color: Colors.grey.withOpacity(0.5),
                          width: 2.0,
                          thickness: 2.0,
                          indent: 15.0,
                          endIndent: 15.0),
                    ),
                  ),
                Container(
                  width: Get.width * 0.43,
                  margin: EdgeInsets.only(top: 8, bottom: 8),
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  decoration: EScooterDecoration.gradientOrange
                      .copyWith(borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      EScooterImageView(
                          imagePath:
                              EScooterImageConstant.imgEScooter_Battery_1),
                      SizedBox(width: 8),
                      Text("30 %",
                          style: theme.textTheme.displayMedium?.copyWith(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.w700)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMaps() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Use Maps To",
              style: EScooterTextStyles.displayLarge.copyWith(fontSize: 20)),
          SizedBox(height: 10),
          Row(
            children: [
              _buildMapItem(
                imagePath: EScooterImageConstant.imgEScooter_Scooter_1,
                title: "Find a Charger",
              ),
              SizedBox(width: 12),
              _buildMapItem(
                imagePath: EScooterImageConstant.imgEScooter_Scooter_2,
                title: "Locate Scooter",
              ),
              SizedBox(width: 12),
              _buildMapItem(
                imagePath: EScooterImageConstant.imgEScooter_Search,
                title: "Search a Place",
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildMapItem({required String imagePath, required String title}) {
    return Container(
      decoration: EScooterDecoration.gradientBlueGray.copyWith(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          EScooterImageView(
            imagePath: imagePath,
            height: 30.0,
            width: 30.0,
          ),
          SizedBox(height: 8.0),
          Text(
            title,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8.0),
        ],
      ),
    );
  }

  Widget _recentRide() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Column(
        children: [
          _buildTitle(),
          SizedBox(height: 5),
          _buildRecentRideItem(
              "50 mins ago", "4.9", "40", "69", "Wh/Km", "min", "Km/h"),
          _buildRecentRideItem(
              "2 hours ago", "16", "91", "71", "Wh/Km", "min", "Km/h"),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Your Recent Ride",
          style: EScooterTextStyles.displayLarge.copyWith(fontSize: 20),
        ),
        Row(
          children: [
            Text("View all", style: EScooterTextStyles.titleSmall),
            SizedBox(width: 8),
            Icon(
              Icons.arrow_forward_ios_outlined,
              size: 16,
              color: appTheme.orange300,
            )
          ],
        ),
      ],
    );
  }

  Widget _buildRecentRideItem(
      String timeAgo,
      String efficiency,
      String duration,
      String topSpeed,
      String efficiencyUnit,
      String durationUnit,
      String speedUnit) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 25,
            decoration: EScooterDecoration.fillRecentRideContainer,
            child: Center(
              child: Text(
                timeAgo,
                style: theme.textTheme.labelMedium?.copyWith(
                  fontSize: 13,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            decoration: EScooterDecoration.gradientBlueGray.copyWith(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildRecentRideStat(
                        "Efficiency", efficiency, efficiencyUnit),
                    _buildRecentRideStat("Duration", duration, durationUnit),
                    _buildRecentRideStat("Top Speed", topSpeed, speedUnit),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentRideStat(String label, String value, String unit) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: theme.textTheme.labelMedium?.copyWith(
            fontSize: 14,
            color: Colors.white70,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 8),
        Text(
          value,
          style: theme.textTheme.displayLarge?.copyWith(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 4),
        Text(
          unit,
          style: theme.textTheme.labelMedium?.copyWith(
            fontSize: 14,
            color: Colors.white54,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _features() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Features",
            style: EScooterTextStyles.displayLarge.copyWith(fontSize: 20),
          ),
          SizedBox(height: 15),
          Container(
            width: double.infinity,
            decoration: EScooterDecoration.fillGray.copyWith(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(EScooterImageConstant.imgEScooterImg12),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.2), BlendMode.dstATop),
              ),
            ),
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "EScooter Labs",
                  style: theme.textTheme.displayLarge?.copyWith(
                    fontSize: 18,
                    color: Colors.white70,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "Try the latest new features",
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontSize: 14,
                    color: Colors.white70,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      "Explore Now",
                      style: theme.textTheme.bodyLarge?.copyWith(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, left: 5),
                      child: Icon(Icons.arrow_forward, size: 25, color: Colors.white),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
