import 'package:evamp_task_app/components/shimmer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    Key? key,
    required this.imagePath,
    this.fit = BoxFit.cover,
    this.height = double.infinity,
    this.shimmerRadius = 5,
    this.width,
    this.color,
    this.borderRadius = BorderRadius.zero,
  }) : super(key: key);

  final String imagePath;
  final BoxFit fit;
  final double height;
  final double? width;
  final double shimmerRadius;
  final Color? color;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: borderRadius,
      child: _getImageWidget(imagePath, size),
    );
  }

  Widget _getImageWidget(String path, Size size) {
    if (path.startsWith('http') ||
        path.startsWith('https') ||
        path.startsWith('www.')) {
      return CachedNetworkImage(
        imageUrl: path,
        width: width ?? size.width,
        height: height,
        fit: fit,
        placeholder: (context, url) => ShimmerWidget(
          height: height,
          width: width ?? size.width,
          radius: shimmerRadius,
        ),
        errorWidget: (context, url, error) => Image.asset(
          'assets/images/dummy.png',
          width: width ?? size.width,
          height: height,
          fit: BoxFit.contain,
        ),
      );
    } else if (path.endsWith("svg")) {
      return SvgPicture.asset(
        path,
        fit: fit,
        width: width ?? size.width,
        height: height,
        color: color,
      );
    } else {
      return Image.asset(
        path,
        fit: fit,
        width: width ?? size.width,
        height: height,
        color: color,
        errorBuilder: (context, _, stackTrace) {
          return Image.asset(
            'assets/images/dummy.png',
            width: width ?? size.width,
            height: height,
            fit: BoxFit.contain,
          );
        },
      );
    }
  }
}
