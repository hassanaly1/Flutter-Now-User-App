import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:user_app/utils/appbar.dart';
import 'package:user_app/utils/appcolors.dart';
import 'package:user_app/utils/custom_text.dart';
import 'package:user_app/utils/reusable_container.dart';
import 'package:user_app/views/food_delivery/food_description.dart';

class MyAddToCartScreen extends StatelessWidget {
  const MyAddToCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const MyCustomAppbar(
          title: 'My Cart',
          showBackArrow: true,
        ),
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
          onTap: () {},
          child: ReUsableContainer(
            verticalPadding: context.height * 0.02,
            height: 50,
            color: AppColors.buttonColor.withOpacity(0.9),
            child: const Center(
                child: CustomTextWidget(
              text: 'Checkout',
              fontSize: 16,
              textColor: AppColors.blackTextColor,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.center,
            )),
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
        height: 100,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.network(
                  'https://media.istockphoto.com/id/1191080960/photo/traditional-turkish-breakfast-and-people-taking-various-food-wide-composition.jpg?s=612x612&w=0&k=20&c=PP5ejMisEwzcLWrNmJ8iPPm_u-4P6rOWHEDpBPL2n7Q=',
                  width: context.width * 0.3,
                  height: context.height,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(
                    text: 'Alfred Chicken',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                  ),
                  CustomTextWidget(
                    text: 'The Garlics Restaurant',
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
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomTextWidget(
                    text: '\$120.00',
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      LucideIcons.trash,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
