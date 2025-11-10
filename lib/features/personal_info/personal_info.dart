import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shantika_cubit/ui/color.dart';
import 'package:shantika_cubit/ui/dimension.dart';
import 'package:shantika_cubit/ui/typography.dart';
import '../../config/service_locator.dart';
import '../../config/user_preference.dart';
import '../../model/user_model.dart';
import '../../ui/shared_widget/custom_arrow.dart';
import '../../ui/shared_widget/custom_button.dart';
import '../../ui/shared_widget/custom_text_form_field.dart';
import '../profile/cubit/update_profile_cubit.dart';

class PersonalInfo extends StatefulWidget {
  final UserModel? user;

  const PersonalInfo({super.key, this.user});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _birthPlaceController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final ValueNotifier<String> selectedGender = ValueNotifier('Pria');

  UserModel? currentUser;
  bool _hasUpdated = false;
  late UserPreference _preference;

  @override
  void initState() {
    super.initState();
    _preference = serviceLocator.get<UserPreference>();

    final savedUser = _preference.getUser();
    currentUser = savedUser ?? widget.user;

    _loadUserData();
  }

  void _loadUserData() {
    if (currentUser != null) {
      _nameController.text = currentUser!.name ?? '';
      _phoneController.text = currentUser!.phone ?? '';
      _emailController.text = currentUser!.email ?? '';
      _birthPlaceController.text = currentUser!.birthPlace ?? '';
      _birthDateController.text = currentUser!.birth ?? '';
      _addressController.text = currentUser!.address ?? '';

      if (currentUser!.gender == 'Male') {
        selectedGender.value = 'Pria';
      } else if (currentUser!.gender == 'Female') {
        selectedGender.value = 'Wanita';
      } else {
        selectedGender.value = 'Pria'; // default
      }
    }
  }

  void _updateUserData(UserModel newUser) {
    setState(() {
      currentUser = newUser;
      _hasUpdated = true;
    });

    _nameController.text = newUser.name ?? '';
    _phoneController.text = newUser.phone ?? '';
    _emailController.text = newUser.email ?? '';
    _birthPlaceController.text = newUser.birthPlace ?? '';
    _birthDateController.text = newUser.birth ?? '';
    _addressController.text = newUser.address ?? '';

    // Update gender
    if (newUser.gender == 'Male') {
      selectedGender.value = 'Pria';
    } else if (newUser.gender == 'Female') {
      selectedGender.value = 'Wanita';
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _birthPlaceController.dispose();
    _birthDateController.dispose();
    _addressController.dispose();
    selectedGender.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateProfileCubit()..init(),
      child: BlocListener<UpdateProfileCubit, UpdateProfileState>(
        listener: (context, state) {
          if (state is UpdateProfileStateSuccess) {
            _updateUserData(state.user);

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Profil berhasil diperbarui'),
                backgroundColor: successColor,
                duration: Duration(seconds: 2),
              ),
            );

            Future.delayed(Duration(milliseconds: 500), () {
              if (mounted) {
                Navigator.pop(context, true);               }
            });
          } else if (state is UpdateProfileStateError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: errorColor,
              ),
            );
          }
        },
        child: WillPopScope(
          onWillPop: () async {
            if (_hasUpdated && currentUser != null) {
              Navigator.pop(context, currentUser);
              return false;
            }
            return true;
          },
          child: Scaffold(
            backgroundColor: black00,
            body: SingleChildScrollView(
              padding: EdgeInsets.all(12),
              child: Column(
                children: [
                  _buildHeader(),
                  _buildProfileHeader(),
                  _buildInput(context),
                  _buildButton(context)
                ],
              ),
            ),
          ),
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
      padding: EdgeInsets.only(left: 16, right: 16, top: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: black300,
                backgroundImage: currentUser?.avatarUrl != null &&
                    currentUser!.avatarUrl!.isNotEmpty &&
                    currentUser!.avatarUrl != 'https://sandbox.newshantika.co.id/storage'
                    ? NetworkImage(currentUser!.avatarUrl!)
                    : null,
                child: currentUser?.avatarUrl == null ||
                    currentUser!.avatarUrl!.isEmpty ||
                    currentUser!.avatarUrl == 'https://sandbox.newshantika.co.id/storage'
                    ? Icon(Icons.person, size: 40, color: Colors.black12)
                    : null,
              ),
            ],
          ),
          SizedBox(width: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                currentUser?.name ?? "User",
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
                  Icon(Icons.check_circle, size: 14, color: textDarkTertiary),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInput(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextFormField(
            controller: _nameController,
            titleSection: 'Nama Lengkap',
            titleColor: black950,
            maxLines: 1,
          ),
          SizedBox(height: space400),
          CustomTextFormField(
            controller: _phoneController,
            titleSection: 'Nomor Telepon',
            titleColor: black950,
            maxLines: 1,
          ),
          SizedBox(height: space400),
          CustomTextFormField(
            controller: _emailController,
            titleSection: 'Email',
            titleColor: black950,
            maxLines: 1,
          ),
          SizedBox(height: space400),
          Row(
            children: [
              Expanded(
                child: CustomTextFormField(
                  controller: _birthPlaceController,
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
                      final formattedDate =
                          "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
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
            controller: _addressController,
            titleSection: 'Alamat',
            titleColor: black950,
            maxLines: 3,
          ),
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context) {
    return BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
      builder: (context, state) {
        final isLoading = state is UpdateProfileStateLoading;

        return Padding(
          padding: EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Center(
            child: CustomButton(
              onPressed: isLoading
                  ? null
                  : () {
                String genderValue = selectedGender.value;
                if (genderValue == 'Pria') {
                  genderValue = 'Male';
                } else if (genderValue == 'Wanita') {
                  genderValue = 'Female';
                }

                final emailToSend = _emailController.text.trim().isNotEmpty
                    ? _emailController.text.trim()
                    : (currentUser?.email ?? '');

                final nameToSend = _nameController.text.trim().isNotEmpty
                    ? _nameController.text.trim()
                    : (currentUser?.name ?? 'User');

                print('=== SUBMITTING UPDATE ===');
                print('Name: $nameToSend');
                print('Email: $emailToSend');
                print('Gender: $genderValue');
                print('Phone: ${_phoneController.text}');
                print('========================');

                context.read<UpdateProfileCubit>().updateProfile(
                  name: nameToSend,
                  email: emailToSend,
                  gender: genderValue,
                  phone: _phoneController.text.isNotEmpty
                      ? _phoneController.text
                      : null,
                  birth: _birthDateController.text.isNotEmpty
                      ? _birthDateController.text
                      : null,
                  birthPlace: _birthPlaceController.text.isNotEmpty
                      ? _birthPlaceController.text
                      : null,
                  address: _addressController.text.isNotEmpty
                      ? _addressController.text
                      : null,
                );
              },
              child: isLoading
                  ? SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(black00),
                ),
              )
                  : Text("Simpan"),
            ),
          ),
        );
      },
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