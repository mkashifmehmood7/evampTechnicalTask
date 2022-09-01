import 'package:evamp_task_app/network/api_client.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../model/login_model.dart';
import '../model/product_model.dart';
import '../model/profile_model.dart';

abstract class MockSystemApiService {
  static Future<LoginModel?> onMockLogin(ApiPayload req) async {
    await Future.delayed(const Duration(seconds: 2));
    return loginModelFromJson(await decodeMockJson('profile'));
  }

  static Future<ProductModel?> onMockProduct(ApiPayload req) async {
    await Future.delayed(const Duration(seconds: 2));
    return productModelFromJson(await decodeMockJson('products'));
  }

  static Future<String> decodeMockJson(String endPoint) async {
    debugPrint("Rest API :: mock_responses/$endPoint.json");
    String response = await rootBundle.loadString(
      'mock_responses/$endPoint.json',
    );
    debugPrint("Response :: $response");
    return response;
  }
}
