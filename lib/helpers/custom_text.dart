import 'package:flutter/material.dart';
import 'package:user_app/utils/app_sizes.dart';
import 'package:user_app/utils/appcolors.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final Color? textColor;
  final TextAlign? textAlign;
  final TextDecoration? decoration;
  final int? maxLines;

  const CustomTextWidget({
    super.key,
    required this.text,
    this.textColor,
    this.textAlign,
    this.fontSize,
    this.maxLines,
    this.fontWeight,
    this.fontStyle,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines ?? 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontFamily: 'Poppins',
        decoration: decoration,
        fontStyle: fontStyle ?? FontStyle.normal,
        fontSize: calculateFontSize(context, fontSize ?? 14.0),
        fontWeight: fontWeight ?? FontWeight.w400,
        color: textColor ?? AppColors.blackTextColor,
      ),
    );
  }

  calculateFontSize(BuildContext context, double fontSize) {
    switch (fontSize) {
      case 4.0:
        return AppSizes.fontSize4(context);
      case 5.0:
        return AppSizes.fontSize5(context);
      case 6.0:
        return AppSizes.fontSize6(context);
      case 7.0:
        return AppSizes.fontSize7(context);
      case 8.0:
        return AppSizes.fontSize8(context);
      case 9.0:
        return AppSizes.fontSize9(context);
      case 10.0:
        return AppSizes.fontSize10(context);
      case 11.0:
        return AppSizes.fontSize11(context);
      case 12.0:
        return AppSizes.fontSize12(context);
      case 13.0:
        return AppSizes.fontSize13(context);
      case 14.0:
        return AppSizes.fontSize14(context);
      case 15.0:
        return AppSizes.fontSize15(context);
      case 16.0:
        return AppSizes.fontSize16(context);
      case 17.0:
        return AppSizes.fontSize17(context);
      case 18.0:
        return AppSizes.fontSize18(context);
      case 19.0:
        return AppSizes.fontSize19(context);
      case 20.0:
        return AppSizes.fontSize20(context);
      case 21.0:
        return AppSizes.fontSize21(context);
      case 22.0:
        return AppSizes.fontSize22(context);
      case 23.0:
        return AppSizes.fontSize23(context);
      case 24.0:
        return AppSizes.fontSize24(context);
      case 25.0:
        return AppSizes.fontSize25(context);
      case 26.0:
        return AppSizes.fontSize26(context);
      case 27.0:
        return AppSizes.fontSize27(context);
      case 28.0:
        return AppSizes.fontSize28(context);
      case 29.0:
        return AppSizes.fontSize29(context);
      case 30.0:
        return AppSizes.fontSize30(context);
      case 31.0:
        return AppSizes.fontSize31(context);
      case 32.0:
        return AppSizes.fontSize32(context);
      case 33.0:
        return AppSizes.fontSize33(context);
      case 34.0:
        return AppSizes.fontSize34(context);
      case 35.0:
        return AppSizes.fontSize35(context);
      case 36.0:
        return AppSizes.fontSize36(context);
      case 37.0:
        return AppSizes.fontSize37(context);
      case 38.0:
        return AppSizes.fontSize38(context);
      case 39.0:
        return AppSizes.fontSize39(context);
      case 40.0:
        return AppSizes.fontSize40(context);
      case 41.0:
        return AppSizes.fontSize41(context);
      case 42.0:
        return AppSizes.fontSize42(context);
      case 43.0:
        return AppSizes.fontSize43(context);
      case 44.0:
        return AppSizes.fontSize44(context);
      case 45.0:
        return AppSizes.fontSize45(context);
      case 46.0:
        return AppSizes.fontSize46(context);
      case 47.0:
        return AppSizes.fontSize47(context);
      case 48.0:
        return AppSizes.fontSize48(context);
      case 49.0:
        return AppSizes.fontSize49(context);
      case 50.0:
        return AppSizes.fontSize50(context);
      default:
        return AppSizes.fontSize14(context);
    }
  }
}
