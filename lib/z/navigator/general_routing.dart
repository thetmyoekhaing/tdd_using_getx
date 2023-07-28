import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_testing/RANDOM/joke/view/joke_page.dart';
import 'package:getx_testing/RANDOM/riddle/view/riddle_page.dart';
import 'package:getx_testing/screens/home_screen.dart';

GetPageRoute? generalRouting(RouteSettings settings) {
  switch (settings.name) {
    case HomeScreen.name:
      return GetPageRoute(
        settings: settings,
        page: () => const HomeScreen(),
      );
    case JokePage.name:
      return GetPageRoute(
        settings: settings,
        page: () => const JokePage(),
      );
    case RiddlePage.name:
      return GetPageRoute(
        settings: settings,
        page: () => const RiddlePage(),
      );

    default:
      return GetPageRoute(
        settings: settings,
        page: () => const HomeScreen(),
      );
  }
}
