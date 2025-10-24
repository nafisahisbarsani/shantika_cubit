import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shantika_cubit/ui/color.dart';
import 'package:shantika_cubit/ui/typography.dart';

class CustomArrow extends StatelessWidget {
  final String? title;
  final VoidCallback? onBack;
  final Color iconColor;
  final Color textColor;
  final Widget? suffixIcon;

  const CustomArrow({
    Key? key,
    this.title,
    this.onBack,
    this.iconColor = black950,
    this.textColor = black950,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        top: 30,
        right: 30,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: onBack ?? () => Navigator.pop(context),
                icon: Icon(
                  Icons.arrow_back,
                  color: iconColor,
                  size: 24,
                ),
              ),
              if (title != null) ...[
                SizedBox(width: 12),
                Text(title!, style: xlMedium),
              ],
            ],
          ),
          if (suffixIcon != null) suffixIcon!,
        ],
      ),
    );
  }
}
