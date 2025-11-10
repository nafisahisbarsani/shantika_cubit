import 'package:flutter/material.dart';
import '../color.dart';
import '../dimension.dart';
import '../typography.dart';

class CustomButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final bool disabled;
  final Gradient? gradient;
  final Color textColor;
  final Color textColorDisabled;
  final Size? maximumSize;
  final Size? minimumSize;
  final Color backgroundColor;
  final Color disabledColor;
  final Border? border;
  final double? width;
  final double height;
  final EdgeInsetsGeometry? padding;

  const CustomButton({
    Key? key,
    required this.child,
    this.onPressed,
    this.disabled = false,
    this.gradient,
    this.textColor = textButtonPrimary,
    this.textColorDisabled = textDisabled,
    this.maximumSize,
    this.minimumSize,
    this.backgroundColor = jacarta800,
    this.border,
    this.disabledColor = bgDisabled,
    this.width,
    this.height = 46,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isEnabled = onPressed != null && !disabled;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        border: border,
        gradient: isEnabled ? gradient : null,
      ),
      child: Material(
        color: gradient == null
            ? (isEnabled ? backgroundColor : disabledColor)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(borderRadius300),
        child: InkWell(
          splashColor: transparentColor,
          borderRadius: BorderRadius.circular(borderRadius300),
          onTap: isEnabled
              ? () {
            FocusManager.instance.primaryFocus?.unfocus();
            onPressed?.call();
          }
              : null,
          child: Padding(
            padding: padding ?? EdgeInsets.zero,
            child: DefaultTextStyle.merge(
              style: smMedium.copyWith(
                color: isEnabled ? textColor : textColorDisabled,
              ),
              textAlign: TextAlign.center,
              child: Center(child: child),
            ),
          ),
        ),
      ),
    );
  }
}
