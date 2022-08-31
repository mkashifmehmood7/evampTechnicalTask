import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

typedef ModelFromJson = dynamic Function(Map<String, dynamic> resp);
typedef ApiPayload = Map<String, dynamic>;

class ApiClient {
  static ApiClient? _instance;

  String mBaseUrl;

  ApiClient(
    this.mBaseUrl,
  );

  static ApiClient get instance => _instance!;

  static ApiClient create() {
    String baseUrl = 'http://115.186.58.59:8080/';
    _instance = ApiClient(baseUrl);

    return _instance!;
  }

  Future<ApiResponse<T>> callApi<T>({
    required String endPoint,
    ApiPayload? req,
    required ModelFromJson fromJson,
    bool? isGetAPI = false,
  }) async {
    String url = '$mBaseUrl/$endPoint';

    String payload = req == null ? '{}' : jsonEncode(req);

    debugPrint('Request: URL --> $url ----- $payload');

    final http.Response response;

    try {
      if (isGetAPI!) {
        response = await http.get(Uri.parse(url));
      } else {
        response = await http
            .post(
              Uri.parse(url),
              body: payload,
            )
            .timeout(const Duration(seconds: 30));
      }
    } on TimeoutException catch (e) {
      return ApiResponse(null, <String, dynamic>{
        'Status': 'Error',
        'ErrorMessage': e.message,
        'ErrorCode': -1,
      });
    } on SocketException catch (e) {
      return ApiResponse(null, <String, dynamic>{
        'Status': 'Error',
        'ErrorMessage': e.message,
        'ErrorCode': -1,
      });
    } catch (e) {
      return ApiResponse(null, <String, dynamic>{
        'Status': 'Error',
        'ErrorMessage': e,
        'ErrorCode': -1,
      });
    }

    debugPrint('Response: URL --> $url ----- ${response.body}');

    return compute(parseApiResponse, {
      'response': response.body,
      'code': response.statusCode,
      'fromJson': fromJson,
    });
  }
}

ApiResponse<T> parseApiResponse<T>(Map<String, dynamic> parameters) {
  final body = parameters['response'];
  final statusCode = parameters['code'];
  final fromJson = parameters['fromJson'];

  Map<String, dynamic> parsed = {};

  try {
    parsed = jsonDecode(body)?.cast<String, dynamic>();
  } on FormatException {
    return ApiResponse(null, <String, dynamic>{
      'Status': 'Error',
      'ErrorMessage': body,
      'ErrorCode': statusCode,
    });
  }

  if (statusCode != 200) {
    return ApiResponse(null, parsed);
  }

  return ApiResponse<T>.fromMap(parsed, fromJson, statusCode);
}

class ApiResponse<T> {
  final T? data;

  ApiResponse(this.data, Map<String, dynamic> resp);

  factory ApiResponse.fromMap(
      Map<String, dynamic> resp, ModelFromJson fromJson, int statusCode) {
    if (statusCode != 200) {
      return ApiResponse(null, resp);
    }

    final dt = resp.cast<String, dynamic>();
    return ApiResponse(fromJson(dt), resp);
  }
}
