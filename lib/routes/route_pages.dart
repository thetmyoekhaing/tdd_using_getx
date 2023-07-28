import 'package:get/route_manager.dart';
import 'package:getx_testing/screens/home_screen.dart';

class RoutePages {
  static final pages = [
    GetPage(name: "/", page: () => const HomeScreen()),
  ];
}
