import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nested/nested.dart';
import 'package:shantika_cubit/utility/extensions/show_toast.dart';
import '../../../config/constant.dart';
import '../../../ui/color.dart';
import '../../../ui/dimension.dart';
import '../../../ui/shared_widget/custom_button.dart';
import '../../../ui/shared_widget/custom_text_form_field.dart';
import '../../../ui/typography.dart';
import '../../../utility/loading_overlay.dart';
import '../../navigation/navigation_screen.dart';
import '../register/register_screen.dart';
import 'cubit/login_phone_cubit.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _phoneController = TextEditingController();
  final _key = GlobalKey<FormState>();

  late LoginPhoneCubit _loginPhoneCubit;

  final LoadingOverlay _overlay = LoadingOverlay();

  @override
  void initState() {
    _phoneController.addListener(() => setState(() {}));
    _loginPhoneCubit = LoginPhoneCubit();
    _loginPhoneCubit.init();
    super.initState();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildMainView();
  }

  Widget _buildMainView() {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Image.asset(
            'assets/images/img_bg_shantika.png',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              transform: Matrix4.translationValues(0, -30, 0),
              child: Form(
                key: _key,
                child: SafeArea(
                  child: BlocListener<LoginPhoneCubit, LoginPhoneState>(
                    bloc: _loginPhoneCubit,
                    listener: (BuildContext context, state) {
                      if (state is LoginPhoneStateSuccess) {
                        _overlay.hide();

                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => NavigationScreen()),
                              (route) => false,
                        );
                      } else if (state is LoginPhoneStateError) {
                        _overlay.hide();

                        context.showCustomToast(
                          position: SnackBarPosition.top,
                          title: "Error",
                          message: state.message,
                          isSuccess: false,
                        );
                      } else if (state is LoginPhoneStateLoading) {
                        _overlay.show(context);
                      }
                    },
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 24),
                          const Text(
                            'Selamat Datang',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'di Aplikasi Customer New Shantika',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 20),
                          CustomTextFormField(
                            titleSection: 'Nomor Telepon',
                            keyboardType: TextInputType.phone,
                            maxLines: 1,
                            controller: _phoneController,
                            placeholder: 'Masukan nomor telepon',
                            validator: (input) => input.isEmpty
                                ? "Nomor telepon tidak valid"
                                : null,
                          ),
                          SizedBox(height: 30),
                          CustomButton(
                            onPressed: () {
                              if (_key.currentState!.validate()) {
                                _loginPhoneCubit.login(
                                  phone: _phoneController.text,
                                );
                              }
                            },
                            child: const Text('Masuk'),
                          ),
                          SizedBox(height: 15),
                          _buildDividerView(),
                          const SizedBox(height: 16),
                          _buildDontHaveAccountView(context),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDividerView() {
    return Row(
      children: [
        Expanded(child: Container(height: 1, color: Colors.grey[300])),
        const SizedBox(width: 12),
        Text('Atau', style: TextStyle(fontSize: 12, color: Colors.grey[600])),
        const SizedBox(width: 12),
        Expanded(child: Container(height: 1, color: Colors.grey[300])),
      ],
    );
  }

  Widget _buildDontHaveAccountView(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Belum punya akun?', style: smRegular),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RegisterScreen()),
            );
          },
          child: Text(' Daftar', style: smRegular.copyWith(color: jacarta800)),
        ),
      ],
    );
  }
}