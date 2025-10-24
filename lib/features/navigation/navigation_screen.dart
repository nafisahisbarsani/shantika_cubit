import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shantika_cubit/features/home/home_page.dart';
import 'package:shantika_cubit/features/profile/profile_page.dart';

import '../../ui/color.dart';
import '../../ui/typography.dart';
import 'cubit/update_fcm_token_cubit.dart';

// ignore: must_be_immutable
class NavigationScreen extends StatefulWidget {
  NavigationScreen({super.key, this.goToHistoryTransaction = false});

  final bool? goToHistoryTransaction;

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _currentIndex = 0; // Changed from _initialIndex to _currentIndex
  late UpdateFcmTokenCubit _updateFcmTokenCubit;

  final List<Widget> screens = [
    HomePage(),
    // // AllBottomSheet(),
    // AssignmentScreen(),
    // TransactionScreen(),
    ProfilePage(),
  ];

  @override
  void initState() {
    _updateFcmTokenCubit = context.read();
    _updateFcmTokenCubit.init();
    _updateFcmTokenCubit.updateFcmToken();

    if (widget.goToHistoryTransaction ?? false) {
      _currentIndex = 2; // Updated to use _currentIndex
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: bgLight,
        elevation: 1,
        selectedLabelStyle: xsMedium.copyWith(color: jacarta800),
        unselectedLabelStyle: xsMedium.copyWith(color: iconNeutralTertiary),
        iconSize: 24,
        currentIndex: _currentIndex,
        enableFeedback: false,
        selectedItemColor: jacarta800,
        unselectedItemColor: iconNeutralTertiary,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/home.svg',
              colorFilter: ColorFilter.mode(
                iconNeutralTertiary,
                BlendMode.srcIn,
              ),
            ),
            activeIcon: SvgPicture.asset(
              'assets/images/home_active.svg',
              colorFilter: ColorFilter.mode(jacarta800, BlendMode.srcIn),
            ),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/chat.svg',
              colorFilter: ColorFilter.mode(
                iconNeutralTertiary,
                BlendMode.srcIn,
              ),
            ),
            activeIcon: SvgPicture.asset(
              'assets/images/chat_active.svg',
              colorFilter: ColorFilter.mode(jacarta800, BlendMode.srcIn),
            ),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/ticket.svg',
              colorFilter: ColorFilter.mode(
                iconNeutralTertiary,
                BlendMode.srcIn,
              ),
            ),
            activeIcon: SvgPicture.asset(
              'assets/images/ticket_active.svg',
              colorFilter: ColorFilter.mode(jacarta800, BlendMode.srcIn),
            ),
            label: 'Pesan',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/profile.svg',
              colorFilter: ColorFilter.mode(
                iconNeutralTertiary,
                BlendMode.srcIn,
              ),
            ),
            activeIcon: SvgPicture.asset(
              'assets/images/profile_active.svg',
              colorFilter: ColorFilter.mode(jacarta800, BlendMode.srcIn),
            ),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
