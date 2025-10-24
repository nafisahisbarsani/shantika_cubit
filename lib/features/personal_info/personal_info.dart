import 'package:flutter/material.dart';
import 'package:shantika_cubit/ui/color.dart';
import 'package:shantika_cubit/ui/dimension.dart';
import 'package:shantika_cubit/ui/typography.dart';
import '../../ui/shared_widget/custom_arrow.dart';
import '../../ui/shared_widget/custom_button.dart';
import '../../ui/shared_widget/custom_text_form_field.dart';

class PersonalInfo extends StatelessWidget {
  PersonalInfo({super.key});
  final TextEditingController _birthDateController = TextEditingController();
  final ValueNotifier<String> selectedGender = ValueNotifier('Pria');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black00,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            _buildHeader(),
            _buildProfileHeader(),
            _buildInput(context),
            _buildButton()
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      decoration: BoxDecoration(
        color: black00,
        boxShadow: [
          BoxShadow(
            color: black100,
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: CustomArrow(title: "Informasi Pribadi"),
    );
  }

  Widget _buildProfileHeader() {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: black300,
                child: Icon(
                  Icons.person,
                  size: 40,
                  color: Colors.black12,
                ),
              ),
            ],
          ),
          SizedBox(width: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Anastasya Carolina",
                style: mdMedium,
              ),
              SizedBox(height: 6),
              Row(
                children: [
                  Text(
                    "Member New Shantika",
                    style: smMedium.copyWith(color: textDarkTertiary),
                  ),
                  SizedBox(width: 4),
                  Icon(Icons.check_circle, size: 14, color: black00),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInput(BuildContext context) {  // Add context parameter
    return Padding(
      padding: EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
        bottom: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextFormField(
            titleSection: 'Nama Lengkap',
            titleColor: black950,
            maxLines: 1,
          ),
          SizedBox(height: space400),
          CustomTextFormField(
            titleSection: 'Nomor Telepon',
            titleColor: black950,
            maxLines: 1,
          ),
          SizedBox(height: space400),
          CustomTextFormField(
            titleSection: 'Email',
            titleColor: black950,
            maxLines: 1,
          ),
          SizedBox(height: space400),
          Row(
            children: [
              Expanded(
                child: CustomTextFormField(
                  titleColor: black950,
                  titleSection: 'Tempat Lahir',
                ),
              ),
              SizedBox(width: 15),
              Expanded(
                child: GestureDetector(
                  onTap: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    if (date != null) {
                      final formattedDate = "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
                      _birthDateController.text = formattedDate;
                    }
                  },
                  child: AbsorbPointer(
                    child: CustomTextFormField(
                      controller: _birthDateController,
                      titleSection: 'Tanggal Lahir',
                      titleColor: black950,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.calendar_today,
                          size: 20,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: space400),
          Text("Gender", style: xsRegular),
          _buildGenderSelector(),
          SizedBox(height: space400),
          CustomTextFormField(
            titleSection: 'Alamat',
            titleColor: black950,
            maxLines: 3,
          ),
        ],
      ),
    );
  }

  Widget _buildButton() {
    return Padding(
      padding: EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
      ),
      child: Center(
        child: CustomButton(
          onPressed: () {},
          child: Text("Simpan"),
        ),
      ),
    );
  }
  Widget _buildGenderSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: space300),
        ValueListenableBuilder(
          valueListenable: selectedGender,
          builder: (context, gender, _) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: shimmerHighlightColor,
                borderRadius: BorderRadius.circular(borderRadius300),
                border: Border.all(color: borderNeutralLight, width: 2),
              ),
              child: Row(
                children: [
                  _buildGenderOption('Pria', gender == 'Pria'),
                  SizedBox(width: space800),
                  _buildGenderOption('Wanita', gender == 'Wanita'),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildGenderOption(String label, bool isSelected) {
    return GestureDetector(
      onTap: () => selectedGender.value = label,
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? textButtonSecondaryPressed : black500,
            ),
            child: Center(
              child: Icon(
                label == 'Pria' ? Icons.male : Icons.female,
                size: 18,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(width: space250),
          Text(
            label,
            style: smMedium.copyWith(
              color: isSelected ? textButtonSecondaryPressed : black500,
            ),
          ),
        ],
      ),
    );
  }
}