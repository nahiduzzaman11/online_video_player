import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:online_video_player/core/global/api_response_method.dart';
import 'package:online_video_player/core/global/api_response_model.dart';
import 'package:online_video_player/core/helper/shear_preference_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  SharedPreferences sharedPreferences;

  ApiService({required this.sharedPreferences});

  Future<ApiResponseModel> request(
      String uri, String method, Map<String, dynamic>? params,
      {bool passHeader = false}) async {
    Uri url = Uri.parse(uri);
    http.Response response;

    try {
      if (method == ApiResponseMethod.postMethod) {
        if (passHeader) {
          initToken();
          var body= jsonEncode(params);

          response = await http.post(url, body: body, headers: {
            "Content-Type": "application/json",
            "Authorization": "$tokenType $token",
          });
        } else {
          response = await http.post(url, body: params);
        }
      }
      else {
        if (passHeader) {
          initToken();
          response = await http.get(url, headers: {
            "Content-Type": "application/json",
            "Authorization": "$tokenType $token",
          });
        } else {
          response = await http.get(url);
        }
      }

      if (kDebugMode) {
        print(url.toString());
      }
      if (kDebugMode) {
        print(response.body);
      }

      if (response.statusCode == 200) {
        return ApiResponseModel(200, 'Success', response.body);
      } else if (response.statusCode == 401) {
        return ApiResponseModel(401, "Unauthorized".tr, response.body);
      } else if (response.statusCode == 201) {
        return ApiResponseModel(201, 'Success', response.body);
      } else if (response.statusCode == 500) {
        return ApiResponseModel(500, "Internal Server Error".tr, response.body);
      } else {
        return ApiResponseModel(499, "Something went wrong".tr, response.body);
      }
    } catch (e) {
      return ApiResponseModel(499, "Client Closed Request".tr, '');
    }
  }

  String token = '';
  String tokenType = '';

  initToken() {
    if (sharedPreferences.containsKey(SharedPreferenceHelper.accessTokenKey)) {
      String? t = sharedPreferences.getString(SharedPreferenceHelper.accessTokenKey);
      String? tType = sharedPreferences.getString(SharedPreferenceHelper.accessTokenType);
      token = t ?? '';
      tokenType = tType ?? 'Bearer';
    } else {
      token = '';
      tokenType = 'Bearer';
    }
  }
}
