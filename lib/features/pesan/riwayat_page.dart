import 'package:flutter/material.dart';
import 'package:shantika_cubit/ui/color.dart';
import 'package:shantika_cubit/ui/shared_widget/custom_card.dart';
import 'package:shantika_cubit/ui/typography.dart';

class RiwayatPage extends StatelessWidget {
  const RiwayatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black00,
      appBar: _header(),
      body: _buildHistoryView(),
    );
  }
}

PreferredSizeWidget _header() {
  return PreferredSize(
    preferredSize: Size.fromHeight(kToolbarHeight + 4),
    child: Container(
      decoration: BoxDecoration(
        color: black00,
        boxShadow: [
          BoxShadow(
            color: black200,
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Riwayat",
          style: xlRegular,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 30),
            child: Icon(Icons.history_outlined, color: black400),
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
      'statusColor': green200,
    },
    {
      'bus': 'Bus 8 • Executive Medium',
      'date': '12 February 2025 • 14:00',
      'origin': 'Semarang – Jakarta',
      'originTime': '08:00',
      'destination': 'Grogol – Jakarta',
      'destinationTime': '15:00',
      'price': 'Rp180.000',
      'status': 'Lunas',
      'statusColor': green200,
    },
    {
      'bus': 'Bus 12 • Luxury Suite',
      'date': '15 February 2025 • 22:15',
      'origin': 'Yogyakarta – Bandung',
      'originTime': '06:45',
      'destination': 'Cihampelas – Bandung',
      'destinationTime': '12:30',
      'price': 'Rp350.000',
      'status': 'Lunas',
      'statusColor': green200,
    },
    {
      'bus': 'Bus 8 • Executive Medium',
      'date': '12 February 2025 • 14:00',
      'origin': 'Semarang – Jakarta',
      'originTime': '08:00',
      'destination': 'Grogol – Jakarta',
      'destinationTime': '15:00',
      'price': 'Rp180.000',
      'status': 'Lunas',
      'statusColor': green200,
    },
  ];

  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20),
    child: ListView.builder(
      padding: EdgeInsets.only(top: 1, bottom: 16),
      itemCount: orders.length,
      itemBuilder: (context, index) {
        final order = orders[index];
        return CustomCard(child: Column());
      },
    ),
  );
}
