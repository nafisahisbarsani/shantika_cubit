import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shantika_cubit/features/order/detail_pesan_page.dart';
import 'package:shantika_cubit/features/order/order_history_page.dart';
import 'package:shantika_cubit/ui/color.dart';
import 'package:shantika_cubit/ui/dimension.dart';
import 'package:shantika_cubit/ui/typography.dart';
import '../../ui/shared_widget/custom_card.dart';

class OrderListPage extends StatelessWidget {
  const OrderListPage({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black00,
      appBar: _header(context),
      body: _buildHistoryView(),
    );
  }

  PreferredSizeWidget _header(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight + 4),
      child: Container(
        decoration: BoxDecoration(
          color: black00,
          boxShadow: [
            BoxShadow(color: black100, blurRadius: 8, offset: Offset(0, 3)),
          ],
        ),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text("Pesanan", style: xlMedium),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: IconButton(
                icon: Icon(Icons.history_outlined, color: black400),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const OrderHistoryPage()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildHistoryView() {
    final List<Map<String, dynamic>> orders = [
      {
        'bus': 'Bus 10 • Executive Big Top',
        'date': '11 February 2025 • 20:30',
        'origin': 'Krapyak – Semarang',
        'originTime': '05:30',
        'destination': 'Gejayan – Sieman',
        'destinationTime': '09:30',
        'price': 'Rp230.000',
        'status': 'Lunas',
        'statusColor': bgFillSuccess,
      },
      {
        'bus': 'Bus 8 • Executive Medium',
        'date': '12 February 2025 • 14:00',
        'origin': 'Semarang – Jakarta',
        'originTime': '08:00',
        'destination': 'Grogol – Jakarta',
        'destinationTime': '15:00',
        'price': 'Rp180.000',
        'status': 'Sudah Ditukarkan',
        'statusColor': bgFillInfo,
      },
      {
        'bus': 'Bus 12 • Luxury Suite',
        'date': '15 February 2025 • 22:15',
        'origin': 'Yogyakarta – Bandung',
        'originTime': '06:45',
        'destination': 'Cihampelas – Bandung',
        'destinationTime': '12:30',
        'price': 'Rp350.000',
        'status': 'Sudah Direview',
        'statusColor': navy900,
      },
    ];

    return Padding(
      padding: EdgeInsets.all(20),
      child: ListView.builder(
        padding: EdgeInsets.only(top: 12, bottom: 12),
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return CustomCard(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DetailPesanPage(),
                ),
              );
            },
            borderSide: BorderSide(width: 1, color: black50),
            borderRadius: BorderRadius.circular(borderRadius300),
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.only(bottom: 10),
            statusText: order['status'],
            statusColor: order['statusColor'],
            statusTextColor: order['statusTextColor'],
            shadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text(order['bus'], style: smMedium)],
                    ),
                    Text(
                      order['date'],
                      style: xsRegular.copyWith(color: textDarkTertiary),
                    ),
                    SizedBox(height: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: iconDarkSecondary,
                              size: 20,
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(order['origin'], style: xsMedium),
                                  Text(
                                    order['originTime'],
                                    style: xxsRegular.copyWith(
                                      color: textDarkTertiary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: iconPrimary,
                              size: 20,
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(order['destination'], style: xsMedium),
                                  Text(
                                    order['destinationTime'],
                                    style: xsRegular,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                  ],
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Text(
                    order['price'],
                    style: mdSemiBold.copyWith(color: textPrimary),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
