import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_testing/RANDOM/quote/controller/quote_controller.dart';
import 'package:getx_testing/RANDOM/quote/view/quote_page.dart';
import 'package:getx_testing/z/navigator/general_routing.dart';

class QuoteNavigator extends StatelessWidget {
  const QuoteNavigator({super.key});
  static int navigationKey = 1;
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
            page: () => const QuotePage(),
            binding: QuoteControllerBinding(),
          );
        }
        return generalRouting(settings);
      },
    );
  }
}
