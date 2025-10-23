import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shantika_cubit/ui/typography.dart';
import '../../ui/color.dart';

class PesanPage extends StatelessWidget {
   PesanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black00,
      appBar: _header(),
  //    body: _buildHistoryView(),
    );
  }

  PreferredSizeWidget _header() {
    return PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight + 4),
      child: Container(
        decoration: BoxDecoration(
          color: black00,
          boxShadow: [
            BoxShadow(
              color:black200,
              blurRadius: 8,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "Pesanan",
            style: xlRegular,
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 16),
              child: IconButton(
                icon: Icon(Icons.history_outlined, color: black400),
                onPressed: () {
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

//  Widget _buildHistoryView() {
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
        'status': 'Sudah Ditukarkan',
        'statusColor': blue500,
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
        'statusColor': blue500,
      },
    ];

  //   return Padding(
  //     padding: EdgeInsets.symmetric(horizontal: 20),
  //     child: ListView.builder(
  //       padding: EdgeInsets.only(top: 16, bottom: 16),
  //       itemCount: orders.length,
  //       itemBuilder: (context, index) {
  //         final order = orders[index];
  //         return CustomCardContainer(
  //           onTap:  () => Get.to(() => DetailPesanPage()),
  //           padding: EdgeInsets.all(AppStyle.paddingM),
  //           margin: EdgeInsets.only(bottom: AppStyle.spaceS),
  //           borderColor: AppStyle.black200,
  //           statusText: order['status'],
  //           statusColor: order['statusColor'],
  //           statusTextColor: order['statusTextColor'],
  //           child: Stack(
  //             children: [
  //               Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                     children: [
  //                       Text(
  //                         order['bus'],
  //                         style: AppStyle.bodySM2(color: AppStyle.black500),
  //                       ),
  //                     ],
  //                   ),
  //                   Text(
  //                     order['date'],
  //                     style: AppStyle.bodyXS2(color: AppStyle.black400),
  //                   ),
  //                   SizedBox(height: AppStyle.spaceS),
  //                   Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       Row(
  //                         children: [
  //                           Icon(
  //                             Icons.location_on,
  //                             color: AppStyle.black400,
  //                             size: 20,
  //                           ),
  //                           SizedBox(width: AppStyle.spaceS),
  //                           Expanded(
  //                             child: Column(
  //                               crossAxisAlignment: CrossAxisAlignment.start,
  //                               children: [
  //                                 Text(
  //                                   order['origin'],
  //                                   style: AppStyle.bodyXS2(
  //                                     color: AppStyle.black500,
  //                                   ),
  //                                 ),
  //                                 Text(
  //                                   order['originTime'],
  //                                   style: AppStyle.bodyxxs2(
  //                                     color: AppStyle.black400,
  //                                   ),
  //                                 ),
  //                               ],
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                       SizedBox(height: AppStyle.spaceL),
  //                       Row(
  //                         children: [
  //                           Icon(
  //                             Icons.location_on,
  //                             color: AppStyle.primary100,
  //                             size: 20,
  //                           ),
  //                           SizedBox(width: AppStyle.spaceS),
  //                           Expanded(
  //                             child: Column(
  //                               crossAxisAlignment: CrossAxisAlignment.start,
  //                               children: [
  //                                 Text(
  //                                   order['destination'],
  //                                   style: AppStyle.bodyXS2(
  //                                     color: AppStyle.black500,
  //                                   ),
  //                                 ),
  //                                 Text(
  //                                   order['destinationTime'],
  //                                   style: AppStyle.bodyxxs2(
  //                                     color: AppStyle.black400,
  //                                   ),
  //                                 ),
  //                               ],
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     ],
  //                   ),
  //                   SizedBox(height: AppStyle.spaceS),
  //                 ],
  //               ),
  //               Positioned(
  //                 right: 0,
  //                 bottom: 0,
  //                 child: Text(
  //                   order['price'],
  //                   style: AppStyle.bodyMD2(color: AppStyle.primary100),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }

}
