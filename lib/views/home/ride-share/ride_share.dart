import 'package:flutter/material.dart';
import 'package:user_app/helpers/appbar.dart';
import 'package:user_app/utils/appcolors.dart';
import 'package:user_app/views/home/google_maps/select_location.dart';

class MainRideShareScreen extends StatefulWidget {
  const MainRideShareScreen({super.key});

  @override
  State<MainRideShareScreen> createState() => _MainRideShareScreenState();
}

class _MainRideShareScreenState extends State<MainRideShareScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: const CustomAppbar(title: 'Ride Share'),
          body: ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Container(
              margin: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.whiteTextColor)),
              child: const SelectLocationScreen(
                isRideShareScreen: true,
              ),
            ),
          )),
    );
  }
}
