import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_video_player/utils/app_colors.dart';
import 'package:online_video_player/utils/app_icons.dart';
import 'package:online_video_player/view/widgets/custom_text/custom_text.dart';
import 'package:online_video_player/view/widgets/image/custom_image.dart';
import 'package:online_video_player/view/widgets/textfield/custom_text_field.dart';

class CommentSection extends StatelessWidget {
  const CommentSection({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16.h),
        const Divider(height: 1, color: AppColors.gray300),
        SizedBox(height: 16.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                      text: "Comments   7.5K",
                      fontSize: 12.spMin,
                      fontWeight: FontWeight.w400,
                      color: AppColors.gray600),
                  const CustomImage(
                      imageSrc: AppIcons.commentIcon,
                      size: 14,
                      imageType: ImageType.svg,
                      imageColor: AppColors.gray600)
                ],
              ),
              SizedBox(height: 8.h),
              CustomTextField(
                hintText: "Add Comment".tr,
                hintStyle: GoogleFonts.poppins(
                  fontSize: 12.spMin,
                  fontWeight: FontWeight.w500,
                  color: AppColors.gray500,
                ),
              ),
              SizedBox(height: 16.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 32.h,width: 32.w,
                    margin: EdgeInsets.only(right: 8.w),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(image: CachedNetworkImageProvider("https://mahfilbucket.s3.amazonaws.com/media_test/video_content_thumbnail/mob_thumbnail_U9CYT0rvkv_1920x1080_PNG.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIA5G25YRBXUVQTFY73%2F20231230%2Fap-south-1%2Fs3%2Faws4_request&X-Amz-Date=20231230T180059Z&X-Amz-Expires=604800&X-Amz-SignedHeaders=host&X-Amz-Signature=b1ade780139f7d384ebbbe4fbfdaad470036633e8d4081287e2f2f2cb7d6a1c4"),
                            fit: BoxFit.fill)
                    ),
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            CustomText(text: "Fahmida khanom",fontSize: 12.spMin,fontWeight: FontWeight.w500,color: AppColors.gray600),
                            CustomText(text: "2 days ago",fontSize: 8.spMin,fontWeight: FontWeight.w400,color: AppColors.gray600,left: 12.w),
                          ],
                        ),
                        CustomText(text: "হুজুরের বক্তব্য গুলো ইংরেজি তে অনুবাদ করে সারা পৃথিবীর মানুষদের কে শুনিয়ে দিতে হবে। কথা গুলো খুব দামি",top: 8.h,title: true,
                            fontSize: 12.spMin,fontWeight: FontWeight.w400,color: AppColors.gray700,maxLines: 2,textAlign: TextAlign.start)
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h),
        const Divider(height: 1, color: AppColors.gray300),
        SizedBox(height: 16.h),
      ],
    );
  }
}
