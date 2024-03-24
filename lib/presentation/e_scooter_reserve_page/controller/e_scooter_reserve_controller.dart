import 'package:flutter/material.dart';
import '../../../core/e_scooter_export.dart';

class EScooterReserveController extends GetxController {
  var selectedColor = Colors.white.obs;
  var buyDate = Rx<DateTime?>(null);

  var buyTime = Rx<TimeOfDay?>(null);

  void changeColor(Color color) {
    selectedColor.value = color;
  }

  void selectDate(bool isPickup) async {
    final DateTime? buyDt = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData(
            textTheme: TextTheme(
              titleMedium: GoogleFonts.montserrat(color: Colors.white),
            ),
          ),
          child: child!,
        );
      },
    );
    if (buyDt != null && isPickup) {
      buyDate.value = buyDt;
      update();
    }
  }

  void selectTime(bool isPickup) async {
    final TimeOfDay? buyTm = await showTimePicker(
      context: Get.context!,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData(
            textTheme: TextTheme(
              titleMedium: GoogleFonts.montserrat(color: Colors.white),
            ),
          ),
          child: child!,
        );
      },
    );
    if (buyTm != null) {
      if (isPickup) {
        buyTime.value = buyTm;
      }
      update();
    }
  }
}
