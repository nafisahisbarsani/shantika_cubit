import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nested/nested.dart';
import 'package:shantika_cubit/features/profile/profile_page.dart';
import 'package:shantika_cubit/utility/extensions/show_toast.dart';
import '../../../config/constant.dart';
import '../../../ui/color.dart';
import '../../../ui/dimension.dart';
import '../../../ui/shared_widget/custom_button.dart';
import '../../../ui/shared_widget/custom_text_form_field.dart';
import '../../../ui/shared_widget/shadowed_button.dart';
import '../../../ui/typography.dart';
import '../../../utility/loading_overlay.dart';
import '../../navigation/navigation_screen.dart';
import '../register/register_screen.dart';
import 'cubit/login_phone_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

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
      body: BlocListener<LoginPhoneCubit, LoginPhoneState>(
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
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [_buildBackgroundImage(), _buildLogoSection()],
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                transform: Matrix4.translationValues(0, -30, 0),
                child: Form(
                  key: _key,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildWelcomeText(),
                        _buildLoginForm(),
                        _buildDividerView(),
                        _buildOtherMethodLoginView(),
                        _buildDontHaveAccountView(context),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackgroundImage() {
    return Image.asset(
      'assets/images/img_bg_shantika.png',
      width: double.infinity,
      height: 350,
      fit: BoxFit.cover,
    );
  }

  Widget _buildLogoSection() {
    return Center(
      child: Image.asset(
        'assets/images/img_logo_shantika.png',
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _buildWelcomeText() {
    return Padding(
      padding: const EdgeInsets.only(top: 35, left: 25, right: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Selamat Datang", style: lgBold),
          const SizedBox(height: 3),
          Text("di Aplikasi Customer New Shantika", style: lgBold),
        ],
      ),
    );
  }

  Widget _buildLoginForm() {
    return Padding(
      padding: const EdgeInsets.only(right: 25, left: 25, top: space500),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextFormField(
            titleSection: 'Nomor Telepon',
            keyboardType: TextInputType.phone,
            maxLines: 1,
            controller: _phoneController,
            validator: (input) =>
            input.isEmpty ? "Nomor telepon tidak valid" : null,
          ),
          const SizedBox(height: 30),
          CustomButton(
            onPressed: () {
              if (_key.currentState!.validate()) {
                _loginPhoneCubit.login(phone: _phoneController.text);
              }
            },
            child: Text('Masuk', style: mdBold),
          ),
        ],
      ),
    );
  }

  Widget _buildDividerView() {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 15),
      child: Row(
        children: [
          Expanded(child: Container(height: 1, color: Colors.grey[300])),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              'atau masuk dengan google',
              style: TextStyle(fontSize: 12, color: Colors.grey[500]),
            ),
          ),
          Expanded(child: Container(height: 1, color: Colors.grey[300])),
        ],
      ),
    );
  }

  Widget _buildOtherMethodLoginView() {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 21),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ShadowedButton(
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/images/ic_google.svg'),
                const SizedBox(width: space250),
                const Text('masuk dengan google', style: xsRegular),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildDontHaveAccountView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 21, right: 25, left: 25),
      child: Row(
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
      ),
    );
  }
}
