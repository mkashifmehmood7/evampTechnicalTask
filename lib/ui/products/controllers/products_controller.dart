import 'package:evamp_task_app/preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../routes/app_pages.dart';
import '../../../model/item_model.dart';
import '../../../network/mock_system_api_service.dart';

class ProductsController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<ItemModel> items = <ItemModel>[].obs;

  @override
  void onInit() {
    onGetProducts();
    super.onInit();
  }

  void onExploreMore() {
    Get.toNamed(Routes.profile);
  }

  Future<void> onGetProducts() async {
    isLoading(true);

    final userProfile = await Preferences.getUserProfile();

    final resp = await MockSystemApiService.onMockProduct(
      {"email": userProfile!.email, "token": userProfile.token!},
    );
    if (resp == null) {
      return;
    }
    if (resp.status == 'success') {
      items.addAll(resp.items!);
      isLoading(false);
    } else {
      isLoading(false);
      debugPrint('=====api=====fail');
    }
  }
}
