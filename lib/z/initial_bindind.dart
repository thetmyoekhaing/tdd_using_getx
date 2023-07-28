import 'package:get/get.dart';
import 'package:getx_testing/repo_impl/get_joke.dart';
import 'package:getx_testing/repo_impl/get_quote.dart';
import 'package:getx_testing/repo_impl/get_riddle.dart';
import 'package:getx_testing/screens/home_controller.dart';

class InititalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetQuoteImpl(), fenix: true);
    Get.lazyPut(() => GetJokeImpl(), fenix: true);
    Get.lazyPut(() => GetRiddleImpl(), fenix: true);

    Get.lazyPut(() => HomeController());
  }
}
