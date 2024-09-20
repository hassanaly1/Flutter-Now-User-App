import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:user_app/utils/toast.dart';

class MyPackageAndDocumentController extends GetxController {
  var firstNameOfReceiver = ''.obs;
  var lastNameOfReceiver = ''.obs;
  var phoneNumberOfReceiver = ''.obs;
  var addressOfReceiver = ''.obs;
  var cityOfReceiver = ''.obs;
  var stateOfReceiver = ''.obs;
  var countryOfReceiver = ''.obs;
  var zipCodeOfReceiver = ''.obs;

  final RxList<File> selectedImages = <File>[].obs;
  final ImagePicker _picker = ImagePicker();

  Future<void> pickImages() async {
    if (selectedImages.length >= 8) {
      MyCustomErrorToast(title: 'Max 8 images allowed').showToast(Get.context!);
      return;
    } else {
      final pickedFiles = await _picker.pickMultiImage(
        imageQuality: 80,
        limit: 8,
      );
      if (pickedFiles.isNotEmpty) {
        for (var pickedFile in pickedFiles) {
          if (selectedImages.length < 8) {
            selectedImages.add(File(pickedFile.path));
          }
        }
      }
    }
  }

  void removeImage(int index) {
    selectedImages.removeAt(index);
  }
}
