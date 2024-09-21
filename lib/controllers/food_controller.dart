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
      item.totalCount = 0;
      MyCustomErrorToast(title: 'Removed from cart').showToast(Get.context!);
    } else {
      cartItems.add(item);
      item.totalCount = 1;
      MyCustomSuccessToast(
              title: 'Added to cart', backgroundColor: AppColors.successColor)
          .showToast(Get.context!);
    }
  }

  void addOrRemoveFromFavorites(item) {
    if (favorites.contains(item)) {
      favorites.remove(item);
      item.totalCount = item.totalCount! - 1;
      updateCart(item);
      MyCustomErrorToast(title: 'Removed from favorites')
          .showToast(Get.context!);
    } else {
      favorites.add(item);
      item.totalCount = item.totalCount! + 1;
      updateCart(item);
      MyCustomSuccessToast(
              title: 'Added to favorites',
              backgroundColor: AppColors.successColor)
          .showToast(Get.context!);
    }
  }

  void incrementQuantity(MyFoodItemModel item) {
    item.totalCount = item.totalCount! + 1;
    updateCart(item);
  }

  void decrementQuantity(MyFoodItemModel item) {
    if (item.totalCount! > 1) {
      item.totalCount = item.totalCount! - 1;
      updateCart(item);
    }
  }

  double calculateItemTotalPrice(MyFoodItemModel item) {
    return (item.price! * item.totalCount!);
  }

  void updateCart(MyFoodItemModel item) {
    if (cartItems.contains(item)) {
      cartItems.refresh(); // Refresh the cart to reflect quantity changes
    } else {
      cartItems.add(item);
      cartItems.refresh();
    }
  }

  double calculateTotalPrice() {
    double total = 0.0;
    // Loop through all items in the cart
    for (var item in cartItems) {
      // Calculate the total for each item (unit price * quantity) and add it to the total
      total += (item.price ?? 0.0) * (item.totalCount ?? 1);
    }
    return total;
  }

// double calculateTotalPrice() {
//   double total = 0.0;
//   for (var item in cartItems) {
//     total += item.price ?? 0.0;
//     return total;
//   }
//   return total;
// }
}
