import 'package:evamp_task_app/network/api_client.dart';

import '../model/profile_model.dart';

abstract class SystemApiService {
  static Future<ApiResponse<ProfileModel>> onLogin(ApiPayload req) {
    return ApiClient.instance.callApi(
      endPoint: 'demo_es/authenticate',
      req: req,
      fromJson: ProfileModel.fromJson,
    );
  }
}
