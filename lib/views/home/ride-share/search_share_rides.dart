import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:user_app/utils/app_sizes.dart';
import 'package:user_app/utils/appbar.dart';
import 'package:user_app/utils/appcolors.dart';
import 'package:user_app/utils/custom_button.dart';
import 'package:user_app/utils/custom_text.dart';
import 'package:user_app/utils/dropdown.dart';

class SearchShareRidesScreen extends StatefulWidget {
  const SearchShareRidesScreen({super.key});

  @override
  State<SearchShareRidesScreen> createState() => _SearchShareRidesScreenState();
}

class _SearchShareRidesScreenState extends State<SearchShareRidesScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppbar(title: 'Select Ride'),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextWidget(
                    text: 'Available Rides',
                    textColor: AppColors.primaryColor.withOpacity(0.8),
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                  IconButton(
                    visualDensity: VisualDensity.compact,
                    padding: const EdgeInsets.all(0.0),
                    onPressed: () {
                      _showFilterBottomSheet(context);
                    },
                    icon: const Icon(LucideIcons.filter),
                  )
                ],
              ),
            ),
            const CustomRideShareExpansionTile(),
            const CustomRideShareExpansionTile(),
            const CustomRideShareExpansionTile(),
            const CustomRideShareExpansionTile(),
          ],
        ),
      ),
    );
  }
}

