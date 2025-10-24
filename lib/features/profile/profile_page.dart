import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shantika_cubit/ui/color.dart';
import 'package:shantika_cubit/ui/shared_widget/custom_button.dart';
import 'package:shantika_cubit/ui/typography.dart';

import 'cubit/logout_cubit.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogoutCubit()..init(),
      child: BlocListener<LogoutCubit, LogoutState>(
        listener: (context, state) {
          if (state is LogoutStateSuccess) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/login',
              (route) => false,
            );
          } else if (state is LogoutStateError) {
            // Show error message
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: Scaffold(
          backgroundColor: black00,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: Container(
              decoration: BoxDecoration(
                color: black00,
                boxShadow: [
                  BoxShadow(
                    color: black400.withOpacity(0.1),
                    offset: Offset(0, 2),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                automaticallyImplyLeading: false,
                title: Text("Profil", style: xlSemiBold),
                centerTitle: true,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 24),
                _buildPersonalData(),
                SizedBox(height: 24),
                _buildListProfile(context),
                SizedBox(height: 24),
                _buildButton(context),
                SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPersonalData() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: Column(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: black300,
              child: Icon(Icons.person, size: 40, color: black00),
            ),
            SizedBox(height: 12),
            Text("Anastasya Carolina", style: mdMedium),
            SizedBox(height: 4),
            Text(
              "087374543899",
              style: smMedium.copyWith(color: textDarkTertiary),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListProfile(BuildContext context) {
    final List<Map<String, dynamic>> menuItems = [
      {
        'icon': "assets/images/profile.svg",
        'title': "Informasi Pribadi",
        // 'route': '/informasi_pribadi',
      },
      {
        'icon': "assets/images/notif.svg",
        'title': "Notifikasi",
      },
      {
        'icon': "assets/images/info.svg",
        'title': "Tentang Kami",
      },
      {
        'icon': "assets/images/policy.svg",
        'title': "Kebijakan Privasi",
      },
      {
        'icon': "assets/images/list.svg",
        'title': "Syarat dan Ketentuan",
        'route': '/syarat',
      },
      {'icon': "assets/images/faq.svg", 'title': "FAQ", },
      {
        'icon': "assets/images/fav.svg",
        'title': "Beri Nilai App Kami",
        'additionalText': "Versi 1.20.5",
      },
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: ListView.separated(
        padding: EdgeInsets.zero,
        itemCount: menuItems.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) => SizedBox(height: 12),
        itemBuilder: (context, index) {
          final item = menuItems[index];
          return GestureDetector(
            onTap: () {
              // Navigator.pushNamed(context, item['route']);
            },
            child: Container(
              height: 56,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: bgSurfaceInfo,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    item['icon'],
                    width: 24,
                    height: 24,
                    color: black950,
                  ),
                  SizedBox(width: 12),
                  Expanded(child: Text(item['title'], style: smMedium)),
                  if (item['additionalText'] != null) ...[
                    Text(item['additionalText'], style: xxsMedium),
                    SizedBox(width: 8),
                  ],
                  Icon(Icons.chevron_right, size: 24),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildButton(BuildContext context) {
    return BlocBuilder<LogoutCubit, LogoutState>(
      builder: (context, state) {
        final isLoading = state is LogoutStateLoading;

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: CustomButton(
            onPressed: () {},
            child: Text("Keluar", style: mdMedium.copyWith(color: black00)),
            backgroundColor: bgFillDanger,
          ),
        );
      },
    );
  }
}
