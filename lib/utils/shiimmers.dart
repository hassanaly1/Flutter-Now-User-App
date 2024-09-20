import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
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

class MySingleLineShimmerEffect extends StatelessWidget {
  final int count;

  const MySingleLineShimmerEffect({super.key, this.count = 1});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: AppColors.shimmerBaseColor,
        highlightColor: AppColors.shimmerHighlightColor,
        child: Shimmer.fromColors(
            baseColor: AppColors.shimmerBaseColor,
            highlightColor: AppColors.shimmerHighlightColor,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: count,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    height: 15,
                    color: AppColors.whiteTextColor,
                  ),
                );
              },
            )));
  }
}

class MyListTileWithTrailingShimmerEffect extends StatelessWidget {
  const MyListTileWithTrailingShimmerEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.shimmerBaseColor,
      highlightColor: AppColors.shimmerHighlightColor,
      child: ListTile(
        leading: Shimmer.fromColors(
          baseColor: AppColors.shimmerBaseColor,
          highlightColor: AppColors.shimmerHighlightColor,
          child: const CircleAvatar(radius: 20),
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
        trailing: Shimmer.fromColors(
          baseColor: AppColors.shimmerBaseColor,
          highlightColor: AppColors.shimmerHighlightColor,
          child: const CircleAvatar(radius: 20),
        ),
      ),
    );
  }
}

class MyCarouselShimmerEffect extends StatelessWidget {
  const MyCarouselShimmerEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Shimmer for carousel
        Shimmer.fromColors(
          baseColor: AppColors.shimmerBaseColor,
          highlightColor: AppColors.shimmerHighlightColor,
          child: Container(
            height: context.height * 0.2, // Same height as the actual carousel
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: AppColors.whiteTextColor,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        const SizedBox(height: 10),
        // Shimmer for AnimatedSmoothIndicator
        Shimmer.fromColors(
          baseColor: AppColors.shimmerBaseColor,
          highlightColor: AppColors.shimmerHighlightColor,
          child: Center(
            child: AnimatedSmoothIndicator(
              activeIndex: 0,
              // Since it’s a shimmer, we can hardcode a default index
              count: 5,
              // Number of placeholder dots
              effect: ExpandingDotsEffect(
                dotHeight: 12,
                dotWidth: 12,
                activeDotColor: AppColors.shimmerBaseColor,
                // Shimmer color for active dot
                dotColor: AppColors.shimmerHighlightColor
                    .withOpacity(0.5), // Shimmer for inactive dots
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class MyTabBarShimmerEffect extends StatelessWidget {
  const MyTabBarShimmerEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Shimmer.fromColors(
          baseColor: AppColors.shimmerBaseColor,
          highlightColor: AppColors.shimmerHighlightColor,
          child: TabBar(
            tabs: [
              Container(
                width: 80,
                height: 30,
                color: AppColors.whiteTextColor,
              ),
              Container(
                width: 80,
                height: 30,
                color: AppColors.whiteTextColor,
              ),
            ],
          ),
        ),
        Expanded(
          child: Shimmer.fromColors(
            baseColor: AppColors.shimmerBaseColor,
            highlightColor: AppColors.shimmerHighlightColor,
            child: TabBarView(
              children: [
                // Placeholder for tab 1
                Container(
                  margin: const EdgeInsets.all(20),
                  color: AppColors.whiteTextColor,
                ),
                // Placeholder for tab 2
                Container(
                  margin: const EdgeInsets.all(20),
                  color: AppColors.whiteTextColor,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
