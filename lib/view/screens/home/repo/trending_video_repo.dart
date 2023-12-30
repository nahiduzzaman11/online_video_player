import 'package:flutter/widgets.dart';
import 'package:online_video_player/core/global/api_response_method.dart';
import 'package:online_video_player/core/global/api_response_model.dart';
import 'package:online_video_player/core/global/api_url.dart';
import 'package:online_video_player/core/service/api_service.dart';

class TrendingVideoRepo {
  ApiService apiService;
  TrendingVideoRepo({required this.apiService});

  Future<ApiResponseModel> fetchVideoList() async {

    String uri = "${ApiUrl.baseUrl}${ApiUrl.videoList}?page=1";
    debugPrint("URl=========>>$uri");
    String requestMethod = ApiResponseMethod.getMethod;

    ApiResponseModel responseModel = await apiService.request(uri, requestMethod, null);

    return responseModel;
  }
}