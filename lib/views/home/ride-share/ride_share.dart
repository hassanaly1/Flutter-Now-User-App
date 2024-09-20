import 'package:flutter/material.dart';
import 'package:user_app/helpers/appbar.dart';
import 'package:user_app/helpers/reusable_container.dart';
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
          body: ReUsableContainer(
            color: Colors.transparent,
            padding: const EdgeInsets.all(0.0),
            // color: Colors.blueAccent,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Container(
                  color: Colors.transparent,
                  child: const SelectLocationScreen(
                    isRideShareScreen: true,
                  ),
                )),
          )),
    );
  }
}
