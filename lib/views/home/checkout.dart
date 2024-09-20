import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:user_app/controllers/food_controller.dart';
import 'package:user_app/helpers/appbar.dart';
import 'package:user_app/helpers/custom_text.dart';
import 'package:user_app/helpers/reusable_container.dart';
import 'package:user_app/utils/appcolors.dart';
import 'package:user_app/utils/common_widgets.dart';
import 'package:user_app/views/home/food_delivery/add_to_cart.dart';
import 'package:user_app/views/home/success.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final MyFoodController _controller = Get.find<MyFoodController>();

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
            child: const CustomBottomNavigationBarButton(title: 'Place Order'),
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
                  Obx(
                    () => SizedBox(
                      height: context.height * 0.3,
                      child: _controller.cartItems.isEmpty
                          ? Center(
                              child: Image.asset(
                              'assets/images/empty_cart.png',
                            ))
                          : ListView.builder(
                              itemCount: _controller.cartItems.length,
                              itemBuilder: (context, index) {
                                final cartItem = _controller.cartItems[index];
                                return CustomAddToCartWidget(model: cartItem);
                              },
                            ),
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
                  Obx(
                    () => OrderSummaryWidget(
                        title: 'SubTotal',
                        price: _controller.calculateTotalPrice()),
                  ),
                  Obx(() => OrderSummaryWidget(
                      title: 'Delivery',
                      price: _controller.cartItems.isEmpty ? 0.0 : 5.0)),
                  Obx(
                    () => OrderSummaryWidget(
                        title: 'Total',
                        price: _controller.calculateTotalPriceWithDelivery()),
                  ),
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
  final double price;

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
