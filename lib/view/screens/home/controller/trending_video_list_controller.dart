import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_video_player/core/global/api_response_model.dart';
import 'package:online_video_player/view/screens/home/model/trending_video_model.dart';
import 'package:online_video_player/view/screens/home/repo/trending_video_repo.dart';

class TrendingVideoListController extends GetxController {

  TrendingVideoRepo trendingVideoRepo;
  TrendingVideoListController({required this.trendingVideoRepo});

  bool isLoading = false;
  List<Result> result = [];
  TextEditingController searchController = TextEditingController();
  TrendingVideoModel trendingVideoModel = TrendingVideoModel();

  Future<void> fetchVideoList({String ? pageNo = "1"}) async {

    isLoading = true;
    update();
    ApiResponseModel responseModel = await trendingVideoRepo.fetchVideoList(pageNo: pageNo);
    if (responseModel.statusCode == 200) {
      trendingVideoModel = TrendingVideoModel.fromJson(jsonDecode(responseModel.responseJson));
      result = [];
      trendingVideoModel.results?.forEach((element) {
        if(element.title != null){
          result.add(element);
        }
      });
      debugPrint("${responseModel.statusCode}");
      isLoading = false;
      update();
      debugPrint("The data----------------------${result.length}");
    }
    else{
      debugPrint("${responseModel.statusCode}, ${responseModel.message}");
    }
    isLoading = false;
    update();
  }

}