import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final VoidCallback? onTap;

  const ProfileAvatar({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
    // final UniversalController controller = Get.find();
    // return GestureDetector(
    //   onTap: onTap,
    //   child: Obx(
    //     () => CircleAvatar(
    //         radius: 25,
    //         backgroundColor: Colors.white,
    //         backgroundImage: controller.userImageURL.value != ''
    //             ? NetworkImage(controller.userImageURL.value)
    //             : const AssetImage('assets/images/placeholder.png')
    //                 as ImageProvider),
    //   ),
    // );
  }
}
