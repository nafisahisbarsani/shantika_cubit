import 'package:flutter/material.dart';
import 'package:shantika_cubit/features/authentication/login/login_screen.dart';
import 'package:shantika_cubit/ui/color.dart';
import 'package:shantika_cubit/ui/dimension.dart';
import 'package:shantika_cubit/ui/typography.dart';
import '../../config/service_locator.dart';
import '../../config/user_preference.dart';
import '../../ui/shared_widget/custom_button.dart';

void showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.all(20),
        child: Container(
          width: 372,
          height: 229,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: black00,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius300),
            ),
            shadows: [
              BoxShadow(
                color: Color(0x1E101828),
                blurRadius: 15,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFFEE3E1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                      ),
                      child: Icon(Icons.logout, color: errorColor, size: 24),
                    ),
                    SizedBox(height: 16),
                    Text('Keluar Akun', style: mSemiBold),
                    SizedBox(height: 4),
                    Text(
                      'Yakin Anda akan keluar akun Anastasya Carolina',
                      style: sRegular.copyWith(color: textNeutralSecondary),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomButton(
                    width: 150,
                    child: Text("Batal"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    border: Border.all(color: borderNeutralDark),
                    backgroundColor: black00,
                    textColor: black950,
                  ),

                  CustomButton(
                    width: 150,
                    child: Text("Keluar"),
                    backgroundColor: errorColor,
                    onPressed: () async {
                      Navigator.pop(context);

                      final userPreference = serviceLocator
                          .get<UserPreference>();
                      await userPreference.clearData();

                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                        (route) => false,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
