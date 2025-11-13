import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shantika_cubit/ui/color.dart';

class CustomDatePicker {
  static Future<DateTime?> show({
    required BuildContext context,
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
    Function(DateTime)? onChanged,
  }) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: firstDate ?? DateTime.now(),
      lastDate: lastDate ?? DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: primaryColor,
              onPrimary: Colors.white,
              onSurface: black950,
            ),
          ),
          child: child!,
        );
      },
    );

    if (selectedDate != null && onChanged != null) {
      onChanged(selectedDate);
    }

    return selectedDate;
  }

  static String format(DateTime date) => DateFormat('dd-MM-yyyy').format(date);
}
