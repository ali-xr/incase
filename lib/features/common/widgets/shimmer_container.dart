import 'package:flutter/material.dart';
import 'package:Incase/assats/colors/colors.dart';
import 'package:shimmer/shimmer.dart';


class ShimmerContainer extends StatelessWidget {
  final double width;
  final double height;
  final double radius;

  const ShimmerContainer({
    required this.width,
    required this.height,
    this.radius = 4,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: white,
      highlightColor: grey.withOpacity(0.3),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
