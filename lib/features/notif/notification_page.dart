import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shantika_cubit/ui/color.dart';
import 'package:shantika_cubit/ui/typography.dart';
import 'package:shantika_cubit/utility/extensions/date_time_extensions.dart';
import 'package:with_space_between/with_space_between.dart';
import '../../config/constant.dart';
import '../../model/notification_model.dart';
import '../../ui/dimension.dart';
import '../../ui/shared_widget/common_appbar.dart';
import '../../ui/shared_widget/custom_arrow.dart';
import '../../ui/shared_widget/empty_state_view.dart';
import '../../ui/shared_widget/error_view.dart';
import 'cubit/notification_cubit.dart';
import 'cubit/read_notification_cubit.dart';

class NotificationPage extends StatelessWidget {
  NotificationPage({super.key});

  late NotificationCubit _notificationCubit;
  late ReadNotificationCubit _readNotificationCubit;

  @override
  Widget build(BuildContext context) {
    _notificationCubit = context.read();
    _notificationCubit.init();
    _notificationCubit.notifications();

    _readNotificationCubit = context.read();
    _readNotificationCubit.init();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: const CommonAppbar(leading: true, title: "Notifikasi"),
        body: BlocListener<ReadNotificationCubit, ReadNotificationState>(
          listener: (context, state) {
            if (state is ReadNotificationStateSuccess) {
              _notificationCubit.notifications();
            } else if (state is ReadAllNotificationStateSuccess) {
              _notificationCubit.notifications();
            }
          },
          child: Column(
            children: [
              _buildTabBar(context),
              Expanded(
                child: TabBarView(children: [_buildReaded(), _buildUnread()]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUnread() {
    return RefreshIndicator(
      onRefresh: () async {
        _notificationCubit.setPage();
      },
      child: BlocBuilder<NotificationCubit, NotificationState>(
        buildWhen: (prev, current) {
          return current is NotificationStateLoading ||
              current is NotificationStateError ||
              current is NotificationStateSuccess;
        },
        builder: (context, state) {
          if (state is NotificationStateSuccess) {
            List<NotificationModel> notifications = state.notifications
                .where((e) => e.isSeen == false)
                .toList();
            if (notifications.isEmpty) {
              return EmptyStateView(
                title: "Tidak ada notifikasi",
                type: EmptyStateType.notification,
                onPressed: () {
                  _notificationCubit.notifications();
                },
              );
            } else {
              return NotificationListener<ScrollUpdateNotification>(
                onNotification: (notification) {
                  if (notification.metrics.maxScrollExtent ==
                      notification.metrics.pixels) {
                    _notificationCubit.nextPage();
                  }
                  return false;
                },
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  itemCount: notifications.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    NotificationModel? data = notifications[index];

                    return _buildCustomNotification(
                      isSeen: data.isSeen ?? false,
                      icon: 'assets/images/ic_warning_notif.svg',
                      title: data.title ?? "",
                      time:
                          data.createdAt?.convert(format: 'dd MMMM yyyy') ?? "",
                      onTap: () {
                        // _readNotificationCubit.readNotif(id: data.id ?? "");
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => DetailNotificationScreen(data: data),
                        //   ),
                        // );
                      },
                      description: data.message ?? "",
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(height: 0);
                  },
                ),
              );
            }
          } else if (state is NotificationStateError) {
            return ErrorView(
              title: "Oopss",
              desc: state.message,
              onReload: () {
                _notificationCubit.notifications();
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget _buildReaded() {
    return BlocBuilder<NotificationCubit, NotificationState>(
      builder: (context, state) {
        if (state is NotificationStateSuccess) {
          List<NotificationModel> notifications = state.notifications;
          if (notifications.isEmpty) {
            return EmptyStateView(
              title: "Tidak ada notifikasi",
              type: EmptyStateType.notification,
            );
          } else {
            return ListView.separated(
              padding: EdgeInsets.zero,
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                NotificationModel? data = notifications[index];

                return _buildCustomNotification(
                  isSeen: data.isSeen ?? false,
                  icon: 'assets/images/ic_warning_notif.svg',
                  title: data.title ?? "",
                  time: data.createdAt?.convert(format: 'dd MMMM yyyy') ?? "",
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => DetailNotificationScreen(data: data),
                    //   ),
                    // );
                  },
                  description: data.message ?? "",
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 0);
              },
            );
          }
        } else if (state is NotificationStateError) {
          return ErrorView(
            title: "Oopss",
            desc: state.message,
            onReload: () {
              _notificationCubit.notifications();
            },
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _buildCustomNotification({
    required String icon,
    required String title,
    required String time,
    required String description,
    required VoidCallback onTap,
    required bool isSeen,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: isSeen ? bg : bgSurfaceInfo,
        padding: EdgeInsets.symmetric(vertical: space200),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: space400),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: space150,
                          vertical: space150,
                        ),
                        decoration: BoxDecoration(
                          color: bgSurfaceInfo,
                          borderRadius: BorderRadius.circular(borderRadius200),
                        ),
                        child: SvgPicture.asset(icon),
                      ),
                      Text(
                        title,
                        style: smSemiBold.copyWith(color: textDarkPrimary),
                      ),
                    ].withSpaceBetween(width: space200),
                  ),
                  Text(time, style: xxsMedium.copyWith(color: textDarkPrimary)),
                ].withSpaceBetween(width: space200),
              ),
              Text(
                description,
                style: xsRegular.copyWith(color: textDarkSecondary),
                textAlign: TextAlign.start,
              ),
            ].withSpaceBetween(height: space200),
          ),
        ),
      ),
    );
  }

  TabBar _buildTabBar(BuildContext context) {
    return TabBar(
      padding: EdgeInsets.zero,
      tabAlignment: TabAlignment.fill,
      labelPadding: const EdgeInsets.symmetric(vertical: spacing5),
      labelStyle: sSemiBold.copyWith(color: textPrimary),
      unselectedLabelStyle: sSemiBold.copyWith(color: textDisabled),
      dividerColor: Colors.transparent,
      indicatorColor: bgFillPrimary,
      indicatorPadding: const EdgeInsets.symmetric(horizontal: space400),
      tabs: const [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Semua")],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Belum Dibaca")],
        ),
      ],
    );
  }
}
