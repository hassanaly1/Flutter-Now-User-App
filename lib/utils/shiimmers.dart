import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:user_app/utils/appcolors.dart';

class MyListTileShimmerEffect extends StatelessWidget {
  const MyListTileShimmerEffect({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Shimmer.fromColors(
          baseColor: AppColors.shimmerBaseColor,
          highlightColor: AppColors.shimmerHighlightColor,
          child: ListView.builder(
            itemBuilder: (context, index) => ListTile(
              titleAlignment: ListTileTitleAlignment.top,
              leading: Shimmer.fromColors(
                baseColor: AppColors.shimmerBaseColor,
                highlightColor: AppColors.shimmerHighlightColor,
                child: const CircleAvatar(
                  radius: 30,
                ),
              ),
              title: Shimmer.fromColors(
                baseColor: AppColors.shimmerBaseColor,
                highlightColor: AppColors.shimmerHighlightColor,
                child: Container(
                  width: 150,
                  height: 15,
                  color: AppColors.whiteTextColor,
                ),
              ),
              subtitle: Shimmer.fromColors(
                baseColor: AppColors.shimmerBaseColor,
                highlightColor: AppColors.shimmerHighlightColor,
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
