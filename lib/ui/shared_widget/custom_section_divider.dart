import 'package:flutter/material.dart';
import 'package:shantika_cubit/ui/color.dart';
import 'package:shantika_cubit/ui/typography.dart';

class CustomSectionDivider extends StatelessWidget {
  final String text;
  final double verticalMargin;
  final double horizontalPadding;
  final double lineHeight;
  final double lineThickness;

  const CustomSectionDivider({
    super.key,
    required this.text,
    this.verticalMargin = 1,
    this.horizontalPadding = 2,
    this.lineHeight = 20,
    this.lineThickness = 3,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: verticalMargin),
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Row(
        children: [
          Container(
            width: lineThickness,
            height: lineHeight,
            color: borderFillPrimary,
          ),
          SizedBox(width: 8),
          // Text
          Text(
            text,
            style:smSemiBold,
          ),
        ],
      ),
    );
  }
}