import 'package:flutter/material.dart';
import 'package:shantika_cubit/ui/dimension.dart';
import 'package:shantika_cubit/ui/typography.dart';
import '../color.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.child,
    this.padding = EdgeInsets.zero,
    this.margin = EdgeInsets.zero,
    this.borderRadius = BorderRadius.zero,
    this.borderSide = BorderSide.none,
    this.shadow,
    this.onTap,
    this.color = black00,
    this.width,
    this.height,
    this.statusText,
    this.statusColor,
    this.statusTextColor,
  });

  final Widget child;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final BorderRadius borderRadius;
  final BorderSide borderSide;
  final List<BoxShadow>? shadow;
  final Function()? onTap;
  final Color color;
  final double? width;
  final double? height;
  final String? statusText;
  final Color? statusColor;
  final Color? statusTextColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        boxShadow: shadow,
      ),
      child: Material(
        color: color,
        shape: RoundedRectangleBorder(
          side: borderSide,
          borderRadius: borderRadius,
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: borderRadius,
          child: Stack(
            children: [
              Padding(
                padding: padding,
                child: child,
              ),

              if (statusText != null && statusText!.isNotEmpty)
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: statusColor ?? Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      statusText!,
                      style: xsMedium.copyWith(color: black00)
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

}
