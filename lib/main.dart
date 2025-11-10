import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:shantika_cubit/features/about_us/cubit/about_us_cubit.dart';
import 'package:shantika_cubit/features/authentication/login/cubit/login_phone_cubit.dart';
import 'package:shantika_cubit/features/privacy_policy/cubit/privacy_policy_cubit.dart';
import 'package:shantika_cubit/features/profile/cubit/profile_cubit.dart';
import 'package:shantika_cubit/features/profile/profile_page.dart';
import 'package:shantika_cubit/features/terms_condition/cubit/terms_conditions_cubit.dart';
import 'package:shantika_cubit/repository/app_settings_repository.dart';
import 'package:shantika_cubit/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shantika_cubit/ui/theme.dart';
import 'config/service_locator.dart';
import 'features/authentication/password/cubit/change_password_cubit.dart';
import 'features/authentication/password/cubit/send_to_email_cubit.dart';
import 'features/authentication/password/cubit/validate_reset_token_cubit.dart';
import 'features/authentication/register/cubit/register_cubit.dart';
import 'features/faq/cubit/faq_cubit.dart';
import 'features/navigation/cubit/update_fcm_token_cubit.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await setUpLocator();
  Jiffy.setLocale('id');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => RegisterCubit()),
        BlocProvider(create: (context) => LoginPhoneCubit()),
        BlocProvider(create: (context) => SendToEmailCubit()),
        BlocProvider(create: (context) => ValidateResetTokenCubit()),
        BlocProvider(create: (context) => ChangePasswordCubit()),
        BlocProvider(create: (context) => ProfileCubit()),
        BlocProvider(create: (context) => UpdateFcmTokenCubit()..init()),
        BlocProvider(create: (context) => FaqCubit()),
        BlocProvider(create: (context) => AboutUsCubit()),
        BlocProvider(create: (context) => PrivacyPolicyCubit()),
        BlocProvider(create: (context) => TermsConditionsCubit()),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shantika',
        theme: AppTheme.light,
        home: const SplashScreen(),
      ),
    );
  }
}
