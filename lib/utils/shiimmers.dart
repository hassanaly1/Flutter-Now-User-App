import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MyListTileShimmerEffect extends StatelessWidget {
  const MyListTileShimmerEffect({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Shimmer.fromColors(
          baseColor: const Color(0xffE6E8EB),
          highlightColor: const Color(0xffF9F9FB),
          child: ListView.builder(
            itemBuilder: (context, index) => ListTile(
              titleAlignment: ListTileTitleAlignment.top,
              leading: Shimmer.fromColors(
                baseColor: const Color(0xffE6E8EB),
                highlightColor: const Color(0xffF9F9FB),
                child: const CircleAvatar(
                  radius: 30,
                ),
              ),
              title: Shimmer.fromColors(
                baseColor: const Color(0xffE6E8EB),
                highlightColor: const Color(0xffF9F9FB),
                child: Container(
                  width: 150,
                  height: 15,
                  color: Colors.white,
                ),
              ),
              subtitle: Shimmer.fromColors(
                baseColor: const Color(0xffE6E8EB),
                highlightColor: const Color(0xffF9F9FB),
                child: Container(
                  width: 150,
                  height: 10,
                  color: Colors.white70,
                ),
              ),
            ),
          )),
    );
  }
}
