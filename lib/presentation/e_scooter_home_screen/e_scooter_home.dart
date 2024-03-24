import 'package:e_scooter/presentation/e_scooter_charger_page/e_scooter_charger.dart';
import 'package:e_scooter/presentation/e_scooter_reserve_page/e_scooter_reserve.dart';
import 'package:e_scooter/presentation/e_scooter_setting_page/e_scooter_setting.dart';
import 'package:e_scooter/widgets/e_scooter_app_bar/e_scooter_app_bar.dart';
import 'package:e_scooter/widgets/e_scooter_app_bar/e_scooter_appbar_title.dart';
import 'package:flutter/material.dart';
import 'package:e_scooter/core/e_scooter_export.dart';
import 'package:e_scooter/presentation/e_scooter_body_page/e_scooter_page.dart';
import 'controller/e_scooter_home_controller.dart';

class EScooterHome extends StatelessWidget {
  final controller = Get.put(EScooterHomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        backgroundColor: Colors.transparent,
        appBar: _buildAppBar(),
        body: Obx(() => IndexedStack(
          index: controller.currentIndex.value,
          children: [
            EScooterPage(),
            EScooterReserve(),
            EScooterCharger(),
            EScooterSetting(),
          ],
        )),
        bottomNavigationBar: _buildFloatingBar(),
      ),
    );
  }

  Widget _buildFloatingBar() =>  Obx(() => Container(
    height: Get.height * 0.124,
    decoration: EScooterDecoration.fillBottomNavContainer,
    child: FloatingNavbar(
      backgroundColor: theme.bottomNavigationBarTheme.backgroundColor,
      selectedBackgroundColor: appTheme.lime500,
      unselectedItemColor: Colors.white,
      selectedItemColor: theme.bottomNavigationBarTheme.selectedItemColor,
      onTap: (int val) => controller.changeTabIndex(val),
      currentIndex: controller.currentIndex.value,
      elevation: 0,
      fontSize: 14,
      items: [
        FloatingNavbarItem(icon: Icons.home_outlined, title: home),
        FloatingNavbarItem(icon: Icons.moped, title: reserve),
        FloatingNavbarItem(icon: Icons.pin_drop_outlined, title: charger),
        FloatingNavbarItem(icon: Icons.settings_outlined, title: setting),
      ],
    ),
  ));

  PreferredSizeWidget _buildAppBar() => EScooterAppBar(
    centerTitle: true,
    leading: Padding(
      padding: const EdgeInsets.only(left: 8, top: 20),
      child: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.menu,
          color: Colors.white,
          size: 30,
        ),
      ),
    ),
    title: EScooterAppbarTitle(
      text: lbl_eScooter.toUpperCase(),
      margin: EdgeInsets.only(left: 25.0, top: 25.0),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 8, top: 20),
        child: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.bluetooth,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
    ],
  );
}


