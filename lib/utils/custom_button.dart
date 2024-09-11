import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:user_app/utils/appcolors.dart';
import 'package:user_app/utils/custom_text.dart';
import 'package:user_app/utils/reusable_container.dart';

class MyCustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onTap;
  final Color? textColor;
  final Color? borderColor;
  final double width;
  final double? height;
  final double? fontSize;
  final bool useButtonColor;
  final bool isLoading;
  final bool hasIcon;
  final String? iconUrl;

  const MyCustomButton({
    super.key,
    required this.buttonText,
    required this.onTap,
    this.width = double.infinity,
    this.textColor,
    this.borderColor,
    this.height,
    this.useButtonColor = true,
    this.fontSize,
    this.isLoading = false,
    this.hasIcon = false,
    this.iconUrl,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        splashColor: Colors.transparent,
        overlayColor: const WidgetStatePropertyAll(Colors.transparent),
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
          isLoading ? null : onTap();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: ReUsableContainer(
            width: width,
            verticalPadding: context.height * 0.02,
            height: height ?? 50,
            color: useButtonColor ? AppColors.buttonColor : Colors.white54,
            child: Center(
                child: isLoading
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SpinKitRing(
                          lineWidth: 2.0,
                          color: useButtonColor ? Colors.black87 : Colors.white,
                        ),
                      )
                    : hasIcon
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                iconUrl!,
                                height: 30,
                                width: 30,
                              ),
                              const SizedBox(width: 8.0),
                              CustomTextWidget(
                                text: buttonText,
                                fontSize: fontSize ?? 16,
                                textColor: useButtonColor
                                    ? AppColors.whiteTextColor
                                    : AppColors.blackTextColor,
                                fontWeight: FontWeight.w500,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          )
                        : CustomTextWidget(
                            text: buttonText,
                            fontSize: fontSize ?? 16,
                            textColor: useButtonColor
                                ? AppColors.whiteTextColor
                                : AppColors.blackTextColor,
                            fontWeight: FontWeight.w400,
                            textAlign: TextAlign.center,
                          )),
          ),
        ));
  }
}
