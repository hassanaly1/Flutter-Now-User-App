import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:user_app/utils/appbar.dart';
import 'package:user_app/utils/appcolors.dart';
import 'package:user_app/utils/common_widgets.dart';
import 'package:user_app/utils/custom_text.dart';
import 'package:user_app/utils/reusable_container.dart';
import 'package:user_app/views/home/food_delivery/add_to_cart.dart';
import 'package:user_app/views/home/food_delivery/food_description.dart';
import 'package:user_app/views/home/success.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SafeArea(
        child: Scaffold(
          appBar: const CustomAppbar(title: 'Checkout', showBackArrow: true),
          bottomNavigationBar: InkWell(
            onTap: () => Get.to(() => const SuccessScreen(),
                transition: Transition.rightToLeft),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: context.width * 0.06),
              child: ReUsableContainer(
                verticalPadding: context.height * 0.02,
                height: 50,
                color: AppColors.buttonColor.withOpacity(0.9),
                child: const Center(
                    child: CustomTextWidget(
                  text: 'Place Order',
                  fontSize: 16.0,
                  textColor: AppColors.blackTextColor,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.center,
                )),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomTextWidget(
                    text: 'My Orders',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(
                    height: context.height * 0.3,
                    child: ListView.builder(
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () =>
                              Get.to(() => const ProductDetailScreen()),
                          child: const CustomAddToCartWidget(),
                        );
                      },
                    ),
                  ),
                  const MyCustomDivider(),
                  const CustomTextWidget(
                    text: 'Delivery Address',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                  ReUsableContainer(
                      showBackgroundShadow: false,
                      child: TextFormField(
                        decoration: InputDecoration(
                          // isCollapsed: true,
                          isDense: true,
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          filled: true,
                          fillColor: Colors.transparent,
                          hintText: 'Enter your address',
                          prefixIcon: const Icon(
                            LucideIcons.mapPin,
                            color: AppColors.blackTextColor,
                          ),
                          suffixIcon: InkWell(
                            onTap: () {},
                            child: const Icon(
                              LucideIcons.circleX,
                              color: AppColors.blackTextColor,
                            ),
                          ),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 12.0),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.white38),
                              borderRadius: BorderRadius.circular(8.0)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(8.0)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: AppColors.errorColor),
                              borderRadius: BorderRadius.circular(8.0)),
                        ),
                      )),
                  const CustomTextWidget(
                    text: 'Payment Method',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: RadioListTile(
                          value: '0',
                          groupValue: '1',
                          onChanged: (value) {},
                          visualDensity: VisualDensity.compact,
                          title: const CustomTextWidget(text: 'Cash'),
                        ),
                      ),
                      Flexible(
                        child: RadioListTile(
                          value: '1',
                          groupValue: '1',
                          onChanged: (value) {},
                          visualDensity: VisualDensity.compact,
                          title: const CustomTextWidget(text: 'Card'),
                        ),
                      ),
                    ],
                  ),
                  const CustomTextWidget(
                    text: 'Order Summary',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                  const OrderSummaryWidget(title: 'SubTotal', price: 120),
                  const OrderSummaryWidget(title: 'Delivery', price: 6),
                  const OrderSummaryWidget(title: 'Total', price: 126),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class OrderSummaryWidget extends StatelessWidget {
  final String title;
  final int price;

  const OrderSummaryWidget({
    super.key,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomTextWidget(
            text: title,
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            textColor: AppColors.lightTextColor,
          ),
          CustomTextWidget(
            text: '\$$price',
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
