import 'package:get/get.dart';
import 'package:getx_testing/RANDOM/riddle/model/riddle_model.dart';
import 'package:getx_testing/repo_impl/get_riddle.dart';
import 'package:getx_testing/usecases/get_riddle_usecase.dart';

class RiddleController extends GetxController {
  final GetRiddleUseCase _usecase;
  final Rx<RiddleModel?> _riddle = Rx<RiddleModel?>(null);
  final RxBool isLoading = true.obs;
  final RxBool isShowed = false.obs;

  Rx<RiddleModel?> get riddle => _riddle;

  RiddleController(this._usecase);

  Future<void> getRiddle() async {
    final data = await _usecase();

    // print(data);
    data.fold(
      (leftValue) {
        Get.showSnackbar(GetSnackBar(
          message: leftValue.toString(),
        ));
      },
      (rightValue) {
        isShowed.value = false;
        _riddle.value = rightValue;
        isLoading.value = false;
      },
    );
  }

  bool showOnTap() {
    return isShowed.value = true;
  }

  @override
  Future<void> onInit() async {
    await getRiddle();
    super.onInit();
  }
}

class RiddleControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetRiddleUseCase(Get.find<GetRiddleImpl>()));
    Get.lazyPut(() => RiddleController(Get.find<GetRiddleUseCase>()));
  }
}
