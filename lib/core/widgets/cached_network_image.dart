import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mery_comercial_app/core/utils/app_colors_white_theme.dart';
import 'package:shimmer/shimmer.dart';

class CachedNetworkImageWidget extends StatelessWidget {
  final String imgUrl;
  final BorderRadius radius;

  const CachedNetworkImageWidget(
      {required this.imgUrl, required this.radius, super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: radius,
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: imgUrl,
        placeholder: (context, url) => loadingWidget(),
        errorWidget: (context, url, error) => Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.blackColor,
            borderRadius: BorderRadius.circular(12)
          ),
          child: Image.asset(
            '',
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }

  Widget loadingWidget() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withValues(alpha: .8),
      highlightColor: Colors.grey.withValues(alpha: .4),
      period: const Duration(seconds: 1),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: .6),
          borderRadius: radius,
        ),
      ),
    );
  }
}
