import 'package:get/get.dart';
import '../../../../routes/app_pages.dart';

class ProductsController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  void onExploreMore() {
    Get.toNamed(Routes.profile);
  }
}
