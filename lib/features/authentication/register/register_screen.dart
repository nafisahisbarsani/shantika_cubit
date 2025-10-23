import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shantika_cubit/utility/extensions/email_validator_extension.dart';
import 'package:shantika_cubit/utility/extensions/show_toast.dart';
import '../../../config/constant.dart';
import '../../../ui/color.dart';
import '../../../ui/dimension.dart';
import '../../../ui/shared_widget/custom_button.dart';
import '../../../ui/shared_widget/custom_text_form_field.dart';
import '../../../ui/typography.dart';
import '../../../utility/loading_overlay.dart';
import '../../navigation/navigation_screen.dart';
import '../login/login_screen.dart';
import 'cubit/register_cubit.dart';
import 'package:uuid/uuid.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _birthPlaceController = TextEditingController();
  final _birthDateController = TextEditingController();
  final _addressController = TextEditingController();
  final _idTypeController = TextEditingController();
  final _idNumberController = TextEditingController();

  final _key = GlobalKey<FormState>();
  late RegisterCubit _registerCubit;
  final LoadingOverlay _overlay = LoadingOverlay();

  String _selectedGender = "Male";

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _birthPlaceController.dispose();
    _birthDateController.dispose();
    _addressController.dispose();
    _idTypeController.dispose();
    _idNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _registerCubit = context.read<RegisterCubit>();
    _registerCubit.init();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Daftar", style: xlBold),
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: BlocListener<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterStateLoading) {
            _overlay.show(context);
          } else if (state is RegisterStateSuccess) {
            _overlay.hide();

            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => NavigationScreen(),
                ),
                    (route) => false);
          } else if (state is RegisterStateError) {
            _overlay.hide();
            context.showCustomToast(
              position: SnackBarPosition.top,
              title: "Oopss",
              message: state.message,
              isSuccess: false,
            );
          }
        },
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(space400),
            child: Form(
              key: _key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextFormField(
                    titleSection: 'Nama Lengkap *',
                    controller: _nameController,
                    validator: (input) =>
                        input.isEmpty ? "Nama lengkap harus diisi" : null,
                  ),
                  const SizedBox(height: 15),
                  CustomTextFormField(
                    titleSection: 'Nomor Telepon *',
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    validator: (input) =>
                        input.isEmpty ? "Nomor telepon harus diisi" : null,
                  ),
                  const SizedBox(height: 15),

                  CustomTextFormField(
                    titleSection: 'Email *',
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (input) =>
                        input.isValidEmail() ? null : "Email tidak valid",
                  ),
                  const SizedBox(height: 15),

                  Row(
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                          titleSection: 'Tempat Lahir',
                          controller: _birthPlaceController,
                        ),
                      ),
                      const SizedBox(width: 15),
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
                              // Changed format to YYYY-MM-DD
                              _birthDateController.text =
                                  "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
                            }
                          },
                          child: AbsorbPointer(
                            child: CustomTextFormField(
                              titleSection: 'Tanggal Lahir',
                              controller: _birthDateController,
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
                  SizedBox(height: 15),

                  Text("Gender", style: smMedium),
                  SizedBox(height: space150),
                  Row(
                    children: [
                      Expanded(child: _buildGenderOption("Male", Icons.male)),
                      SizedBox(width: space300),
                      Expanded(
                        child: _buildGenderOption("Female", Icons.female),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),

                  CustomTextFormField(
                    titleSection: 'Alamat Lengkap',
                    controller: _addressController,
                    maxLines: 3,
                  ),
                  SizedBox(height: 15),

                  CustomTextFormField(
                    titleSection: 'Jenis Kartu Identitas',
                    controller: _idTypeController,
                  ),
                  SizedBox(height: 15),

                  CustomTextFormField(
                    titleSection: 'Nomor Kartu Identitas',
                    controller: _idNumberController,
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 15),

                  CustomButton(
                    onPressed: () {
                      if (_key.currentState!.validate()) {
                        final uuid = Uuid().v4();

                        _registerCubit.register(
                          name: _nameController.text,
                          email: _emailController.text,
                          password: "temp_password",
                          confirmPassword: "temp_password",
                          phone: _phoneController.text,
                          birthPlace: _birthPlaceController.text,
                          gender: _selectedGender,
                          birthDate: _birthDateController.text,
                          uuid: uuid,
                        );
                      }
                    },
                    child: const Text('Daftar'),
                  ),
                  const SizedBox(height: space400),
                  const SizedBox(height: space400),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGenderOption(String gender, IconData icon) {
    final bool isSelected = _selectedGender == gender;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedGender = gender;
        });
      },
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: isSelected ? jacarta800 : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? jacarta800 : Colors.grey.shade300,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: isSelected ? Colors.white : jacarta800, size: 20),
            const SizedBox(width: 8),
            Text(
              gender,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black87,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
