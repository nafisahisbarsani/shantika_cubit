import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shantika_cubit/ui/color.dart';
import 'package:shantika_cubit/ui/dimension.dart';
import 'package:shantika_cubit/ui/typography.dart';

class CustomTextField extends StatelessWidget {
  final String? title;
  final String? labelText;
  final String? hintText;
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final String? prefixSvg;
  final Widget? suffixIcon;
  final bool readOnly;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final double? width;
  final double height;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final Color? titleColor;
  final Color? hintColor;
  final Color? bgColor;
  final Color? iconColor;
  final double borderRadius;
  final EdgeInsetsGeometry? prefixPadding;

  const CustomTextField({
    super.key,
    this.title,
    this.labelText,
    this.hintText,
    this.controller,
    this.prefixIcon,
    this.prefixSvg,
    this.suffixIcon,
    this.readOnly = false,
    this.onChanged,
    this.onTap,
    this.width,
    this.height = 48,
    this.borderColor,
    this.focusedBorderColor,
    this.titleColor,
    this.hintColor,
    this.bgColor,
    this.iconColor,
    this.borderRadius = borderRadius300,
    this.prefixPadding,
  });

  @override
  Widget build(BuildContext context) {
    final inputDecoration = InputDecoration(
      labelText: labelText,
      hintText: hintText,
      labelStyle: smMedium.copyWith(color: titleColor),
      hintStyle: mdRegular.copyWith(color: hintColor ?? textDarkTertiary),
      floatingLabelBehavior: FloatingLabelBehavior.never,

      filled: true,
      fillColor: bgColor ?? Colors.white,

      border: OutlineInputBorder(
        borderSide: BorderSide(color: borderColor ?? borderNeutralDark!, width: 1),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: focusedBorderColor ?? primaryColor, width: 1.5),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: borderColor ?? borderNeutralDark!, width: 1),
        borderRadius: BorderRadius.circular(borderRadius),
      ),

      prefixIcon: (prefixSvg != null || prefixIcon != null)
          ? Padding(
        padding: prefixPadding ?? const EdgeInsets.only(left: 14, right: 10),
        child: prefixSvg != null
            ? SvgPicture.asset(
          prefixSvg!,
          width: 20,
          height: 20,
          color: iconColor ?? black950,
        )
            : IconTheme(
          data: IconThemeData(color: iconColor ?? black950),
          child: prefixIcon!,
        ),
      )
          : null,
      prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),

      suffixIcon: suffixIcon,
      suffixIconColor: iconColor ?? black950,

      contentPadding: EdgeInsets.symmetric(
        vertical: height / 3,
        horizontal: 16,
      ),
    );

    return Center(
      child: SizedBox(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title != null && title!.isNotEmpty) ...[
              Text(title!, style: smMedium.copyWith(color: titleColor)),
              const SizedBox(height: 6),
            ],
            TextField(
              controller: controller,
              readOnly: readOnly,
              onChanged: onChanged,
              onTap: onTap,
              style: mdRegular,
              decoration: inputDecoration,
            ),
          ],
        ),
      ),
    );
  }
}
