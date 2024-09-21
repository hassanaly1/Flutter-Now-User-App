import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:user_app/controllers/food_controller.dart';
import 'package:user_app/helpers/appbar.dart';
import 'package:user_app/helpers/custom_text.dart';
import 'package:user_app/helpers/reusable_container.dart';
import 'package:user_app/services/google_maps_service.dart';
import 'package:user_app/utils/appcolors.dart';
import 'package:user_app/utils/common_widgets.dart';
import 'package:user_app/utils/toast.dart';
import 'package:user_app/views/home/food_delivery/add_to_cart.dart';
import 'package:user_app/views/home/success.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final MyFoodController _controller = Get.find<MyFoodController>();
  final TextEditingController _addressController = TextEditingController();
  final MyGoogleMapsService placesService = MyGoogleMapsService();
  final RxList<String> _suggestions = <String>[].obs;

  var paymentType = 'Cash'.obs;

  void _onTextChanged(String input) async {
    if (input.isEmpty) {
      _suggestions.clear();
    } else {
      final suggestions = await placesService.getPlaceSuggestions(input);
      _suggestions.value = suggestions;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SafeArea(
        child: Scaffold(
          appBar: const CustomAppbar(title: 'Checkout', showBackArrow: true),
          bottomNavigationBar: InkWell(
            onTap: () {
              if (_controller.cartItems.isNotEmpty) {
                Get.to(() => const SuccessScreen(),
                    transition: Transition.rightToLeft);
              } else {
                MyCustomErrorToast(title: 'Please Add atleast one item to cart')
                    .showToast(context);
              }
            },
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
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _addressController,
                            onChanged: _onTextChanged,
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
                                onTap: () {
                                  _addressController.clear();
                                },
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
                                  borderSide: const BorderSide(
                                      color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(8.0)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: AppColors.errorColor),
                                  borderRadius: BorderRadius.circular(8.0)),
                            ),
                          ),
                          Obx(() => _suggestions.isNotEmpty
                              ? Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: ReUsableContainer(
                                    color:
                                        AppColors.buttonColor.withOpacity(0.2),
                                    verticalPadding: 0.0,
                                    padding: EdgeInsets.zero,
                                    showBackgroundShadow: true,
                                    // height: 500,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const AlwaysScrollableScrollPhysics(),
                                      itemCount: _suggestions.length,
                                      itemBuilder: (context, index) {
                                        return ListTile(
                                          leading: const Icon(
                                            LucideIcons.mapPinned,
                                            color: AppColors.blackTextColor,
                                          ),
                                          trailing: const Icon(
                                            LucideIcons.navigation,
                                            color: AppColors.blackTextColor,
                                          ),
                                          title: CustomTextWidget(
                                              text: _suggestions[index]),
                                          onTap: () async {
                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();

                                            _addressController.text =
                                                _suggestions[index];
                                            _suggestions.clear();
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                )
                              : const SizedBox()),
                        ],
                      )),
                  const CustomTextWidget(
                    text: 'Payment Method',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          child: RadioListTile(
                            value: 'Cash',
                            groupValue: paymentType.value,
                            onChanged: (value) {
                              paymentType.value = value.toString();
                            },
                            visualDensity: VisualDensity.compact,
                            title: const CustomTextWidget(text: 'Cash'),
                          ),
                        ),
                        Flexible(
                          child: RadioListTile(
                            value: 'Card',
                            groupValue: paymentType.value,
                            onChanged: (value) {
                              paymentType.value = value.toString();
                            },
                            visualDensity: VisualDensity.compact,
                            title: const CustomTextWidget(text: 'Card'),
                          ),
                        ),
                      ],
                    ),
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
                        price: _controller.calculateTotalPrice()),
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
