import 'package:flutter/material.dart';
import '../color.dart';

// ignore: must_be_immutable
class CustomSwitch extends StatefulWidget {
  CustomSwitch({super.key, required this.value, this.onChanged});

  bool value;
  void Function(bool)? onChanged;

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  @override
  Widget build(BuildContext context) {
    final bool isOn = widget.value;

    return GestureDetector(
      onTap: () => widget.onChanged?.call(!isOn),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 40,
        height: 22,
        padding: const EdgeInsets.symmetric(horizontal: 3),
        decoration: BoxDecoration(
          color: isOn ? textPrimaryPressed : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isOn ? textPrimaryPressed : bgSurfaceNeutralDark,
            width: 1.5,
          ),
        ),
        child: Align(
          alignment: isOn ? Alignment.centerRight : Alignment.centerLeft,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              color: isOn ? Colors.white : Colors.grey.shade400,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}
