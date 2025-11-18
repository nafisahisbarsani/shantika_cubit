import 'package:flutter/material.dart';
import 'package:shantika_cubit/ui/color.dart';
import 'package:shantika_cubit/ui/typography.dart';

class CustomCarouselCard extends StatelessWidget {
  final String imagePath;
  final bool isNetwork;
  final String title;
  final String subtitle;
  final double borderRadius;
  final double height;
  final double width;
  final BoxFit imageFit;
  final TextStyle titleStyle;
  final TextStyle subtitleStyle;
  final EdgeInsets padding;
  final MainAxisAlignment contentAlignment;

  const CustomCarouselCard({
    super.key,
    required this.imagePath,
    this.isNetwork = false,
    required this.title,
    required this.subtitle,
    this.borderRadius = 12.0,
    this.height = 160,
    this.width = double.infinity,
    this.imageFit = BoxFit.cover,
    this.titleStyle = const TextStyle(
      color: black00,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
    this.subtitleStyle = const TextStyle(
      color: black00,
      fontSize: 12,
    ),
    this.padding = const EdgeInsets.all(16),
    this.contentAlignment = MainAxisAlignment.end,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: height,
      width: width,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          isNetwork
              ? Image.network(
            imagePath,
            fit: imageFit,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Colors.grey[300],
                alignment: Alignment.center,
                child: const Icon(Icons.broken_image, size: 40),
              );
            },
          )
              : Image.asset(
            imagePath,
            fit: imageFit,
          ),
          Container(
            padding: padding,
            alignment: Alignment.bottomLeft,
            child: Column(
              mainAxisAlignment: contentAlignment,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: smRegular,
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: xsRegular,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
