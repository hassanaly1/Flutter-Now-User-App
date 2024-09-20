import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:user_app/utils/appcolors.dart';
import 'package:user_app/views/home/food_delivery/add_to_cart.dart';
import 'package:user_app/views/home/food_delivery/favourites.dart';

class MyCustomDivider extends StatelessWidget {
  const MyCustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: AppColors.buttonColor,
      thickness: 1.5,
      indent: context.width * 0.05,
      endIndent: context.width * 0.05,
    );
  }
}

class SizeBetweenWidgets extends StatelessWidget {
  const SizeBetweenWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: context.height * 0.02);
  }
}

class MyBackIcon extends StatelessWidget {
  final Color? color;

  const MyBackIcon({super.key, this.color = Colors.black87});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Get.back(),
      icon: const Icon(LucideIcons.arrowLeft),
      color: color,
    );
  }
}

class MyCartIcon extends StatelessWidget {
  final int? count;
  final Color? color;

  const MyCartIcon({
    super.key,
    this.color,
    this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: IconButton(
        onPressed: () {
          Get.to(() => const AddToCartScreen(),
              transition: Transition.upToDown);
        },
        icon: Badge.count(
          count: count ?? 0,
          child: Icon(
            LucideIcons.shoppingCart,
            color: color ?? AppColors.blackTextColor,
          ),
        ),
      ),
    );
  }
}

class MyFavouriteIcon extends StatelessWidget {
  final int? count;
  final Color? color;

  const MyFavouriteIcon({
    super.key,
    this.color,
    this.count,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      visualDensity: VisualDensity.compact,
      onPressed: () {
        Get.to(() => const FavouritesScreen(), transition: Transition.upToDown);
      },
      icon: Badge.count(
        count: count ?? 0,
        child: Icon(
          LucideIcons.heart,
          color: color ?? AppColors.blackTextColor,
        ),
      ),
    );
  }
}
