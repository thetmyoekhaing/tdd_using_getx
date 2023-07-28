import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_testing/RANDOM/joke/controller/joke_controller.dart';
import 'package:getx_testing/RANDOM/joke/view/joke_page.dart';
import 'package:getx_testing/z/navigator/general_routing.dart';

class JokeNavigator extends StatelessWidget {
  const JokeNavigator({super.key});
  static int navigationKey = 2;
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
            page: () => const JokePage(),
            binding: JokeControllerBinding(),
          );
        }
        return generalRouting(settings);
      },
    );
  }
}
