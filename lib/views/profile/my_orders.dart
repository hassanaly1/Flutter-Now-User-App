import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:user_app/helpers/appbar.dart';
import 'package:user_app/helpers/custom_text.dart';
import 'package:user_app/utils/appcolors.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  RxInt selectedChipIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppbar(title: 'My Orders'),
        body: NestedScrollView(
          dragStartBehavior: DragStartBehavior.down,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                floating: true,
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                expandedHeight: context.height * 0.3,
                backgroundColor: AppColors.whiteTextColor,
                flexibleSpace: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: MyDatePickerWidget(),
                    )
                  ],
                ),
              ),
            ];
          },
          body: Container(
            color: Colors.white30,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomTextWidget(
                      text: 'All Orders',
                      fontSize: 18.0,
                      textColor: Colors.black87,
                      fontWeight: FontWeight.w700),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildFilterChip('Ride', LucideIcons.car, 0),
                        _buildFilterChip(
                            'Ride Share', Icons.car_crash_rounded, 1),
                        _buildFilterChip('Food', Icons.fastfood_outlined, 2),
                        _buildFilterChip('Package', LucideIcons.package, 3),
                        _buildFilterChip('Document', LucideIcons.fileText, 4),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return const MyCustomExpansionTile();
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFilterChip(String label, IconData icon, int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Obx(
        () => FilterChip(
          label: CustomTextWidget(
              text: label,
              textColor: selectedChipIndex.value == index
                  ? AppColors.whiteTextColor
                  : AppColors.blackTextColor),
          selected: selectedChipIndex.value == index,
          selectedColor: AppColors.buttonColor,
          onSelected: (value) {
            selectedChipIndex.value = index;
          },
          chipAnimationStyle: ChipAnimationStyle(
              avatarDrawerAnimation:
                  AnimationStyle(duration: const Duration(milliseconds: 0)),
              deleteDrawerAnimation:
                  AnimationStyle(duration: const Duration(milliseconds: 0)),
              enableAnimation:
                  AnimationStyle(duration: const Duration(milliseconds: 0)),
              selectAnimation:
                  AnimationStyle(duration: const Duration(milliseconds: 0))),
          showCheckmark: false,
          avatar: Icon(icon,
              color: selectedChipIndex.value == index
                  ? AppColors.whiteTextColor
                  : AppColors.blackTextColor),
          backgroundColor: Colors.grey.shade200,
        ),
      ),
    );
  }
}

class MyCustomExpansionTile extends StatelessWidget {
  const MyCustomExpansionTile({
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
          visualDensity: VisualDensity.compact,
          title: const CustomTextWidget(
            text: 'Order-Id: 242nvklm0',
            fontSize: 16.0,
            fontWeight: FontWeight.w700,
            textColor: AppColors.primaryColor,
          ),
          subtitle: const Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CustomTextWidget(
                    text: 'Status: ',
                    textColor: AppColors.lightTextColor,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                  ),
                  CustomTextWidget(
                    text: 'Completed',
                    textColor: Colors.green,
                    fontWeight: FontWeight.w600,
                    fontSize: 14.0,
                  ),
                ],
              ),
              Row(
                children: [
                  CustomTextWidget(
                    text: 'Date: ',
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                    textColor: AppColors.lightTextColor,
                  ),
                  CustomTextWidget(
                    text: '12th September 2022',
                    fontSize: 14.0,
                    textColor: AppColors.lightTextColor,
                  ),
                ],
              ),
            ],
          ),
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                CustomTextWidget(
                  text: 'Customer Name: ',
                  fontSize: 14.0,
                  textColor: AppColors.lightTextColor,
                  fontWeight: FontWeight.w600,
                ),
                CustomTextWidget(
                  text: 'John Doe',
                  textColor: AppColors.lightTextColor,
                  fontSize: 14.0,
                ),
              ],
            ),
            SizedBox(height: context.height * 0.005),
            const Row(
              children: [
                CustomTextWidget(
                  text: 'Address: ',
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                  textColor: AppColors.lightTextColor,
                ),
                CustomTextWidget(
                  text: '123 Main St, Any town USA 12345',
                  textColor: AppColors.lightTextColor,
                  fontSize: 14.0,
                ),
              ],
            ),
            SizedBox(height: context.height * 0.005),
            const Row(
              children: [
                CustomTextWidget(
                  text: 'Amount: ',
                  textColor: AppColors.lightTextColor,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                ),
                CustomTextWidget(
                  text: '\$50.00',
                  textColor: AppColors.lightTextColor,
                  fontSize: 14.0,
                ),
              ],
            ),
            const Row(
              children: [
                CustomTextWidget(
                  text: 'Tip: ',
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                  textColor: AppColors.lightTextColor,
                ),
                CustomTextWidget(
                  text: '\$7.00',
                  fontSize: 14.0,
                  textColor: AppColors.lightTextColor,
                ),
              ],
            ),
            SizedBox(height: context.height * 0.005),
            const Row(
              children: [
                CustomTextWidget(
                  text: 'Delivery Type: ',
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                  textColor: AppColors.lightTextColor,
                ),
                CustomTextWidget(
                  text: 'Food Delivery',
                  fontSize: 14.0,
                  textColor: AppColors.lightTextColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MyDatePickerWidget extends StatelessWidget {
  const MyDatePickerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.25,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(color: AppColors.lightGreyColor)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: EasyDateTimeLine(
          initialDate: DateTime.now(),
          activeColor: AppColors.buttonColor.withOpacity(0.8),
          headerProps: const EasyHeaderProps(
            centerHeader: false,
            monthPickerType: MonthPickerType.switcher,
            dateFormatter: DateFormatter.fullDateMonthAsStrDY(),
            monthStyle: TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins',
            ),
          ),
          dayProps: const EasyDayProps(
              dayStructure: DayStructure.dayStrDayNumMonth,
              inactiveDayStyle: DayStyle(
                dayNumStyle: TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 18.0,
                  fontFamily: 'Poppins',
                ),
                dayStrStyle: TextStyle(
                  color: AppColors.blackTextColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 12.0,
                  fontFamily: 'Poppins',
                ),
                monthStrStyle: TextStyle(
                  color: AppColors.blackTextColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 12.0,
                  fontFamily: 'Poppins',
                ),
              ),
              landScapeMode: false,
              todayStyle: DayStyle(
                  dayNumStyle: TextStyle(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 18.0,
                    fontFamily: 'Poppins',
                  ),
                  dayStrStyle: TextStyle(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                  ),
                  monthStrStyle: TextStyle(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                  ))),
          timeLineProps: const EasyTimeLineProps(
            backgroundColor: AppColors.whiteTextColor,
          ),
          onDateChange: (selectedDate) {},
        ),
      ),
    );
  }
}
