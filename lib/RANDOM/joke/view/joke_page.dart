import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_testing/RANDOM/joke/controller/joke_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class JokePage extends GetView<JokeController> {
  static const String name = 'joke_screen';

  const JokePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: controller.isLoading.value
                ? const CircularProgressIndicator()
                : Column(
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
                                "assets/emoji.png",
                                width: 50,
                                height: 50,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                controller.joke.value!.joke.toString(),
                                style: GoogleFonts.eduSaBeginner(
                                    color: Colors.teal,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Image.asset(
                                  "assets/emoji.png",
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
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () => controller.getJoke(),
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
                          ),
                        ],
                      )
                    ],
                  ),
          ),
        ),
      );
    });
  }
}