void _showFilterBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: AppColors.backgroundColor,
    useSafeArea: true,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16.0),
        topRight: Radius.circular(16.0),
      ),
    ),
    builder: (BuildContext context) {
      return SizedBox(
        height: context.height * 0.8,
        child: Column(
          children: [
            // Close Button
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(CupertinoIcons.multiply_circle_fill),
              ),
            ),
            // Title
            const CustomTextWidget(text: 'Filter Rides'),
            const Divider(),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: [
                  // Vehicle Type Filter
                  const CustomTextWidget(text: 'Vehicle Type'),

                  CustomDropdown(
                    items: const ['Economy', 'SUV', 'Luxury'],
                    onChanged: (p0) {},
                    hintText: 'Select Vehicle Type',
                  ),
                 
                  const SizedBox(height: 16),
                  // Price Range Slider
                  const CustomTextWidget(text: 'Price Range'),
                  const SizedBox(height: 8),
                  RangeSlider(
                    min: 10.0,
                    max: 200.0,
                    divisions: 20,
                    onChanged: (value) {},
                    values: const RangeValues(30.0, 170.0),
                  ),
                  const SizedBox(height: 16),
                  // Driver Rating Filter
                  const CustomTextWidget(text: 'Driver Rating'),
                  CustomDropdown(
                    items: const ['4+', '3+', '2+', '1+'],
                    onChanged: (p0) {},
                    hintText: 'Select Rating',
                  ),
                  const SizedBox(height: 16),
                  // Accessibility Filter
                  const CustomTextWidget(text: 'Accessibility Options'),
                  CheckboxListTile(
                    title:
                        const CustomTextWidget(text: 'Wheelchair Accessible'),
                    value: true,
                    onChanged: (bool? value) {},
                  ),
                  CheckboxListTile(
                    title: const CustomTextWidget(text: 'Child Seat'),
                    value: false,
                    onChanged: (bool? value) {},
                  ),
                  const SizedBox(height: 16),
                  // Submit and Reset Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                        child: CustomButton(
                          buttonText: 'Reset',
                          useButtonColor: false,
                          onTap: () {
                            Get.back();
                          },
                        ),
                      ),
                      Flexible(
                        child: CustomButton(
                          buttonText: 'Apply',
                          onTap: () {},
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}

class CustomRideShareExpansionTile extends StatelessWidget {
  const CustomRideShareExpansionTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(color: AppColors.lightGreyColor),
        ),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.all(12.0),
          dense: true,
          visualDensity: VisualDensity.compact,
          controlAffinity: ListTileControlAffinity.trailing,
          expandedAlignment: Alignment.topCenter,
          backgroundColor: Colors.grey.shade200,
          collapsedBackgroundColor: Colors.grey.shade100,
          iconColor: AppColors.primaryColor,
          collapsedShape: ShapeBorder.lerp(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
            1.0,
          ),
          shape: ShapeBorder.lerp(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
            1.0,
          ),
          childrenPadding:
              const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
          title: ListTile(
            contentPadding: const EdgeInsets.all(0.0),
            dense: true,
            visualDensity: VisualDensity.compact,
            leading: const CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage(
                'https://img.freepik.com/premium-photo/3d-taxi-driver-cartoon-character_876282-8044.jpg',
              ),
            ),
            title: CustomTextWidget(
              text: 'Mr Adam Smith',
              fontSize: 16.0,
              fontWeight: FontWeight.w700,
              textColor: AppColors.primaryColor.withOpacity(0.8),
            ),
            subtitle: Row(
              children: [
                const CustomTextWidget(
                  text: '(78) ',
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                  textColor: AppColors.buttonColor,
                ),
                RatingBar.readOnly(
                  filledIcon: CupertinoIcons.star_fill,
                  emptyIcon: CupertinoIcons.star_lefthalf_fill,
                  emptyColor: AppColors.buttonColor,
                  initialRating: 4,
                  filledColor: AppColors.buttonColor,
                  size: AppSizes.fontSize15(context),
                  maxRating: 5,
                ),
              ],
            ),
            trailing: const CustomTextWidget(
              text: '\$120.00',
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
              textColor: AppColors.buttonColor,
            ),
          ),
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              dense: true,
              visualDensity: VisualDensity.compact,
              leading: Image.asset(
                'assets/images/indicator.png',
                color: AppColors.primaryColor,
                width: 20,
              ),
              title: const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Pickup Location: ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12.0),
                    ),
                    TextSpan(
                      text: '600 Clinton Hollow Apt. 572',
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 12.0),
                    ),
                  ],
                ),
                maxLines: 2,
              ),
              subtitle: const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Drop-off Location: ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12.0),
                    ),
                    TextSpan(
                      text: '5058 Mosciski Corner Suite 228',
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 12.0),
                    ),
                  ],
                ),
                maxLines: 2,
              ),
              trailing: const Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.social_distance_sharp, size: 16.0),
                      SizedBox(width: 4.0),
                      Text(
                        '7 Km',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12.0,
                        ),
                        maxLines: 2,
                      ),
                    ],
                  ),
                  SizedBox(height: 4.0),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(LucideIcons.timer, size: 16.0),
                      SizedBox(width: 4.0),
                      Text(
                        '10 min',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12.0,
                        ),
                        maxLines: 2,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomRowWidget(heading: 'Date: ', subHeading: '10/07/2025'),
                CustomRowWidget(heading: 'Time: ', subHeading: '10:00 AM'),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomRowWidget(heading: 'Payment: ', subHeading: 'Cash'),
                CustomRowWidget(
                    heading: 'Vehicle: ', subHeading: 'Toyota Camry'),
              ],
            ),
            const CustomRowWidget(
                heading: 'Available Seats: ', subHeading: '2'),
            const CustomRowWidget(
                heading: 'Any Additional Info: ', subHeading: 'N/A'),
            CustomButton(
              buttonText: 'Send Offer',
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}

class CustomRowWidget extends StatelessWidget {
  final String heading;
  final String subHeading;

  const CustomRowWidget({
    super.key,
    required this.heading,
    required this.subHeading,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomTextWidget(
          text: heading,
          fontSize: 14.0,
          fontWeight: FontWeight.w600,
          textColor: AppColors.lightTextColor,
        ),
        CustomTextWidget(
          text: subHeading,
          fontSize: 14.0,
          textColor: AppColors.lightTextColor,
        ),
      ],
    );
  }
}
