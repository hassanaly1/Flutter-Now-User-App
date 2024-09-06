import 'package:flutter/material.dart';
import 'package:user_app/utils/appbar.dart';

class MySelectVehicleScreen extends StatefulWidget {
  const MySelectVehicleScreen({super.key});

  @override
  State<MySelectVehicleScreen> createState() => _MySelectVehicleScreenState();
}

class _MySelectVehicleScreenState extends State<MySelectVehicleScreen> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        appBar: ReUsableAppBar(
          title: 'Select Vehicle',
          backgroundColor: Colors.red,
        ),
      ),
    );
  }
}
