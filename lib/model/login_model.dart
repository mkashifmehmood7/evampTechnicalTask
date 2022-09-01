import 'dart:convert';

import 'package:evamp_task_app/model/profile_model.dart';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  final String? status;
  final ProfileModel? userInfo;

  LoginModel(
    this.status,
    this.userInfo,
  );

  static LoginModel fromJson(Map<String, dynamic> resp) {
    return LoginModel(
      resp['status'] as String?,
      resp['userInfo'] == null ? null : ProfileModel.fromJson(resp['userInfo']),
    );
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "userInfo": userInfo,
      };
}
