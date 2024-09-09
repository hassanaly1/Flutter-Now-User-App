import 'package:flutter/material.dart';
import 'package:user_app/utils/reusable_container.dart';
import 'package:user_app/views/google_maps/select_vehicle.dart';

class SearchingForRidersScreen extends StatelessWidget {
  const SearchingForRidersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              const MyHeaderContainer(title: 'Searching For Riders'),
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ReUsableContainer(
                      child: ListTile(
                        // visualDensity: VisualDensity.compact,
                        // dense: true,
                        contentPadding: const EdgeInsets.all(0.0),
                        leading:
                            CircleAvatar(radius: 40, child: Text('$index')),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
