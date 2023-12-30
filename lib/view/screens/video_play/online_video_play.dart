import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:online_video_player/core/helper/date_converter_helper.dart';
import 'package:online_video_player/utils/app_colors.dart';
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
  final videoURL = "https://bycwknztmq.gpcdn.net/a80b4d4e-b023-4ad8-8ed7-7671f6b3018b/playlist.m3u8";
  late VideoPlayerController videoPlayerController;

  @override
  void initState() {
    videoPlayerController = VideoPlayerController.networkUrl(Uri(path: videoURL))..initialize().then((value) {
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
                  ? AspectRatio(aspectRatio: videoPlayerController.value.aspectRatio,child: VideoPlayer(videoPlayerController))
                  : const SizedBox(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "আরব নেতাদের যে ভুলে ফি*লি*স্তি*নের এই দুর্দাশা | আবু ত্বহা মুহাম্মদ আদনান",
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
                            text: "40 views",
                            color: AppColors.gray600,
                            fontSize: 12.spMin),
                        CustomText(
                            text: ".",
                            color: AppColors.gray600,
                            fontSize: 12.spMin,
                            left: 4.w,
                            right: 4.w),
                        CustomText(
                            text: DateConverter.convertToString("2023-12-26T15:17:37.213619+06:00"),
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
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: CachedNetworkImageProvider("https://mahfilbucket.s3.amazonaws.com/media_test/video_content_thumbnail/mob_thumbnail_U9CYT0rvkv_1920x1080_PNG.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIA5G25YRBXUVQTFY73%2F20231230%2Fap-south-1%2Fs3%2Faws4_request&X-Amz-Date=20231230T180059Z&X-Amz-Expires=604800&X-Amz-SignedHeaders=host&X-Amz-Signature=b1ade780139f7d384ebbbe4fbfdaad470036633e8d4081287e2f2f2cb7d6a1c4"),
                                        fit: BoxFit.fill)),
                              ),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text: "Mega Bangla Tv",
                                      fontSize: 14.spMin,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.gray900,
                                      textAlign: TextAlign.start,
                                    ),
                                    CustomText(
                                        text: "14 Subscribers",
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
                              Icon(Icons.add,
                                  size: 16.h, color: AppColors.white),
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
