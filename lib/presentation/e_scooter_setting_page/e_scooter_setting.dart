import 'package:e_scooter/core/e_scooter_export.dart';
import 'package:flutter/material.dart';
import 'controller/e_scooter_setting_controller.dart';

class EScooterSetting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EScooterSettingController());
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25),
              _buildHeader(),
              _settings(controller)
            ],
          ),
        ),
      ),
    );
  }

  Widget _greetings() => Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(lbl_hello, style: theme.textTheme.displayLarge),
                Text(lbl_name, style: theme.textTheme.displayLarge),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.location_on_outlined,
                        size: 25, color: const Color(0xff16AB51)),
                    SizedBox(width: 5),
                    Text("Bhubaneswar",
                        style: theme.textTheme.titleSmall
                            ?.copyWith(color: Colors.white70)),
                    SizedBox(width: 12),
                    SizedBox(
                      width: 1,
                      height: 30,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white38,
                            borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.call_rounded,
                        size: 25, color: const Color(0xff16AB51)),
                    SizedBox(width: 5),
                    Text("8347424427",
                        style: theme.textTheme.titleSmall
                            ?.copyWith(color: Colors.white70)),
                  ],
                )
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Text(
              "Active",
              style: theme.textTheme.titleSmall?.copyWith(
                color: const Color(0xff16AB51),
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      );

  Widget _buildHeader() => Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: 100,
                width: 100,
                decoration: EScooterDecoration.fillProfileDecoration),
            SizedBox(width: 20),
            _greetings()
          ],
        ),
      );

  Widget _settings(EScooterSettingController controller) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Settings",
            style: EScooterTextStyles.displayLarge.copyWith(fontSize: 20),
          ),
          SizedBox(height: 15),
          _accountSettings(),
          SizedBox(height: 20),
          _batterySettings(),
          SizedBox(height: 20),
          _notificationSettings(controller),
          SizedBox(height: 20),
          _otherSettings(),
        ],
      ),
    );
  }

  Widget _accountSettings() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Icon(Icons.manage_accounts,
                size: 30, color: const Color(0xff16AB51)),
            SizedBox(width: 10),
            Text(
              "Account",
              style: EScooterTextStyles.headlineMedium
                  .copyWith(fontSize: 16, color: const Color(0xff16AB51)),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Edit Profile",
                      style: EScooterTextStyles.headlineMedium
                          .copyWith(fontSize: 16, color: Colors.white70)),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 20,
                    color: Colors.white70,
                  )
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Privacy",
                      style: EScooterTextStyles.headlineMedium
                          .copyWith(fontSize: 16, color: Colors.white70)),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 20,
                    color: Colors.white70,
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _notificationSettings(EScooterSettingController controller) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Icon(Icons.notifications_rounded,
                size: 30, color: const Color(0xff16AB51)),
            SizedBox(width: 10),
            Text(
              "Notification",
              style: EScooterTextStyles.headlineMedium
                  .copyWith(fontSize: 16, color: const Color(0xff16AB51)),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Notification",
                      style: EScooterTextStyles.headlineMedium
                          .copyWith(fontSize: 16, color: Colors.white70)),
                  Switch(
                      value: controller.notificationEnabled,
                      onChanged: (value) {
                        controller.toggleNotification(value);
                      },
                      activeColor: Colors.lime),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Updates",
                      style: EScooterTextStyles.headlineMedium
                          .copyWith(fontSize: 16, color: Colors.white70)),
                  Switch(
                    value: controller.updateEnabled,
                    onChanged: (value) {
                      controller.toggleUpdate(value);
                    },
                    activeColor: Colors.lime,
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _batterySettings() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Icon(Icons.charging_station_sharp,
                size: 30, color: const Color(0xff16AB51)),
            SizedBox(width: 10),
            Text(
              "Battery",
              style: EScooterTextStyles.headlineMedium
                  .copyWith(fontSize: 16, color: const Color(0xff16AB51)),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Charge",
                      style: EScooterTextStyles.headlineMedium
                          .copyWith(fontSize: 16, color: Colors.white70)),
                  Text("30 %",
                      style: EScooterTextStyles.headlineMedium
                          .copyWith(fontSize: 14, color: Colors.white70)),
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Status",
                      style: EScooterTextStyles.headlineMedium
                          .copyWith(fontSize: 16, color: Colors.white70)),
                  Text("Active",
                      style: EScooterTextStyles.headlineMedium.copyWith(
                          fontSize: 14, color: const Color(0xff16AB51))),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _otherSettings() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Icon(Icons.settings_sharp,
                size: 30, color: const Color(0xff16AB51)),
            SizedBox(width: 10),
            Text(
              "Others",
              style: EScooterTextStyles.headlineMedium
                  .copyWith(fontSize: 16, color: const Color(0xff16AB51)),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Locate Me",
                      style: EScooterTextStyles.headlineMedium
                          .copyWith(fontSize: 16, color: Colors.white70)),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 20,
                    color: Colors.white70,
                  )
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Charging Station",
                      style: EScooterTextStyles.headlineMedium
                          .copyWith(fontSize: 16, color: Colors.white70)),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 20,
                    color: Colors.white70,
                  )
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Dark Mode",
                      style: EScooterTextStyles.headlineMedium
                          .copyWith(fontSize: 16, color: Colors.white70)),
                  Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        border: Border.all(color: const Color(0xff16AB51), width: 2),
                        borderRadius: BorderRadius.circular(8)),
                  )
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Language",
                      style: EScooterTextStyles.headlineMedium
                          .copyWith(fontSize: 16, color: Colors.white70)),
                  Text("English",
                      style: EScooterTextStyles.headlineMedium
                          .copyWith(fontSize: 14, color: Colors.white70)),
                ],
              ),
              SizedBox(height: 25),
              Text("Logout",
                  style: EScooterTextStyles.headlineMedium
                      .copyWith(fontSize: 16, color: Colors.white)),
            ],
          ),
        )
      ],
    );
  }
}
