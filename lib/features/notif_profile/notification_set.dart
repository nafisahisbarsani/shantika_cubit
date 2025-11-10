import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shantika_cubit/features/notif_profile/cubit/notification_set_cubit.dart';
import 'package:shantika_cubit/ui/color.dart';
import 'package:shantika_cubit/ui/shared_widget/custom_switch.dart';
import 'package:shantika_cubit/ui/typography.dart';
import '../../ui/shared_widget/custom_arrow.dart';

class NotificationSet extends StatelessWidget {
  const NotificationSet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black00,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            _buildActivity(context),
            _buildSpecial(context),
            _buildReminder(context),
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
            color: black200.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: const CustomArrow(title: "Notifikasi"),
    );
  }

  Widget _buildActivity(BuildContext context) {
    return BlocBuilder<NotificationSetCubit, Map<String, bool>>(
      builder: (context, state) {
        final isOn = state['activity'] ?? false;
        return _buildToggleSection(
          title: "Aktivitas",
          description:
          "Pastikan akunmu aman dengan memantau aktivitas login, register hingga notifikasi OTP.",
          value: isOn,
          onChanged: (val) => context.read<NotificationSetCubit>().toggle('activity', val),
        );
      },
    );
  }

  Widget _buildSpecial(BuildContext context) {
    return BlocBuilder<NotificationSetCubit, Map<String, bool>>(
      builder: (context, state) {
        final isOn = state['special'] ?? false;
        return _buildToggleSection(
          title: "Spesial Untukmu",
          description:
          "Kesempatan mendapatkan diskon terbatas, penawaran, tips, dan info fitur terbaru.",
          value: isOn,
          onChanged: (val) => context.read<NotificationSetCubit>().toggle('special', val),
        );
      },
    );
  }

  Widget _buildReminder(BuildContext context) {
    return BlocBuilder<NotificationSetCubit, Map<String, bool>>(
      builder: (context, state) {
        final isOn = state['reminder'] ?? false;
        return _buildToggleSection(
          title: "Pengingat",
          description:
          "Dapatkan berita dan info perjalanan penting, pengingat pembayaran, booking, dan lainnya.",
          value: isOn,
          onChanged: (val) => context.read<NotificationSetCubit>().toggle('reminder', val),
        );
      },
    );
  }

  Widget _buildToggleSection({
    required String title,
    required String description,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: smMedium),
          const SizedBox(height: 6),
          Text(description, style: smRegular.copyWith(color: notification)),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Push Notification", style: smMedium),
              CustomSwitch(
                value: value,
                onChanged: onChanged,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
