import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shantika_cubit/ui/color.dart';
import 'package:shantika_cubit/ui/shared_widget/custom_switch.dart';
import 'package:shantika_cubit/ui/typography.dart';
import '../../ui/shared_widget/custom_arrow.dart';
import 'cubit/notification_set_cubit.dart';

class NotificationSet extends StatelessWidget {
  const NotificationSet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NotificationSetCubit()..init()..fetchSetting(),
      child: Scaffold(
        backgroundColor: black00,
        body: BlocBuilder<NotificationSetCubit, NotificationSetState>(
          builder: (context, state) {
            if (state is NotificationSetLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is NotificationSetError) {
              return Center(
                child: Text(
                  state.message,
                  style: smMedium.copyWith(color: Colors.redAccent),
                ),
              );
            } else if (state is NotificationSetSuccess) {
              final setting = state.setting;
              return SingleChildScrollView(
                child: Column(
                  children: [
                    _buildHeader(),
                    _buildToggleSection(
                      context: context,
                      title: "Aktivitas",
                      description:
                      "Pastikan akunmu aman dengan memantau aktivitas login, register hingga notifikasi OTP.",
                      value: setting.activity ?? false,
                      keyName: 'activity',
                    ),
                    _buildToggleSection(
                      context: context,
                      title: "Spesial Untukmu",
                      description:
                      "Kesempatan mendapatkan diskon terbatas, penawaran, tips, dan info fitur terbaru.",
                      value: setting.feature ?? false,
                      keyName: 'special',
                    ),
                    _buildToggleSection(
                      context: context,
                      title: "Pengingat",
                      description:
                      "Dapatkan berita dan info perjalanan penting, pengingat pembayaran, booking, dan lainnya.",
                      value: setting.remember ?? false,
                      keyName: 'reminder',
                    ),
                  ],
                ),
              );
            } else {
              return const SizedBox();
            }
          },
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
            color: black200.withValues(alpha: 0.3),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: const CustomArrow(title: "Notifikasi"),
    );
  }

  Widget _buildToggleSection({
    required BuildContext context,
    required String title,
    required String description,
    required bool value,
    required String keyName,
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
                onChanged: (val) {
                  context.read<NotificationSetCubit>().toggle(keyName, val);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
