import 'package:e_scooter/core/e_scooter_export.dart';
import 'package:flutter/material.dart';
import 'controller/e_scooter_reserve_controller.dart';

class EScooterReserve extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final EScooterReserveController controller =
        Get.put(EScooterReserveController());
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25),
              SizedBox(
                width: Get.width,
                height: Get.height * 0.55,
                child: Row(
                  children: [
                    _buildDetailsSection(controller),
                    _scooterImgDisplay(),
                  ],
                ),
              ),
              _addItems(),
              SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }

  Widget _scooterImgDisplay() {
    return SizedBox(
      width: Get.width * 0.55,
      height: Get.height * 0.8,
      child: Image(
        image: AssetImage(EScooterImageConstant.imgEScooterS1),
        alignment: Alignment(-0.5, 0),
        fit: BoxFit.fitHeight,
      ),
    );
  }

  Widget _buildDetailsSection(EScooterReserveController controller) {
    return SizedBox(
      width: Get.width * 0.45,
      height: Get.height,
      child: Padding(
        padding: EdgeInsets.only(left: 20, top: Get.height * 0.06),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() => _reserveDetails(
                  'ES-S1',
                  'The ES-S1 is an Indian electric vehicle (EV) manufactured by EScooter between 1960 and 1970.',
                  'Booking Date',
                  controller,
                )),
          ],
        ),
      ),
    );
  }

  Widget _reserveDetails(String title, String desc, String reserveTitle,
      EScooterReserveController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: EScooterTextStyles.displayLarge),
        SizedBox(
          height: 12,
        ),
        Text(desc, style: EScooterTextStyles.displaySmall),
        SizedBox(height: 25),
        Text(reserveTitle, style: EScooterTextStyles.headlineLarge),
        SizedBox(height: 10),
        Container(
          height: 100,
          width: Get.width,
          decoration: EScooterDecoration.dateDecoration,
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _buildDateRow(controller),
              _buildSeparator(),
              _buildTimeRow(controller),
            ],
          ),
        ),
        _buyNow()
      ],
    );
  }

  Widget _buildSeparator() {
    return SizedBox(
      width: Get.width,
      height: 2,
      child: Container(
        decoration: BoxDecoration(color: Colors.white70),
      ),
    );
  }

  Widget _buildDateRow(EScooterReserveController controller) {
    return Row(
      children: [
        Icon(Icons.date_range_outlined,
            size: 25, color: const Color(0xff16AB51)),
        SizedBox(width: 8),
        GestureDetector(
          onTap: () => controller.selectDate(true),
          child: Text(
            controller.buyDate.value == null
                ? 'Select Date'
                : '${controller.buyDate.value?.year}-${controller.buyDate.value?.month}-${controller.buyDate.value?.day}',
            style: EScooterTextStyles.headlineMedium,
          ),
        ),
      ],
    );
  }

  Widget _buildTimeRow(EScooterReserveController controller) {
    return Row(
      children: [
        Icon(Icons.access_time_outlined,
            size: 25, color: const Color(0xff16AB51)),
        SizedBox(width: 8),
        GestureDetector(
          onTap: () => controller.selectTime(true),
          child: Text(
            controller.buyTime.value == null
                ? 'Select Time'
                : '${controller.buyTime.value?.hour}:${controller.buyTime.value?.minute}',
            style: EScooterTextStyles.headlineMedium,
          ),
        ),
      ],
    );
  }

  Widget _buyNow() {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: SizedBox(
        width: 140,
        height: 35,
        child: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xff16AB51), Color(0xff60BE85)],
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              "Booking Now",
              style: EScooterTextStyles.displaySmall1
            ),
          ),
        ),

      ),
    );
  }

  Widget _addItems() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Add Items", style: EScooterTextStyles.headlineLarge1),
          SizedBox(
            height: 20,
          ),
          buildCartItemListView()
        ],
      ),
    );
  }

  Widget buildCartItemListView() {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          final List<Map<String, dynamic>> items = [
            {
              "title": "Riding Jacket",
              "imagePath": EScooterImageConstant.imgJacket,
              "price": "₹ 3,999",
              "icon": Icons.directions_bike
            },
            {
              "title": "Riding Helmet",
              "imagePath": EScooterImageConstant.imgHelmet,
              "price": "₹ 4,999",
              "icon": Icons.motorcycle
            },
            {
              "title": "Riding Gloves",
              "imagePath": EScooterImageConstant.imgGloves,
              "price": "₹ 1,999",
              "icon": Icons.sports_motorsports
            },
            {
              "title": "Riding Goggles",
              "imagePath": EScooterImageConstant.imgGoggles,
              "price": "₹ 1,899",
              "icon": Icons.visibility
            },
          ];

          final item = items[index];
          return Padding(
            padding: EdgeInsets.only(right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 140,
                  width: 140,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(item['imagePath']),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.white.withOpacity(0.4), BlendMode.dstATop),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Icon(item['icon'], size: 40, color: Colors.green),
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item['title'],
                            style: EScooterTextStyles.displaySmall1),
                        SizedBox(height: 4),
                        Text(item['price'],
                            style: EScooterTextStyles.displaySmall2),
                      ],
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                          color: Color(0xff16AB51),
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                          child: Icon(
                        Icons.add,
                        size: 20,
                        color: Colors.white,
                      )),
                    )
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
