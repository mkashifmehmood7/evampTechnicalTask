import 'package:evamp_task_app/model/profile_model.dart';
import 'package:evamp_task_app/preferences.dart';
import 'package:get/get.dart';
import '../../../../routes/app_pages.dart';

class ProfileController extends GetxController {

  ProfileModel? profileData;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    isLoading(true);
    onGetProfile();
    super.onInit();
  }


  onGetProfile() async {
    profileData = await Preferences.getUserProfile();
    isLoading(false);
  }

  void onExploreMore() {
    Get.toNamed(Routes.products);
  }
  void onSignOut() {
    Preferences.clearKey(Preferences.kToken);
    Get.offAllNamed(Routes.login);
  }
}
