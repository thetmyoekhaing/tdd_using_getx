import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_testing/screens/home_screen.dart';
import 'package:getx_testing/z/initial_bindind.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      color: Colors.black,
      initialRoute: "/",
      initialBinding: InititalBinding(),
      getPages: [
        GetPage(
          name: "/",
          page: () => const HomeScreen(),
        )
      ],
    );
  }
}
