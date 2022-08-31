import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({
    Key? key,
    required this.height,
    this.width = double.infinity,
    this.radius = 0,
    this.baseColor = Colors.black12,
    this.boxColor = Colors.white,
    this.highlightColor,
    this.shimmerDirection = ShimmerDirection.ltr,
    this.period = const Duration(milliseconds: 1500),
  }) : super(key: key);

  final double width;
  final double height;
  final double radius;
  final Color? baseColor;
  final Color? highlightColor;
  final Color? boxColor;
  final ShimmerDirection shimmerDirection;
  final Duration period;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor!,
      highlightColor: highlightColor ?? Colors.grey[300]!,
      direction: shimmerDirection,
      period: period,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: boxColor,
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
