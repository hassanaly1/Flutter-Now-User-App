import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:user_app/utils/appcolors.dart';
import 'package:user_app/views/home/home.dart';

class BottomNavController extends GetxController {
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
  final BottomNavController controller = Get.put(BottomNavController());

  final List<Widget> pages = [
    const HomeScreen(),
    const TabTwo(),
    const TabThree(),
    const TabFour(),
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
            unselectedItemColor: Colors.white60,
            selectedLabelStyle:
                const TextStyle(fontFamily: 'Poppins', fontSize: 10.0),
            unselectedLabelStyle:
                const TextStyle(fontFamily: 'Poppins', fontSize: 10.0),
            iconSize: 24.0,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            // type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(LucideIcons.house),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(LucideIcons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(LucideIcons.messageCircle),
                label: 'Message',
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

class TabTwo extends StatelessWidget {
  const TabTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/app-logo-dark.png'),
          // Replace with your image path
          const Text('Search Tab'),
        ],
      ),
    );
  }
}

class TabThree extends StatelessWidget {
  const TabThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/app-logo-dark.png'),
          // Replace with your image path
          const Text('Messages Tab'),
        ],
      ),
    );
  }
}

class TabFour extends StatelessWidget {
  const TabFour({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/app-logo-dark.png'),
          // Replace with your image path
          const Text('Profile Tab'),
        ],
      ),
    );
  }
}
