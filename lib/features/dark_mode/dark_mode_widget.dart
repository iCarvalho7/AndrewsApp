import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';

class DarkModeButton extends StatefulWidget {
  const DarkModeButton({Key? key}) : super(key: key);

  @override
  _DarkModeButtonState createState() => _DarkModeButtonState();
}

class _DarkModeButtonState extends State<DarkModeButton> {
  RxBool isDarkModeEnabled = false.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => FlutterSwitch(
        activeToggleColor: Colors.white,
        activeIcon: const Icon(Icons.dark_mode),
        inactiveIcon: const Icon(Icons.wb_sunny),
        activeColor: const Color(0x22FFFFFF),
        inactiveColor: const Color(0xFF034B62),
        value: isDarkModeEnabled.value,
        onToggle: (active) {
          isDarkModeEnabled.value = active;
          _changeTheme();
        },
      ),
    );
  }

  void _changeTheme() async {
    Get.changeThemeMode(
        isDarkModeEnabled.value ? ThemeMode.dark : ThemeMode.light);
  }
}
