import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    this.statusIcon,
    this.statusIconSize = 14,
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

  final String? statusIcon; // ✅ SVG asset path (e.g. 'assets/icons/check.svg')
  final double statusIconSize; // ✅ icon size

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

              // ✅ Status badge (text + optional SVG icon)
              if (statusText != null && statusText!.isNotEmpty)
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: statusColor ?? Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (statusIcon != null) ...[
                          SvgPicture.asset(
                            statusIcon!,
                            width: statusIconSize,
                            height: statusIconSize,
                            color: statusTextColor ?? black00,
                          ),
                          const SizedBox(width: 4),
                        ],
                        Text(
                          statusText!,
                          style: xsMedium.copyWith(
                            color: statusTextColor ?? black00,
                          ),
                        ),
                      ],
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
