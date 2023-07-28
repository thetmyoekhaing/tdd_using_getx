import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_testing/screens/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  static const String name = 'home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
          backgroundColor: Colors.grey,
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.teal,
            items: controller.items,
            currentIndex: controller.currentItem.value,
            onTap: (idx) => controller.onTap(idx),
          ),
          body: controller.widgets[controller.currentItem.value]);
    });
  }
}


// Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Obx(() {
//                 return SizedBox(
//                     width: Get.width,
//                     child: Container(
//                         decoration: BoxDecoration(
//                             color: Colors.grey.shade400,
//                             borderRadius: BorderRadius.circular(20)),
//                         padding: const EdgeInsets.all(20),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Image.asset(
//                               "assets/start_quotation.png",
//                               width: 50,
//                               height: 50,
//                             ),
//                             const SizedBox(
//                               height: 10,
//                             ),
//                             Text(
//                               controller.quote.value!.quote.toString(),
//                               style: GoogleFonts.eduSaBeginner(
//                                   color: Colors.teal,
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                             const SizedBox(
//                               height: 10,
//                             ),
//                             Text(
//                               "Category - ${controller.quote.value!.category.toUpperCase()}",
//                               style: GoogleFonts.eduSaBeginner(
//                                   color: Colors.grey.shade700,
//                                   fontWeight: FontWeight.w600,
//                                   fontStyle: FontStyle.italic,
//                                   fontSize: 15),
//                             ),
//                             const SizedBox(
//                               height: 10,
//                             ),
//                             Align(
//                               alignment: Alignment.bottomRight,
//                               child: Image.asset(
//                                 "assets/end_quotation.png",
//                                 width: 50,
//                                 height: 50,
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 10,
//                             ),
//                             Align(
//                               alignment: Alignment.bottomRight,
//                               child: Text(
//                                 "- ${controller.quote.value!.author}",
//                                 style: GoogleFonts.eduSaBeginner(
//                                     color: Colors.grey.shade700,
//                                     fontSize: 20,
//                                     fontStyle: FontStyle.italic),
//                               ),
//                             ),
//                           ],
//                         )));
//               }),
//               const SizedBox(
//                 height: 20,
//               ),
//               Row(
//                 children: [
//                   Expanded(
//                     child: ElevatedButton(
//                       onPressed: () => controller.getQuote(),
//                       style: ElevatedButton.styleFrom(
//                         minimumSize: Size(Get.width, 40),
//                         backgroundColor: Colors.grey.shade400,
//                         foregroundColor: Colors.teal,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                       child: const Text("Generate"),
//                     ),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
