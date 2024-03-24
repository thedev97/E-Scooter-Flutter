import '../../../core/e_scooter_export.dart';

class EScooterSettingController extends GetxController {
  var _notificationEnabled = false.obs;
  var _updateEnabled = false.obs;


  bool get notificationEnabled => _notificationEnabled.value;
  bool get updateEnabled => _updateEnabled.value;

  void toggleNotification(bool value) {
    _notificationEnabled.value = value;
  }

  void toggleUpdate(bool value) {
    _updateEnabled.value = value;
  }
}
