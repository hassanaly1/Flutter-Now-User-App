import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_app/utils/appcolors.dart';

class ReUsableContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final double? verticalPadding;

  // final double? borderRadius;
  final BorderRadiusGeometry? borderRadius;
  final bool showBackgroundShadow;
  final Color? color;
  final double? height;
  final double? width;

  const ReUsableContainer({
    super.key,
    required this.child,
    this.padding,
    this.verticalPadding,
    this.height,
    this.width,
    this.borderRadius,
    this.showBackgroundShadow = true,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: verticalPadding ?? context.height * 0.015, horizontal: 4.0),
      child: _buildContainer(),
    );
  }

  Widget _buildContainer() {
    return Container(
      height: height,
      width: width,
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: color ?? Colors.grey.shade100,
        borderRadius: borderRadius ?? BorderRadius.circular(12.0),
        border: Border.all(
            color: showBackgroundShadow
                ? Colors.transparent
                : AppColors.lightGreyColor),
        boxShadow: showBackgroundShadow
            ? [
                const BoxShadow(
                  color: Colors.black26,
                  blurRadius: 3.0,
                  spreadRadius: 1.0,
                ),
                const BoxShadow(
                  color: Colors.white,
                  offset: Offset(0.0, 0.0),
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                ),
              ]
            : null,
      ),
      child: child,
    );
  }
}
