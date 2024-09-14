import 'package:flutter/material.dart';
import 'package:user_app/utils/appcolors.dart';
import 'package:user_app/utils/custom_text.dart';
import 'package:user_app/utils/reusable_container.dart';

class CustomDropdown extends StatelessWidget {
  final String hintText;
  final List<dynamic> items;
  final void Function(dynamic)? onChanged;

  const CustomDropdown({
    super.key,
    required this.items,
    required this.onChanged,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return ReUsableContainer(
      padding: EdgeInsets.zero,
      child: DropdownButtonFormField(
        padding: EdgeInsets.zero,
        iconSize: 12.0,
        alignment: Alignment.centerLeft,
        isExpanded: false,
        hint: CustomTextWidget(
          text: hintText,
          fontSize: 10,
          fontWeight: FontWeight.w300,
          textColor: AppColors.lightTextColor,
        ),
        isDense: true,
        dropdownColor: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12.0),
        icon: const Icon(Icons.keyboard_arrow_down_rounded),
        style: const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 10,
          fontWeight: FontWeight.w300,
          color: AppColors.lightTextColor,
        ),
        decoration: InputDecoration(
          fillColor: Colors.grey.shade100,
          filled: true,
          border: const OutlineInputBorder(borderSide: BorderSide.none),
        ),
        items: items
            .map((option) => DropdownMenuItem(
                value: option,
                child: CustomTextWidget(
                  text: option ?? '',
                  fontSize: 12.0,
                  fontWeight: FontWeight.w300,
                  textColor: AppColors.blackTextColor,
                )))
            .toList(),
        onChanged: onChanged,
      ),
    );
  }
}
