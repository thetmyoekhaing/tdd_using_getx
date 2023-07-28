import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_testing/RANDOM/quote/controller/quote_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class QuotePage extends GetView<QuoteController> {
  const QuotePage({super.key});

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
                                "assets/start_quotation.png",
                                width: 50,
                                height: 50,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                controller.quote.value!.quote.toString(),
                                style: GoogleFonts.eduSaBeginner(
                                    color: Colors.teal,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Category - ${controller.quote.value!.category.toUpperCase()}",
                                style: GoogleFonts.eduSaBeginner(
                                    color: Colors.grey.shade700,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 15),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Image.asset(
                                  "assets/end_quotation.png",
                                  width: 50,
                                  height: 50,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  "- ${controller.quote.value!.author}",
                                  style: GoogleFonts.greatVibes(
                                      color: Colors.grey.shade700,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 3),
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
                              onPressed: () => controller.getQuote(),
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
