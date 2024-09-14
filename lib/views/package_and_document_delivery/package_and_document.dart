import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_app/utils/appbar.dart';
import 'package:user_app/utils/appcolors.dart';
import 'package:user_app/utils/common_widgets.dart';
import 'package:user_app/utils/country_code_picker.dart';
import 'package:user_app/utils/custom_text.dart';
import 'package:user_app/utils/dropdown.dart';
import 'package:user_app/utils/heading_and_textfield.dart';
import 'package:user_app/utils/reusable_container.dart';
import 'package:user_app/views/google_maps/select_location.dart';

class MainPackageAndDocumentScreen extends StatefulWidget {
  final bool isPackageScreen;

  const MainPackageAndDocumentScreen({super.key, this.isPackageScreen = true});

  @override
  State<MainPackageAndDocumentScreen> createState() =>
      _MainPackageAndDocumentScreenState();
}

class _MainPackageAndDocumentScreenState
    extends State<MainPackageAndDocumentScreen> {
  List<String> packagesTypes = [
    'Standard Package',
    'Express Package',
    'Same Day Delivery',
    'International Package',
    'Heavy Goods Package',
    'Other'
  ];

  List<String> documentsTypes = [
    'ID Document',
    'Passport',
    'Birth Certificate',
    'Driver License',
    'Utility Bill',
    'Other'
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: CustomAppbar(
            title: widget.isPackageScreen ? 'Packages' : 'Documents',
            showBackArrow: true,
          ),
          bottomNavigationBar: InkWell(
            onTap: () => Get.to(() => const SelectLocationScreen(),
                transition: Transition.rightToLeft),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: context.width * 0.06),
              child: ReUsableContainer(
                verticalPadding: context.height * 0.02,
                height: 50,
                color: AppColors.buttonColor.withOpacity(0.9),
                child: const Center(
                    child: CustomTextWidget(
                  text: 'Next',
                  fontSize: 16.0,
                  textColor: AppColors.blackTextColor,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.center,
                )),
              ),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.width * 0.05),
            child: ListView(
              children: [
                const SizeBetweenWidgets(),
                const CustomTextWidget(
                  text: 'Personal Details:',
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                  textColor: AppColors.buttonColor,
                ),
                CustomTextWidget(
                  text:
                      'The details of the person who\'s receiving the ${widget.isPackageScreen ? 'package' : 'document'}(s).',
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                  textColor: AppColors.buttonColor,
                ),
                const Row(
                  children: [
                    Expanded(
                      child: HeadingAndTextfield(title: 'First Name'),
                    ),
                    SizedBox(width: 8.0),
                    Expanded(
                      child: HeadingAndTextfield(title: 'Last Name'),
                    ),
                  ],
                ),
                const CustomTextWidget(
                  text: 'Contact Number',
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                  textColor: Colors.black54,
                  maxLines: 1,
                ),
                const MyCustomCountryCodePicker(),
                const SizeBetweenWidgets(),
                const MyCustomDivider(),
                const SizeBetweenWidgets(),
                CustomTextWidget(
                  text:
                      '${widget.isPackageScreen ? 'Package' : 'Document'} Details:',
                  textColor: AppColors.buttonColor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
                CustomDropdown(
                  hintText:
                      'Type of ${widget.isPackageScreen ? 'Package' : 'Document'}',
                  items:
                      widget.isPackageScreen ? packagesTypes : documentsTypes,
                  onChanged: (p0) {},
                ),
                HeadingAndTextfield(
                  title: 'Any Additional Details? (Optional)',
                  hintText:
                      'Enter ${widget.isPackageScreen ? 'Package' : 'Document'} Details here in detailed form.',
                  maxLines: 4,
                ),
                CustomTextWidget(
                  text:
                      'Upload ${widget.isPackageScreen ? 'Package' : 'Document'} Images',
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                  textColor: Colors.black54,
                  maxLines: 1,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(12),
                    color: AppColors.lightGreyColor,
                    dashPattern: const [8, 4],
                    child: Container(
                      color: Colors.transparent,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 22.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const SizedBox(height: 12.0),
                            Image.asset('assets/images/upload.png'),
                            const SizedBox(height: 12.0),
                            CustomTextWidget(
                              text:
                                  'Please upload ${widget.isPackageScreen ? 'Package' : 'Document'} images.',
                              fontSize: 12.0,
                              maxLines: 2,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 6.0),
                            const CustomTextWidget(
                              text: 'Only Jpeg, png are allowed.',
                              fontSize: 10.0,
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              textColor: AppColors.lightTextColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const MyCustomDivider(),
                const SizeBetweenWidgets(),
              ],
            ),
          )),
    );
  }
}
