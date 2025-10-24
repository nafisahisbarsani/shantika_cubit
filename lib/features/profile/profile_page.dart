import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shantika_cubit/features/personal_info/personal_info.dart';
import 'package:shantika_cubit/ui/color.dart';
import 'package:shantika_cubit/ui/shared_widget/custom_button.dart';
import 'package:shantika_cubit/ui/typography.dart';
import '../../model/user_model.dart';
import 'cubit/logout_cubit.dart';
import 'cubit/profile_cubit.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProfileCubit()
            ..init()
            ..profile(),
        ),
        BlocProvider(
          create: (context) => LogoutCubit()..init(),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<LogoutCubit, LogoutState>(
            listener: (context, state) {
              if (state is LogoutStateSuccess) {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/login',
                      (route) => false,
                );
              } else if (state is LogoutStateError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
          ),
        ],
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
          body: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              if (state is ProfileStateLoading) {
                return Center(child: CircularProgressIndicator());
              }

              if (state is ProfileStateError) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        state.message,
                        textAlign: TextAlign.center,
                        style: smMedium,
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () => context.read<ProfileCubit>().profile(),
                        child: Text('Coba Lagi'),
                      ),
                    ],
                  ),
                );
              }

              final user = state is ProfileStateSuccess ? state.user : null;

              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 24),
                    _buildPersonalData(user),
                    SizedBox(height: 24),
                    _buildListProfile(context, user),
                    SizedBox(height: 24),
                    _buildButton(context),
                    SizedBox(height: 24),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildPersonalData(UserModel? user) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: Column(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: black300,
              backgroundImage: user?.avatarUrl != null
                  ? NetworkImage(user!.avatarUrl!)
                  : null,
              child: user?.avatarUrl == null
                  ? Icon(Icons.person, size: 40, color: black00)
                  : null,
            ),
            SizedBox(height: 12),
            Text(
              user?.name ?? "-",
              style: mdMedium,
            ),
            SizedBox(height: 4),
            Text(
              user?.phone ?? "-",
              style: smMedium.copyWith(color: textDarkTertiary),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListProfile(BuildContext context, UserModel? user) {
    final List<Map<String, dynamic>> menuItems = [
      {
        'icon': "assets/images/profile.svg",
        'title': "Informasi Pribadi",
        'onTap': () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PersonalInfo(user: user),
            ),
          );
          if (result == true) {
            context.read<ProfileCubit>().profile();
          }
        },
      },
      {
        'icon': "assets/images/notif.svg",
        'title': "Notifikasi",
        'onTap': () {},
      },
      {
        'icon': "assets/images/info.svg",
        'title': "Tentang Kami",
        'onTap': () {},
      },
      {
        'icon': "assets/images/policy.svg",
        'title': "Kebijakan Privasi",
        'onTap': () {},
      },
      {
        'icon': "assets/images/list.svg",
        'title': "Syarat dan Ketentuan",
        'onTap': () {},
      },
      {
        'icon': "assets/images/faq.svg",
        'title': "FAQ",
        'onTap': () {},
      },
      {
        'icon': "assets/images/fav.svg",
        'title': "Beri Nilai App Kami",
        'additionalText': "Versi 1.20.5",
        'onTap': () {},
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
            onTap: item['onTap'],
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
  }  Widget _buildButton(BuildContext context) {
    return BlocBuilder<LogoutCubit, LogoutState>(
      builder: (context, state) {
        final isLoading = state is LogoutStateLoading;

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: CustomButton(
            onPressed: isLoading
                ? null
                : () {
              // Trigger logout
              context.read<LogoutCubit>().logout();
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
                : Text("Keluar", style: mdMedium.copyWith(color: black00)),
            backgroundColor: bgFillDanger,
          ),
        );
      },
    );
  }
}