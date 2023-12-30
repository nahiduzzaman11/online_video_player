import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_video_player/utils/app_colors.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {super.key,
        this.maxLines= 1,
        this.textAlign = TextAlign.center,
        this.left = 0,
        this.right = 0,
        this.top = 0,
        this.bottom = 0,
        this.fontSize = 14,
        this.fontWeight =FontWeight.w400,
        this.color = AppColors.gray600,
        this.text = "",
        this.title = false,
        this.overflow = TextOverflow.fade,
      });

  final double left;
  final double right;
  final double top;
  final double bottom;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final String text;
  final TextAlign textAlign;
  final int ? maxLines;
  final TextOverflow overflow;
  final bool title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      EdgeInsets.only(left: left, right: right, top: top, bottom: bottom),
      child: Text(textAlign: textAlign,
        text,maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        style: title == true
            ? GoogleFonts.hindSiliguri(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
        )
            : GoogleFonts.poppins(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
        ),
      ),
    );
  }
}