import 'package:flutter/material.dart';
import 'package:user_app/utils/appbar.dart';
import 'package:user_app/utils/tabbar.dart';

class MainRideShareScreen extends StatefulWidget {
  const MainRideShareScreen({super.key});

  @override
  State<MainRideShareScreen> createState() => _MainRideShareScreenState();
}

class _MainRideShareScreenState extends State<MainRideShareScreen> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: CustomAppbar(title: 'Ride Share'),
            body: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  CustomTabBar(
                    title1: 'Rides',
                    title2: 'My Rides',
                  )
                ],
              ),
            )),
      ),
    );
  }
}
