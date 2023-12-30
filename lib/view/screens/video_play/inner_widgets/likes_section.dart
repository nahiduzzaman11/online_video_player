import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:online_video_player/utils/app_colors.dart';
import 'package:online_video_player/utils/app_icons.dart';
import 'package:online_video_player/view/widgets/custom_text/custom_text.dart';
import 'package:online_video_player/view/widgets/image/custom_image.dart';

class LikesSection extends StatelessWidget {
  const LikesSection({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16.h),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 6.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(color: AppColors.gray300,style: BorderStyle.solid,width: 1)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.favorite_border,size: 24.h,color: AppColors.gray600),
                    CustomText(text: "Mash Allah (12K)".tr,fontSize: 12.spMin,fontWeight: FontWeight.w500,color: AppColors.gray600,maxLines: 1),
                  ],
                ),
              ),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 6.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(color: AppColors.gray300,style: BorderStyle.solid,width: 1)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.thumb_up_alt_outlined,size: 24.h,color: AppColors.gray600),
                    CustomText(text: "Like (12K)".tr,fontSize: 12.spMin,fontWeight: FontWeight.w500,color: AppColors.gray600,),
                  ],
                ),
              ),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 6.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(color: AppColors.gray300,style: BorderStyle.solid,width: 1)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomImage(imageSrc: AppIcons.shareIcon,size: 24.h,imageColor: AppColors.gray600),
                    CustomText(text: "SHARE".tr,fontSize: 12.spMin,fontWeight: FontWeight.w500,color: AppColors.gray600),
                  ],
                ),
              ),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 6.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(color: AppColors.gray300,style: BorderStyle.solid,width: 1)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomImage(imageSrc: AppIcons.reportIcon,size: 24.h,imageColor: AppColors.gray600),
                    CustomText(text: "REPORT".tr,fontSize: 12.spMin,fontWeight: FontWeight.w500,color: AppColors.gray600,),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 24.h),
      ],
    );
  }
}
