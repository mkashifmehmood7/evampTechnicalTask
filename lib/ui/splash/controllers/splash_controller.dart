import 'package:get/get.dart';
import '../../../../routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _onStartUp();
  }

  void _onStartUp() async {
    await 3.delay();

    Get.offAndToNamed(Routes.login);
  }
}
