import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_testing/RANDOM/riddle/controller/riddle_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class RiddlePage extends GetView<RiddleController> {
  static const String name = 'riddle_screen';

  const RiddlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: controller.isLoading.value
                ? const CircularProgressIndicator()
                : SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: Get.width,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(20)),
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  "assets/question.png",
                                  width: 50,
                                  height: 50,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "${controller.riddle.value!.title.toString()} (?)",
                                  style: GoogleFonts.eduSaBeginner(
                                      color: Colors.teal,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  controller.riddle.value!.question.toString(),
                                  style: GoogleFonts.eduSaBeginner(
                                      color: Colors.teal,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                controller.isShowed.value
                                    ? Text(
                                        "Answer - ${controller.riddle.value!.answer.toString()}",
                                        style: GoogleFonts.eduSaBeginner(
                                            color: Colors.teal,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      )
                                    : Container(),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Image.asset(
                                    "assets/question.png",
                                    width: 50,
                                    height: 50,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: [
                            !controller.isShowed.value
                                ? ElevatedButton(
                                    onPressed: () => controller.showOnTap(),
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: Size(Get.width, 40),
                                      backgroundColor: Colors.grey.shade200,
                                      foregroundColor: Colors.teal,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    child: const Text("Show Answer"),
                                  )
                                : Container(),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () => controller.getRiddle(),
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(Get.width, 40),
                                backgroundColor: Colors.grey.shade200,
                                foregroundColor: Colors.teal,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Text("Generate"),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
          ),
        ),
      );
    });
  }
}
