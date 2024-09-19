import 'dart:async';

import 'package:get/get.dart';

class SearchingForRidersController extends GetxController {
  var isRidersAreLoading = true.obs;
  RxList<bool> showItems = List.generate(10, (_) => false).obs;
  RxList<int> itemTimers = List.generate(10, (_) => 10).obs;

  @override
  void onInit() {
    super.onInit();
    Timer(const Duration(seconds: 5), () {
      isRidersAreLoading.value = false;
      _startShowingItems();
    });
  }

  void _startShowingItems() {
    for (int i = 0; i < showItems.length; i++) {
      Timer(Duration(seconds: i * 5), () {
        showItems[i] = true;
        _startItemTimer(i);
      });
    }
  }

  void _startItemTimer(int index) {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (itemTimers[index] <= 0) {
        showItems[index] = false;
        timer.cancel();
      } else {
        itemTimers[index]--;
      }
    });
  }
}
