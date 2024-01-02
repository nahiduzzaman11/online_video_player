import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:online_video_player/core/helper/date_converter_helper.dart';
import 'package:online_video_player/utils/app_colors.dart';
import 'package:online_video_player/view/screens/home/model/trending_video_model.dart';
import 'package:online_video_player/view/screens/video_play/inner_widgets/comment_section.dart';
import 'package:online_video_player/view/screens/video_play/inner_widgets/likes_section.dart';
import 'package:online_video_player/view/widgets/custom_text/custom_text.dart';
import 'package:video_player/video_player.dart';

class OnlineVideoPlay extends StatefulWidget {
  const OnlineVideoPlay({super.key});

  @override
  State<OnlineVideoPlay> createState() => _VideoPlayState();
}

class _VideoPlayState extends State<OnlineVideoPlay> {
  late VideoPlayerController videoPlayerController;

  List<Result> result = Get.arguments[0];
  int index = Get.arguments[1];

  @override
  void initState() {
    videoPlayerController =
        VideoPlayerController.network("${result[index].manifest}")
          ..initialize().then((value) {
            setState(() {});
          });
    super.initState();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return SafeArea(
      top: false,
      child: Scaffold(
        extendBody: true,
        backgroundColor: AppColors.surface,
        body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 24.h),
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              videoPlayerController.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: videoPlayerController.value.aspectRatio,
                      child: Stack(
                        children: [
                          VideoPlayer(videoPlayerController),
                          videoPlayerController.value.isPlaying != true
                          ? Align(
                            alignment: Alignment.center,
                            child: GestureDetector(
                              onTap: () => videoPlayerController.play(),
                              child: Icon(Icons.play_arrow, color: AppColors.rgb, size: 100.h),
                            ),
                          )
                          : const SizedBox(),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              padding:
                                  EdgeInsets.symmetric(horizontal: 4.w),
                              margin:
                                  EdgeInsets.only(right: 8.w, bottom: 8.h),
                              decoration: BoxDecoration(
                                color: AppColors.black,
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                              child: CustomText(
                                  text: "${result[index].duration}",
                                  fontSize: 12.spMin,
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: GestureDetector(
                              onTap: () => Get.back(),
                              child: Container(
                                width: 32.w,
                                height: 32.h,
                                padding: EdgeInsets.symmetric(horizontal: 4.w),
                                margin: EdgeInsets.only(left: 12.w, top: 12.h),
                                decoration: BoxDecoration(
                                  color: AppColors.rgb,
                                  borderRadius: BorderRadius.circular(4.r),
                                ),
                                child: const Icon(Icons.arrow_back_outlined, color: AppColors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(
                      height: 190,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: CachedNetworkImageProvider(
                                  "${result[index].thumbnail}"),
                              fit: BoxFit.fill)),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 4.w),
                              margin: EdgeInsets.only(right: 8.w, bottom: 8.h),
                              decoration: BoxDecoration(
                                color: AppColors.black,
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                              child: CustomText(
                                  text: "${result[index].duration}",
                                  fontSize: 12.spMin,
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: GestureDetector(
                              onTap: () => Get.back(),
                              child: Container(
                                width: 32.w,
                                height: 32.h,
                                padding: EdgeInsets.symmetric(horizontal: 4.w),
                                margin: EdgeInsets.only(left: 12.w, top: 12.h),
                                decoration: BoxDecoration(
                                  color: AppColors.rgb,
                                  borderRadius: BorderRadius.circular(4.r),
                                ),
                                child: const Icon(Icons.arrow_back_outlined,
                                    color: AppColors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "${result[index].title}",
                      maxLines: 2,
                      color: AppColors.gray900,
                      fontSize: 14.spMin,
                      fontWeight: FontWeight.w600,
                      title: true,
                      top: 16.h,
                      bottom: 8.h,
                      textAlign: TextAlign.start,
                    ),
                    Row(
                      children: [
                        CustomText(
                            text: "${result[index].viewers} views",
                            color: AppColors.gray600,
                            fontSize: 12.spMin),
                        CustomText(
                            text: ".",
                            color: AppColors.gray600,
                            fontSize: 12.spMin,
                            left: 4.w,
                            right: 4.w),
                        CustomText(
                          text: DateConverter.convertToString(
                              "${result[index].dateAndTime}"),
                          color: AppColors.gray600,
                          fontSize: 12.spMin,
                        ),
                      ],
                    ),
                    const LikesSection(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Row(
                            children: [
                              Container(
                                height: 40.h,
                                width: 40.h,
                                margin: EdgeInsets.only(right: 8.w),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: CachedNetworkImageProvider(
                                          "${result[index].channelImage}"),
                                      fit: BoxFit.fill),
                                ),
                              ),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text: "${result[index].channelName}",
                                      fontSize: 14.spMin,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.gray900,
                                      textAlign: TextAlign.start,
                                    ),
                                    CustomText(
                                        text: "${result[index].channelSubscriber} Subscribers",
                                        fontSize: 12.spMin,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.gray600),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 24.w),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.w, vertical: 6.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.r),
                              color: AppColors.blue),
                          child: Row(
                            children: [
                              Icon(Icons.add, size: 16.h, color: AppColors.white),
                              CustomText(
                                  text: "Subscribe".tr,
                                  fontSize: 12.spMin,
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w500,
                                  left: 8.w)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const CommentSection()
            ],
          ),
        ),
      ),
    );
  }
}
