import 'package:get/get.dart';
import '../../../../routes/app_pages.dart';
import '../../../network/api_client.dart';
import '../../../preferences.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _onStartUp();
  }

  void _onStartUp() async {
    ApiClient.create();

    await 3.delay();

    final token = await Preferences.getKey(Preferences.kToken);
    if (token == null) {
      Get.offAllNamed(Routes.login);
    } else {
      Get.offAllNamed(Routes.profile);
    }
  }
}
