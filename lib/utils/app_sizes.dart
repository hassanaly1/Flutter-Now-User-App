import 'package:flutter/material.dart';

class AppSizes {
  // static double scaleFontSize(BuildContext context, double baseFontSize) {
  //   double screenWidth = MediaQuery.of(context).size.width;
  //   return baseFontSize * (screenWidth / 415.0);
  // }

  static double scaleFontSize(BuildContext context, double baseFontSize) {
    // Get the dimensions of the screen
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Define the reference width and height
    // Use the dimensions of the reference screen or your design's ideal dimensions
    double referenceWidth = 410.0;
    double referenceHeight = 720.0;

    // Calculate scaling factors based on width and height
    double widthScale = screenWidth / referenceWidth;
    double heightScale = screenHeight / referenceHeight;

    // Use the minimum scaling factor to maintain aspect ratio
    double scale = widthScale < heightScale ? widthScale : heightScale;

    // Return the scaled font size
    return baseFontSize * scale;
  }

  static double fontSize4(BuildContext context) => scaleFontSize(context, 4.0);

  static double fontSize5(BuildContext context) => scaleFontSize(context, 5.0);

  static double fontSize6(BuildContext context) => scaleFontSize(context, 6.0);

  static double fontSize7(BuildContext context) => scaleFontSize(context, 7.0);

  static double fontSize8(BuildContext context) => scaleFontSize(context, 8.0);

  static double fontSize9(BuildContext context) => scaleFontSize(context, 9.0);

  static double fontSize10(BuildContext context) =>
      scaleFontSize(context, 10.0);

  static double fontSize11(BuildContext context) =>
      scaleFontSize(context, 11.0);

  static double fontSize12(BuildContext context) =>
      scaleFontSize(context, 12.0);

  static double fontSize13(BuildContext context) =>
      scaleFontSize(context, 13.0);

  static double fontSize14(BuildContext context) =>
      scaleFontSize(context, 14.0);

  static double fontSize15(BuildContext context) =>
      scaleFontSize(context, 15.0);

  static double fontSize16(BuildContext context) =>
      scaleFontSize(context, 16.0);

  static double fontSize17(BuildContext context) =>
      scaleFontSize(context, 17.0);

  static double fontSize18(BuildContext context) =>
      scaleFontSize(context, 18.0);

  static double fontSize19(BuildContext context) =>
      scaleFontSize(context, 19.0);

  static double fontSize20(BuildContext context) =>
      scaleFontSize(context, 20.0);

  static double fontSize21(BuildContext context) =>
      scaleFontSize(context, 21.0);

  static double fontSize22(BuildContext context) =>
      scaleFontSize(context, 22.0);

  static double fontSize23(BuildContext context) =>
      scaleFontSize(context, 23.0);

  static double fontSize24(BuildContext context) =>
      scaleFontSize(context, 24.0);

  static double fontSize25(BuildContext context) =>
      scaleFontSize(context, 25.0);

  static double fontSize26(BuildContext context) =>
      scaleFontSize(context, 26.0);

  static double fontSize27(BuildContext context) =>
      scaleFontSize(context, 27.0);

  static double fontSize28(BuildContext context) =>
      scaleFontSize(context, 28.0);

  static double fontSize29(BuildContext context) =>
      scaleFontSize(context, 29.0);

  static double fontSize30(BuildContext context) =>
      scaleFontSize(context, 30.0);

  static double fontSize31(BuildContext context) =>
      scaleFontSize(context, 31.0);

  static double fontSize32(BuildContext context) =>
      scaleFontSize(context, 32.0);

  static double fontSize33(BuildContext context) =>
      scaleFontSize(context, 33.0);

  static double fontSize34(BuildContext context) =>
      scaleFontSize(context, 34.0);

  static double fontSize35(BuildContext context) =>
      scaleFontSize(context, 35.0);

  static double fontSize36(BuildContext context) =>
      scaleFontSize(context, 36.0);

  static double fontSize37(BuildContext context) =>
      scaleFontSize(context, 37.0);

  static double fontSize38(BuildContext context) =>
      scaleFontSize(context, 38.0);

  static double fontSize39(BuildContext context) =>
      scaleFontSize(context, 39.0);

  static double fontSize40(BuildContext context) =>
      scaleFontSize(context, 40.0);

  static double fontSize41(BuildContext context) =>
      scaleFontSize(context, 41.0);

  static double fontSize42(BuildContext context) =>
      scaleFontSize(context, 42.0);

  static double fontSize43(BuildContext context) =>
      scaleFontSize(context, 43.0);

  static double fontSize44(BuildContext context) =>
      scaleFontSize(context, 44.0);

  static double fontSize45(BuildContext context) =>
      scaleFontSize(context, 45.0);

  static double fontSize46(BuildContext context) =>
      scaleFontSize(context, 46.0);

  static double fontSize47(BuildContext context) =>
      scaleFontSize(context, 47.0);

  static double fontSize48(BuildContext context) =>
      scaleFontSize(context, 48.0);

  static double fontSize49(BuildContext context) =>
      scaleFontSize(context, 49.0);

  static double fontSize50(BuildContext context) =>
      scaleFontSize(context, 50.0);
}
