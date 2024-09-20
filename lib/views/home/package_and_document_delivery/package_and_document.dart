import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_app/controllers/package_and_document_controller.dart';
import 'package:user_app/helpers/appbar.dart';
import 'package:user_app/helpers/country_code_picker.dart';
import 'package:user_app/helpers/custom_text.dart';
import 'package:user_app/helpers/dropdown.dart';
import 'package:user_app/helpers/heading_and_textfield.dart';
import 'package:user_app/utils/appcolors.dart';
import 'package:user_app/utils/common_widgets.dart';
import 'package:user_app/views/home/food_delivery/add_to_cart.dart';
import 'package:user_app/views/home/google_maps/select_location.dart';

class MainPackageAndDocumentScreen extends StatefulWidget {
  final bool isPackageScreen;

  const MainPackageAndDocumentScreen({super.key, this.isPackageScreen = true});

  @override
  State<MainPackageAndDocumentScreen> createState() =>
      _MainPackageAndDocumentScreenState();
}

class _MainPackageAndDocumentScreenState
    extends State<MainPackageAndDocumentScreen> {
  final MyPackageAndDocumentController _controller =
      Get.put(MyPackageAndDocumentController());
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
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SafeArea(
        child: Scaffold(
            appBar: CustomAppbar(
              title: widget.isPackageScreen ? 'Packages' : 'Documents',
              showBackArrow: true,
            ),
            bottomNavigationBar: InkWell(
              onTap: () => Get.to(() => const SelectLocationScreen(),
                  transition: Transition.rightToLeft),
              child: const CustomBottomNavigationBarButton(title: 'Next'),
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
                        'Upload ${widget.isPackageScreen ? 'Package' : 'Document'} Images \n(Upload minimum 3 & maximum 8 images)',
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                    textColor: Colors.black54,
                    maxLines: 2,
                  ),
                  Obx(
                    () => GestureDetector(
                      onTap: _controller.selectedImages.length < 8
                          ? _controller.pickImages
                          : null,
                      // Disable the gesture if 8 images are already selected
                      child: Padding(
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
                              padding:
                                  const EdgeInsets.symmetric(vertical: 22.0),
                              child: _controller.selectedImages.isEmpty
                                  ? Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
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
                                          text: 'Only JPEG, PNG are allowed.',
                                          fontSize: 10.0,
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                          textColor: AppColors.lightTextColor,
                                        ),
                                      ],
                                    )
                                  : SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: [
                                          // Display the selected images
                                          ..._controller.selectedImages
                                              .map((image) {
                                            int index = _controller
                                                .selectedImages
                                                .indexOf(image);
                                            return Stack(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Container(
                                                    width: 100,
                                                    height: 100,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      image: DecorationImage(
                                                        image: FileImage(image),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  right: 0,
                                                  top: 0,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child: InkWell(
                                                      onTap: () => _controller
                                                          .removeImage(index),
                                                      child: const Icon(
                                                        Icons.cancel_rounded,
                                                        color: AppColors
                                                            .errorColor,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  left: 0,
                                                  top: 0,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child: Badge.count(
                                                      count: index + 1,
                                                      backgroundColor:
                                                          AppColors.buttonColor,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              3.0),
                                                      textStyle:
                                                          const TextStyle(
                                                        fontSize: 14.0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          }),

                                          // Show the 'Add' icon if less than 8 images are selected
                                          if (_controller
                                                  .selectedImages.length <
                                              8)
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: GestureDetector(
                                                onTap: _controller.pickImages,
                                                child: Container(
                                                  width: 100,
                                                  height: 100,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    color: AppColors
                                                        .lightGreyColor
                                                        .withOpacity(0.5),
                                                  ),
                                                  child: const Icon(
                                                    Icons.add,
                                                    size: 40,
                                                    color:
                                                        AppColors.primaryColor,
                                                  ),
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizeBetweenWidgets(),
                ],
              ),
            )),
      ),
    );
  }
}
