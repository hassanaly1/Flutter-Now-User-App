import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:user_app/utils/appcolors.dart';
import 'package:user_app/utils/custom_text.dart';

class ReUsableTextField extends StatelessWidget {
  final String hintText;
  final bool? readOnly;
  final VoidCallback? onTap;
  final int? maxLines;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final bool obscureText;
  final String? Function(String?)? validator;
  final bool showBackgroundShadow;

  const ReUsableTextField({
    super.key,
    required this.hintText,
    this.onTap,
    this.readOnly,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines = 1,
    this.keyboardType,
    this.controller,
    this.onChanged,
    this.obscureText = false,
    this.showBackgroundShadow = true,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        readOnly: readOnly ?? false,
        onTap: onTap,
        controller: controller,
        onChanged: onChanged,
        validator: validator,
        maxLines: maxLines,
        obscureText: obscureText,
        style: const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 14,
          fontWeight: FontWeight.w300,
          color: AppColors.whiteTextColor,
        ),
        keyboardType: keyboardType,
        inputFormatters: [
          if (keyboardType == TextInputType.number)
            FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          filled: true,
          fillColor: Colors.transparent,
          label: CustomTextWidget(
            text: hintText,
            fontSize: 14.0,
            textColor: Colors.white70,
          ),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white38),
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(8.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.errorColor),
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.errorColor),
            borderRadius: BorderRadius.circular(8.0),
          ),
          errorStyle: const TextStyle(
            fontSize: 12.0,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            color: AppColors.errorColor,
          ),
        ),
      ),
    );
  }
}
