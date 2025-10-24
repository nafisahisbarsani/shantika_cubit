import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shantika_cubit/ui/typography.dart';

import '../color.dart';
import '../dimension.dart';
import '../style.dart';
import 'custom_form_field.dart' show CustomFormField;

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    this.titleSection,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.placeholder,
    this.errorText,
    this.prefixText,
    this.focusNode,
    this.obsecureText,
    this.validator,
    this.helper,
    this.helperText,
    this.onChanged,
    this.onSubmit,
    this.suffixIcon,
    this.maxLines,
    this.minLines,
    this.defaultValue,
    this.enabled,
    this.hintColor,
    this.onTap,
    this.inputFormatters,
    this.prefix,
    this.textValidator,
    this.prefixIcon,
    this.textInputAction,
    this.readOnly,
    this.suffixIconConstraints,
    this.subtitleSection,
    this.verticalContentPadding,
  });

  final String? titleSection;
  final String? subtitleSection;
  final BoxConstraints? suffixIconConstraints;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? defaultValue;
  final String? placeholder;
  final String? errorText;
  final String? prefixText;
  final Widget? helper;
  final String? helperText;
  final FocusNode? focusNode;
  final bool? obsecureText;
  final Function(String)? onChanged;
  final Function(String)? onSubmit;
  final String? Function(String)? validator;
  final Widget? suffixIcon;
  final int? maxLines;
  final int? minLines;
  final bool? enabled;
  final void Function()? onTap;
  final Color? hintColor;
  final Widget? prefix;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefixIcon;
  final String? textValidator;
  final TextInputAction? textInputAction;
  final bool? readOnly;
  final double? verticalContentPadding;

  @override
  Widget build(BuildContext context) {
    if (defaultValue != null) {
      controller.text = defaultValue ?? "";
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (titleSection != null && titleSection!.isNotEmpty) ...[
          RichText(
            text: TextSpan(
              style: xsRegular.copyWith(color: textDarkSecondary),
              children: [
                TextSpan(text: titleSection!.replaceAll('*', '').trim()),
                if (titleSection!.contains('*'))
                  TextSpan(
                    text: ' *',
                    style: TextStyle(color: textPrimary),
                  ),
              ],
            ),
          ),
          SizedBox(height: 11),
        ],
        if (subtitleSection != null && subtitleSection!.isNotEmpty) ...[
          Text(
            subtitleSection!,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: black00,
            ),
          ),
          SizedBox(height: 11),
        ],

        TextFormField(
          readOnly: readOnly ?? false,
          onTap: onTap,
          textInputAction: textInputAction ?? TextInputAction.next,
          controller: controller,
          focusNode: focusNode,
          keyboardType: keyboardType,
          obscureText: obsecureText ?? false,
          style: xsRegular,
          enabled: enabled,
          maxLines: maxLines ?? 1,
          minLines: minLines,
          onFieldSubmitted: onSubmit,
          inputFormatters: inputFormatters,
          cursorColor: jacarta800,
          decoration: InputDecoration(
            hintText: placeholder ?? '',
            hintStyle: xsRegular.copyWith(color: bgDisabled),

            // Border styles
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300, width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: jacarta800, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.red.shade400, width: 2),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.red.shade400, width: 2),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade200, width: 2),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 12,
              vertical: verticalContentPadding ?? 12,
            ),
            suffixIcon: suffixIcon,
            suffixIconConstraints: suffixIconConstraints,
            prefixIcon: prefixIcon,
            prefixIconConstraints: const BoxConstraints(
              minHeight: 20,
              minWidth: 20,
            ),
            prefix: prefix,
            prefixText: prefixText,
            prefixStyle: TextStyle(color: Colors.black87, fontSize: 14),
            filled: true,
            fillColor: enabled == false ? Colors.grey.shade50 : Colors.white,
            errorText: errorText,
            errorStyle: TextStyle(fontSize: 12, color: Colors.red.shade600),
          ),
          validator: (input) {
            if (validator != null) {
              return validator!(input ?? '');
            }
            return null;
          },
          onChanged: onChanged,
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
        ),
        if (helper != null || helperText != null) ...[
          const SizedBox(height: 6),
          if (helper != null) helper!,
          if (helperText != null)
            Text(
              helperText!,
              style: TextStyle(fontSize: 12, color: black00),
            ),
        ],
      ],
    );
  }
}
