import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:online_video_player/core/helper/date_converter_helper.dart';
import 'package:online_video_player/core/route/app_route.dart';
import 'package:online_video_player/utils/app_colors.dart';
import 'package:online_video_player/view/widgets/custom_text/custom_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return SafeArea(
      top: false,
      child: Scaffold(
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
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          physics: const BouncingScrollPhysics(),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoute.videoPlay);
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
                        decoration: const BoxDecoration(
                            image: DecorationImage(image: CachedNetworkImageProvider("https://mahfilbucket.s3.amazonaws.com/media_test/video_content_thumbnail/mob_thumbnail_U9CYT0rvkv_1920x1080_PNG.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIA5G25YRBXUVQTFY73%2F20231230%2Fap-south-1%2Fs3%2Faws4_request&X-Amz-Date=20231230T180059Z&X-Amz-Expires=604800&X-Amz-SignedHeaders=host&X-Amz-Signature=b1ade780139f7d384ebbbe4fbfdaad470036633e8d4081287e2f2f2cb7d6a1c4"),fit: BoxFit.fill)
                        ),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 4.w),
                            margin: EdgeInsets.only(right: 8.w,bottom: 8.h),
                            decoration: BoxDecoration(
                              color: AppColors.black,
                              borderRadius: BorderRadius.circular(4.r),
                            ),child: CustomText(text: "3:40",fontSize: 12.spMin,color: AppColors.white,fontWeight: FontWeight.w500),
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
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(image:
                                  CachedNetworkImageProvider("https://mahfilbucket.s3.amazonaws.com/media_test/video_content_thumbnail/mob_thumbnail_U9CYT0rvkv_1920x1080_PNG.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIA5G25YRBXUVQTFY73%2F20231230%2Fap-south-1%2Fs3%2Faws4_request&X-Amz-Date=20231230T180059Z&X-Amz-Expires=604800&X-Amz-SignedHeaders=host&X-Amz-Signature=b1ade780139f7d384ebbbe4fbfdaad470036633e8d4081287e2f2f2cb7d6a1c4"),
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
                                        CustomText(text: "তাকদীর বা ভাগ্য কি পরিবর্তন করা যায়_ আবু ত্ব-হা মুহাম্মদ আদনান __ Abu Toha Muhammad Adnan",maxLines: 2,textAlign: TextAlign.start,title: true,color: AppColors.black,fontSize: 14.spMin),
                                        Row(
                                          children: [
                                            CustomText(text: "40 views",color: AppColors.gray600,fontSize: 12.spMin),
                                            CustomText(text: ".",color: AppColors.gray600,fontSize: 12.spMin,left: 4.w,right: 4.w),
                                            CustomText(text: DateConverter.convertToString("2023-12-26T15:17:37.213619+06:00"),color: AppColors.gray600,fontSize: 12.spMin),
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
        ),
      ),
    );
  }
}
