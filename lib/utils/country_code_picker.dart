import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_app/utils/appcolors.dart';
import 'package:user_app/utils/heading_and_textfield.dart';

class MyCustomCountryCodePicker extends StatelessWidget {
  const MyCustomCountryCodePicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: CustomTextField(
              hintText: '+123',
              readOnly: true,
              onTap: () {
                showCountryPicker(
                  context: context,
                  showPhoneCode: true,
                  useSafeArea: true,
                  countryListTheme: CountryListThemeData(
                      bottomSheetHeight: context.height * 0.8,
                      padding: const EdgeInsets.all(8.0),
                      backgroundColor: AppColors.backgroundColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16.0),
                        topRight: Radius.circular(16.0),
                      )),
                  onSelect: (Country country) {
                    debugPrint('Select country: ${country.displayName}');
                  },
                );
              },
            )),
        const SizedBox(width: 8.0),
        const Expanded(
            flex: 3,
            child: CustomTextField(
              hintText: '+123456789',
            )),
      ],
    );
  }
}
