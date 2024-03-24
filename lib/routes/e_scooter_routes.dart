import 'package:e_scooter/core/e_scooter_export.dart';
import 'package:e_scooter/presentation/e_scooter_charger_page/e_scooter_charger.dart';
import 'package:e_scooter/presentation/e_scooter_home_screen/e_scooter_home.dart';
import 'package:e_scooter/presentation/e_scooter_reserve_page/e_scooter_reserve.dart';
import 'package:e_scooter/presentation/e_scooter_setting_page/e_scooter_setting.dart';

class AppRoutes {
  static const String mainScreen = '/main';
  static const String homePage = '/home';
  static const String reserveScreen = '/reserve';
  static const String chargerScreen = '/charger';
  static const String settingScreen = '/setting';
  static const String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
      name: initialRoute,
      page: () => EScooterHome(),
    ),
    GetPage(
      name: mainScreen,
      page: () => EScooterHome(),
    ),
    GetPage(
      name: reserveScreen,
      page: () => EScooterReserve(),
    ),
    GetPage(
      name: chargerScreen,
      page: () => EScooterCharger(),
    ),
    GetPage(
      name: settingScreen,
      page: () => EScooterSetting(),
    )
  ];
}
