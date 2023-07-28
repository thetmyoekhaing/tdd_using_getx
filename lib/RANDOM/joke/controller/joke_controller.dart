import 'package:get/get.dart';
import 'package:getx_testing/RANDOM/joke/model/joke_model.dart';
import 'package:getx_testing/repo_impl/get_joke.dart';
import 'package:getx_testing/usecases/get_joke_usecase.dart';

class JokeController extends GetxController {
  final GetJokeUseCase _usecase;
  final Rx<JokeModel?> _joke = Rx<JokeModel?>(null);
  final RxBool isLoading = false.obs;

  Rx<JokeModel?> get joke => _joke;

  JokeController(this._usecase);

  Future<void> getJoke() async {
    isLoading.value = true;
    final data = await _usecase();

    // print(data);
    data.fold(
      (leftValue) {
        Get.showSnackbar(GetSnackBar(
          message: leftValue.toString(),
        ));
      },
      (rightValue) {
        _joke.value = rightValue;
        isLoading.value = false;
      },
    );
  }

  @override
  Future<void> onInit() async {
    await getJoke();
    super.onInit();
  }
}

class JokeControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetJokeUseCase(Get.find<GetJokeImpl>()));
    Get.lazyPut(() => JokeController(Get.find<GetJokeUseCase>()));
  }
}
