import 'package:get/get.dart';
import 'package:user_app/models/food_item_model.dart';
import 'package:user_app/utils/appcolors.dart';
import 'package:user_app/utils/toast.dart';

class MyFoodController extends GetxController {
  var foodItemsList = <MyFoodItemModel>[].obs;
  var favorites = <MyFoodItemModel>[].obs;
  var cartItems = <MyFoodItemModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    foodItemsList.assignAll(foodItems);
  }

  void addOrRemoveFromCart(item) {
    if (cartItems.contains(item)) {
      cartItems.remove(item);
      MyCustomErrorToast(title: 'Removed from cart').showToast(Get.context!);
    } else {
      cartItems.add(item);
      MyCustomSuccessToast(
              title: 'Added to cart', backgroundColor: AppColors.successColor)
          .showToast(Get.context!);
    }
  }

  void addOrRemoveFromFavorites(item) {
    if (favorites.contains(item)) {
      favorites.remove(item);
      MyCustomErrorToast(title: 'Removed from favorites')
          .showToast(Get.context!);
    } else {
      favorites.add(item);
      MyCustomSuccessToast(
              title: 'Added to favorites',
              backgroundColor: AppColors.successColor)
          .showToast(Get.context!);
    }
  }

  double calculateTotalPrice() {
    double total = 0.0;
    for (var item in cartItems) {
      total += item.price ?? 0.0;
      return total;
    }
    return total;
  }

  double calculateTotalPriceWithDelivery() {
    double total = 0.0;
    for (var item in cartItems) {
      total += item.price ?? 0.0;
      return total + 5.0;
    }
    return total;
  }
}
