import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:user_app/utils/appcolors.dart';
import 'package:user_app/views/bookings/bookings.dart';
import 'package:user_app/views/chats/messages.dart';
import 'package:user_app/views/home/home.dart';
import 'package:user_app/views/profile/profile.dart';

class MyBottomNavController extends GetxController {
  var selectedIndex = 0.obs;

  void changeTabIndex(int index) {
    selectedIndex.value = index;
  }
}

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({super.key});

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  final MyBottomNavController controller = Get.put(MyBottomNavController());

  final List<Widget> pages = [
    const MyHomeScreen(),
    const MyBookingsScreen(),
    const MyMessageScreen(),
    const MyProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => IndexedStack(
            index: controller.selectedIndex.value,
            children: pages,
          )),
      bottomNavigationBar: Obx(
        () => Theme(
          data: ThemeData(
              splashColor: Colors.transparent,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              useMaterial3: true,
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
              )),
          child: BottomNavigationBar(
            currentIndex: controller.selectedIndex.value,
            onTap: controller.changeTabIndex,
            enableFeedback: false,
            backgroundColor: AppColors.primaryColor,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white38,
            selectedLabelStyle:
                const TextStyle(fontFamily: 'Poppins', fontSize: 12.0),
            unselectedLabelStyle:
                const TextStyle(fontFamily: 'Poppins', fontSize: 12.0),
            iconSize: 24.0,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            // type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(LucideIcons.bookCheck),
                label: 'My Bookings',
              ),
              BottomNavigationBarItem(
                icon: Icon(LucideIcons.messageCircle),
                label: 'Messages',
              ),
              BottomNavigationBarItem(
                icon: Icon(LucideIcons.user),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
