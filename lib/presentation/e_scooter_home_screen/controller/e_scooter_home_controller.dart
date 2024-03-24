import '../../../core/e_scooter_export.dart';

class EScooterHomeController extends GetxController {
  var currentIndex = 0.obs;

  void changeTabIndex(int index) {
    currentIndex.value = index;
  }
}
