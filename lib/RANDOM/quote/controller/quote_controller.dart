import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_testing/RANDOM/quote/models/quote_model.dart';
import 'package:getx_testing/repo_impl/get_quote.dart';
import 'package:getx_testing/usecases/get_quote_usecase.dart';

class QuoteController extends GetxController {
  RxBool isLoading = false.obs;
  final GetQuoteUseCase _usecase;
  final Rx<QuoteModel?> _quote = Rx<QuoteModel?>(null);

  Rx<QuoteModel?> get quote => _quote;

  QuoteController(this._usecase);

  Future<void> getQuote() async {
    isLoading.value = true;
    final data = await _usecase();
    debugPrint(
        "--------------------- Hello from controller ------------------");

    // print(data);
    data.fold(
      (leftValue) {
        Get.showSnackbar(GetSnackBar(
          message: leftValue.toString(),
        ));
      },
      (rightValue) {
        _quote.value = rightValue;
        isLoading.value = false;
      },
    );
  }

  @override
  Future<void> onInit() async {
    await getQuote();
    super.onInit();
  }
}

class QuoteControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetQuoteUseCase(Get.find<GetQuoteImpl>()));
    Get.lazyPut(() => QuoteController(Get.find<GetQuoteUseCase>()));
  }
}
