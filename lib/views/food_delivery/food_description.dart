import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:readmore/readmore.dart';
import 'package:user_app/utils/appcolors.dart';
import 'package:user_app/utils/common_widgets.dart';
import 'package:user_app/utils/custom_text.dart';
import 'package:user_app/utils/reusable_container.dart';
import 'package:user_app/views/food_delivery/common_widgets/custom_food_widget.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          decoration: const BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircularIcon(
                    onTap: () {},
                    backgroundColor: AppColors.buttonColor.withOpacity(0.9),
                    icon: LucideIcons.minus,
                    color: AppColors.blackTextColor,
                  ),
                  const SizedBox(width: 8.0),
                  const CustomTextWidget(
                    text: '7',
                    fontSize: 18.0,
                    textColor: AppColors.whiteTextColor,
                  ),
                  const SizedBox(width: 8.0),
                  CircularIcon(
                    onTap: () {},
                    backgroundColor: AppColors.buttonColor.withOpacity(0.9),
                    icon: LucideIcons.plus,
                    color: AppColors.blackTextColor,
                  ),
                ],
              ),
              SizedBox(
                width: 150,
                child: ReUsableContainer(
                  width: 150,
                  verticalPadding: context.height * 0.02,
                  height: 50,
                  color: AppColors.buttonColor.withOpacity(0.9),
                  child: const Center(
                      child: CustomTextWidget(
                    text: 'Add to cart',
                    fontSize: 16,
                    textColor: AppColors.blackTextColor,
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.center,
                  )),
                ),
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Image
              const DetailsImageContainer(
                imageLink:
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcReAU10nVk5FVvnYPvmyd9m7kGtKFc22fb7sw&s',
              ),
              //Description
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Ratings&Shares
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(CupertinoIcons.star_circle_fill,
                                color: AppColors.buttonColor),
                            const SizedBox(width: 6.0),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                      text: '5.0 ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge),
                                  const TextSpan(text: '(199)')
                                ],
                              ),
                            )
                          ],
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              CupertinoIcons.heart_fill,
                              color: AppColors.errorColor,
                            ))
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    //Price
                    Row(
                      children: [
                        ReUsableContainer(
                          color: AppColors.successColor.withOpacity(0.7),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4.0),
                          child: const CustomTextWidget(
                            text: '25% OFF',
                            textColor: AppColors.secondaryColor,
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        const CustomTextWidget(
                          text: '\$ 100',
                          fontSize: 24.0,
                          fontWeight: FontWeight.w600,
                        ),
                        const SizedBox(width: 8.0),
                        ReUsableContainer(
                          color: AppColors.errorColor.withOpacity(0.7),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4.0),
                          child: const CustomTextWidget(
                            text: 'Discounted Price',
                            textColor: AppColors.whiteTextColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    //Title
                    const CustomTextWidget(
                      text: 'Arabian Pasta',
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    ),
                    const SizedBox(height: 8.0),
                    //Stock
                    const CustomTextWidget(text: 'Status'),
                    const CustomTextWidget(
                      text: 'In Stock',
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),

                    //Checkout
                    ReUsableContainer(
                      verticalPadding: context.height * 0.02,
                      height: 50,
                      color: AppColors.buttonColor.withOpacity(0.8),
                      child: const Center(
                          child: CustomTextWidget(
                        text: 'Checkout',
                        fontSize: 16,
                        textColor: AppColors.blackTextColor,
                        fontWeight: FontWeight.w400,
                        textAlign: TextAlign.center,
                      )),
                    ),

                    const CustomTextWidget(
                      text: 'Description',
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                    const SizedBox(height: 8.0),
                    const ReadMoreText(
                      'Arabian Pasta is a fusion dish that combines traditional pasta with Middle Eastern flavors, creating a unique and aromatic meal. Typically, this pasta features a rich and creamy sauce infused with spices like cumin, coriander, and cinnamon, alongside ingredients such as garlic, onions, and peppers. Often garnished with toasted pine nuts, fresh herbs, and sometimes topped with grilled chicken or lamb, Arabian Pasta offers a delightful blend of creamy textures and bold, exotic spices, making it a flavorful twist on a classic pasta dish.',
                      trimLines: 2,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'Show More',
                      trimExpandedText: 'Less',
                      moreStyle:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                      lessStyle:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomTextWidget(
                          text: 'Reviews (199)',
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(LucideIcons.arrowRight))
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailsImageContainer extends StatelessWidget {
  final String imageLink;

  const DetailsImageContainer({
    super.key,
    required this.imageLink,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.blackTextColor,
      child: Stack(
        children: [
          SizedBox(
            height: 200,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child:
                    Image(image: NetworkImage(imageLink), fit: BoxFit.contain),
              ),
            ),
          ),
          const Positioned(
              left: 0,
              top: 0,
              child: MyBackIcon(
                color: Colors.white,
              )),
        ],
      ),
    );
  }
}
