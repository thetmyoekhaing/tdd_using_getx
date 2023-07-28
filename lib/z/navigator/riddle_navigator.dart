import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_testing/RANDOM/riddle/controller/riddle_controller.dart';
import 'package:getx_testing/RANDOM/riddle/view/riddle_page.dart';
import 'package:getx_testing/z/navigator/general_routing.dart';

class RiddleNavigator extends StatelessWidget {
  const RiddleNavigator({super.key});
  static int navigationKey = 3;
  static GlobalKey<NavigatorState>? navigatorState =
      Get.nestedKey(navigationKey);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorState,
      onGenerateRoute: (settings) {
        if (settings.name == "/") {
          return GetPageRoute(
            settings: settings,
            page: () => const RiddlePage(),
            binding: RiddleControllerBinding(),
          );
        }
        return generalRouting(settings);
      },
    );
  }
}
