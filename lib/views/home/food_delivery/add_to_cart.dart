import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:user_app/utils/appbar.dart';
import 'package:user_app/utils/appcolors.dart';
import 'package:user_app/utils/custom_text.dart';
import 'package:user_app/utils/reusable_container.dart';
import 'package:user_app/views/home/checkout.dart';
import 'package:user_app/views/home/food_delivery/food_description.dart';

class AddToCartScreen extends StatelessWidget {
  const AddToCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppbar(title: 'My Cart', showBackArrow: true),
        body: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () => Get.to(() => const ProductDetailScreen()),
              child: const CustomAddToCartWidget(),
            );
          },
        ),
        bottomNavigationBar: InkWell(
          onTap: () {
            Get.to(() => const CheckoutScreen(),
                transition: Transition.rightToLeft);
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.width * 0.06),
            child: ReUsableContainer(
              verticalPadding: context.height * 0.02,
              height: 50,
              color: AppColors.buttonColor.withOpacity(0.9),
              child: const Center(
                  child: CustomTextWidget(
                text: 'Checkout',
                fontSize: 16.0,
                textColor: AppColors.blackTextColor,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.center,
              )),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomAddToCartWidget extends StatelessWidget {
  const CustomAddToCartWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.network(
                  'https://media.istockphoto.com/id/1191080960/photo/traditional-turkish-breakfast-and-people-taking-various-food-wide-composition.jpg?s=612x612&w=0&k=20&c=PP5ejMisEwzcLWrNmJ8iPPm_u-4P6rOWHEDpBPL2n7Q=',
                  width: context.width * 0.25,
                  height: context.height * 0.12,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                      text:
                          'The Special Alfred Chicken The Special Alfred Chicken',
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                      maxLines: 2,
                    ),
                    CustomTextWidget(
                      text: 'The Garlics Restaurant & Bar',
                      fontSize: 12.0,
                      fontWeight: FontWeight.w600,
                      textColor: AppColors.lightTextColor,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          CupertinoIcons.plus_circle_fill,
                          color: AppColors.buttonColor,
                          size: 24.0,
                        ),
                        SizedBox(width: 8.0),
                        CustomTextWidget(
                          text: '7',
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          textColor: AppColors.blackTextColor,
                        ),
                        SizedBox(width: 8.0),
                        Icon(
                          LucideIcons.circleMinus,
                          color: AppColors.buttonColor,
                          size: 24.0,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const CustomTextWidget(
                    text: '\$120,000.00',
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(height: context.height * 0.03),
                  IconButton(
                    visualDensity: VisualDensity.compact,
                    onPressed: () {},
                    icon: const Icon(
                      LucideIcons.trash,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
