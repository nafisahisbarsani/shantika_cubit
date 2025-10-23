import 'package:flutter/material.dart';
import 'package:shantika_cubit/ui/color.dart';
import 'package:shantika_cubit/ui/typography.dart';


class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: black00,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
           //   CustomArrow(title: "Notifikasi"),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: TabBar(
                  indicatorColor: blue500,
                  labelColor: blue100,
                  unselectedLabelColor:black300,
                  labelStyle: smRegular,
                  tabs: const [
                    Tab(text: "Semua 16"),
                    Tab(text: "Belum Dibaca 7"),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Expanded(
                child: TabBarView(
                  children: [
                    _buildNotificationList(),
                    _buildNotificationList(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationList() {
    final List<Map<String, String>> notifications = [
      {
        'title': 'Promo Tiket Murah Mudik 2025',
        'message':
            'Yuk segera amankan tiket mudik mu sekarang juga sebelum kehabisan...',
        'time': '10:00',
      },
      {
        'title': 'Tiket anda sudah dibayar lunas',
        'message':
            'Terimakasih sudah membeli tiket di new shantika nikmati perjalanannya.',
        'time': '10:00',
      },
      {
        'title': 'Segara Bayar Tiket yang sudah anda pesan',
        'message': 'Bayar tiket anda dan nikmati perjalanan bus new shantika',
        'time': '10:00',
      },
    ];

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "8 Februari 2024",
                  style: smRegular,
                ),
                Text(
                  "Baca Semua",
                  style: smRegular,
                ),
              ],
            ),
            SizedBox(height: 8),
            ...notifications.map(
              (notif) => _buildNotifItem(
                title: notif['title']!,
                message: notif['message']!,
                time: notif['time']!,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "7 Februari 2024",
                  style: smRegular),
                Text(
                  "Baca Semua",
                  style: smRegular,
                ),
              ],
            ),
            SizedBox(height: 8),
            // ...notifications.map(
            //   (notif) => _buildNotifItem(
            //     title: notif['title']!,
            //     message: notif['message']!,
            //     time: notif['time']!,
            //   ),
            // ),
            SizedBox(height: 14),
          ],
        ),
      ),
    );
  }

  Widget _buildNotifItem({
    required String title,
    required String message,
    required String time,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 12,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: black200,
            width: 1,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon(
          //   Bootstrap.ticket_perforated,
          //   color: AppStyle.primary100,
          //   size: AppStyle.iconM,
          // ),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: xsRegular,
                ),
                SizedBox(height: 4),
                Text(
                  message,
                  style: xsMedium,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          SizedBox(width: 8),
          Text(
            time,
            style: xsMedium,
          ),
        ],
      ),
    );
  }
}
