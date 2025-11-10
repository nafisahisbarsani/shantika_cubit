import 'package:flutter/material.dart';
import 'package:shantika_cubit/ui/color.dart';

class CustomCarouselCard extends StatelessWidget {
  final String imagePath;
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
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: imageFit,
        ),
      ),
      child: Container(
        padding: padding,
        alignment: Alignment.bottomLeft,
        child: Column(
          mainAxisAlignment: contentAlignment,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: titleStyle,
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: subtitleStyle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
