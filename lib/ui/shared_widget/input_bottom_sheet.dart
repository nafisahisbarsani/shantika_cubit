import 'package:flutter/material.dart';
import 'package:shantika_cubit/ui/color.dart';
import 'package:shantika_cubit/ui/typography.dart';
import 'package:shantika_cubit/ui/shared_widget/custom_button.dart';
import 'package:shantika_cubit/ui/shared_widget/custom_text_form_field.dart';

class InputBottomSheet extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final VoidCallback onSubmit;

  const InputBottomSheet({
    super.key,
    required this.nameController,
    required this.phoneController,
    required this.emailController,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: bgSurfaceNeutralDark,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          SizedBox(height: 16),
          Text("Data Pemesanan", style: mdMedium),
          SizedBox(height: 12),
          CustomTextFormField(
            titleSection: 'Nama Lengkap',
            controller: nameController,
            maxLines: 1,
            titleColor: black950,
          ),
          SizedBox(height: 16),
          CustomTextFormField(
            titleSection: 'Nomor Telepon',
            keyboardType: TextInputType.phone,
            controller: phoneController,
            maxLines: 1,
            titleColor: black950,
          ),
          SizedBox(height: 16),
          CustomTextFormField(
            titleSection: 'Email',
            controller: emailController,
            maxLines: 1,
            titleColor: black950,
          ),
          SizedBox(height: 24),
          CustomButton(
            onPressed: onSubmit,
            child: Text("Pesan", style: mdMedium.copyWith(color: black00)),
          ),
        ],
      ),
    );
  }
}
