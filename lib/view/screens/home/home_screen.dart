import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:online_video_player/core/helper/date_converter_helper.dart';
import 'package:online_video_player/core/route/app_route.dart';
import 'package:online_video_player/core/service/api_service.dart';
import 'package:online_video_player/utils/app_colors.dart';
import 'package:online_video_player/view/screens/home/controller/trending_video_list_controller.dart';
import 'package:online_video_player/view/screens/home/repo/trending_video_repo.dart';
import 'package:online_video_player/view/widgets/custom_text/custom_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    Get.put(ApiService(sharedPreferences: Get.find()));
    Get.put(TrendingVideoRepo(apiService: Get.find()));
    var controller = Get.put(TrendingVideoListController(trendingVideoRepo: Get.find()));
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.fetchVideoList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return SafeArea(
      top: false,
      child: Scaffold(
        extendBody: true,
        backgroundColor: AppColors.surface,
        appBar: AppBar(
          backgroundColor: AppColors.surface,
          elevation: 0,
          title: CustomText(
            fontSize: 20.spMin,
            color: AppColors.gray900,
            text: "Trending Videos".tr,
            fontWeight: FontWeight.w700,
          ),
        ),
        body: GetBuilder<TrendingVideoListController>(
          builder: (controller) {
            if(controller.isLoading){
              const Center(child: CircularProgressIndicator());
            }
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              physics: const BouncingScrollPhysics(),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.trendingVideoModel.results?.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoute.onlineVideoPlay);
                    },
                    child: Container(
                      color: AppColors.white,
                      margin: EdgeInsets.only(bottom: 18.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 190,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                image: DecorationImage(image: CachedNetworkImageProvider("${controller.trendingVideoModel.results?[index].thumbnail}"),fit: BoxFit.fill)
                            ),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 4.w),
                                margin: EdgeInsets.only(right: 8.w,bottom: 8.h),
                                decoration: BoxDecoration(
                                  color: AppColors.black,
                                  borderRadius: BorderRadius.circular(4.r),
                                ),child: CustomText(text: "${controller.trendingVideoModel.results?[index].duration}",fontSize: 12.spMin,color: AppColors.white,fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16,right: 8,top: 16,bottom: 16),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 40,width: 40,
                                  margin: const EdgeInsets.only(right: 12),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(image:
                                      CachedNetworkImageProvider("${controller.trendingVideoModel.results?[index].channelImage}"),
                                          fit: BoxFit.fill)
                                  ),
                                ),
                                Flexible(
                                  child: Row(
                                    children: [
                                      Flexible(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            CustomText(text: "${controller.trendingVideoModel.results?[index].title}",maxLines: 2,textAlign: TextAlign.start,title: true,color: AppColors.black,fontSize: 14.spMin),
                                            Row(
                                              children: [
                                                CustomText(text: "${controller.trendingVideoModel.results?[index].viewers} views",color: AppColors.gray600,fontSize: 12.spMin),
                                                CustomText(text: ".",color: AppColors.gray600,fontSize: 12.spMin,left: 4.w,right: 4.w),
                                                CustomText(text: DateConverter.convertToString("${controller.trendingVideoModel.results?[index].createdAt}"),color: AppColors.gray600,fontSize: 12.spMin),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Icon(Icons.more_vert_rounded,size: 24.h,color: AppColors.gray400)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
