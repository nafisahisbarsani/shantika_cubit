import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shantika_cubit/ui/color.dart';


class DetailPesanPage extends StatelessWidget {
  const DetailPesanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black00,
      body: SingleChildScrollView(
        child: Column(
          children: [
            //     _buildHeader(),
            //      _buildBusTypes(),
            //      _buildTravelInformation(),
            //      SizedBox(height: 8),
            //      _buildTravelPayment(),
            //      SizedBox(height: 8),
            //      _buildBottomSection(),
          ],
        ),
      ),
    );
  }

//
//
//   Widget _buildBusTypes() {
//     return Padding(
//       padding: EdgeInsets.all(AppStyle.paddingXL),
//       child: CustomCardContainer(
//         height: 74,
//         padding: EdgeInsets.symmetric(horizontal: AppStyle.paddingM),
//         boxShadow: [
//           BoxShadow(
//             color: AppStyle.black300.withOpacity(0.2),
//             offset: const Offset(0, 2),
//             blurRadius: 4,
//           ),
//         ],
//         statusColor: AppStyle.primary100,
//         statusText: "2 Penumpang",
//         statusTextColor: AppStyle.primary100,
//         statusIcon: "assets/images/seat.svg",
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SvgPicture.asset("assets/images/bus.svg", height: 40, width: 40),
//             SizedBox(width: AppStyle.spaceM),
//             Expanded(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Bus 10",
//                     style: AppStyle.bodySM2(color: AppStyle.black500),
//                   ),
//                   Text(
//                     "Executive",
//                     style: AppStyle.bodyXS2(color: AppStyle.black400),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTravelInformation() {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: AppStyle.paddingXL),
//       child: CustomCardContainer(
//         padding: EdgeInsets.all(AppStyle.paddingM),
//         boxShadow: [
//           BoxShadow(
//             color: AppStyle.black300.withOpacity(0.2),
//             offset: const Offset(0, 2),
//             blurRadius: 4,
//           ),
//         ],
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Informasi Perjalanan",
//               style: AppStyle.bodySM3(color: AppStyle.black500),
//             ),
//             SizedBox(height: AppStyle.spaceM),
//
//             _buildLocationRow(
//               icon: Icons.location_on_outlined,
//               iconColor: AppStyle.black300,
//               title: "Agen Keberangkatan",
//               location: "Krapyak - Semarang",
//               time: "• 18:30",
//             ),
//
//             SizedBox(height: AppStyle.spaceL),
//
//             _buildLocationRow(
//               icon: Icons.location_on_outlined,
//               iconColor: AppStyle.black300,
//               title: "Agen Tujuan",
//               location: "Gejayan - Sieman",
//               time: "• 18:30",
//             ),
//
//             SizedBox(height: AppStyle.spaceL),
//
//             _buildInfoRow(
//               icon: Icons.calendar_today_outlined,
//               title: "Tanggal Keberangkatan",
//               value: "20 Jan 2025 - 07:40",
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTravelPayment() {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: AppStyle.paddingXL),
//       child: CustomCardContainer(
//         padding: EdgeInsets.all(AppStyle.paddingM),
//         boxShadow: [
//           BoxShadow(
//             color: AppStyle.black300.withOpacity(0.2),
//             offset: const Offset(0, 2),
//             blurRadius: 4,
//           ),
//         ],
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Informasi Pembayaran",
//               style: AppStyle.bodySM3(color: AppStyle.black500),
//             ),
//             SizedBox(height: AppStyle.spaceM),
//             _buildPaymentRow(
//               icon: FontAwesome.money_bill_solid,
//               iconColor: AppStyle.black300,
//               title: "Total Harga Tiket",
//               subtitle: "Rp400.000",
//               textColor: AppStyle.black500,
//             ),
//             SizedBox(height: AppStyle.spaceM),
//             _buildPaymentRow(
//               icon: Icons.person_outline,
//               iconColor: AppStyle.black300,
//               title: "ID Membership",
//               subtitle: "SHNTK00127",
//               textColor: AppStyle.black500,
//             ),
//             SizedBox(height: AppStyle.spaceM),
//             _buildPaymentRow(
//               icon: Bootstrap.percent,
//               iconColor: AppStyle.black300,
//               title: "Potongan Membership 5%",
//               subtitle: "Rp20.000",
//               textColor: AppStyle.black500,
//             ),
//             SizedBox(height: AppStyle.spaceM),
//             _buildPaymentRow(
//               icon: Bootstrap.wallet,
//               iconColor: AppStyle.black300,
//               title: "Metode Pembayaran",
//               subtitle: "Pembayaran Instant",
//               textColor: AppStyle.black500,
//             ),
//             SizedBox(height: AppStyle.spaceM),
//             _buildPaymentRow(
//               icon: Bootstrap.wallet,
//               iconColor: AppStyle.black300,
//               title: "Status",
//               subtitle: "Lunas",
//               subtitleColor: AppStyle.success,
//               textColor: AppStyle.black500,
//             ),
//             SizedBox(height: AppStyle.spaceM),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildBottomSection() {
//     return Container(
//       width: double.infinity,
//       decoration: BoxDecoration(
//         color: AppStyle.background,
//         borderRadius: const BorderRadius.only(
//           topLeft: Radius.circular(AppStyle.paddingS),
//           topRight:Radius.circular(AppStyle.paddingS),
//         )
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Container(
//             width: double.infinity,
//             padding: EdgeInsets.all(AppStyle.paddingXL),
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       'Total Pembayaran',
//                       style: AppStyle.bodyXS1(color: AppStyle.black400),
//                     ),
//                     Text(
//                       'Rp380.000',
//                       style: AppStyle.bodyMD1(color: AppStyle.black500),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: AppStyle.spaceL),
//                 CustomButton(text: "Lihat Tiket", onPressed: (){}, width: 372, height: 40,)
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildLocationRow({
//     required IconData icon,
//     required Color iconColor,
//     required String title,
//     required String location,
//     required String time,
//   }) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Icon(icon, color: iconColor, size: 20),
//         SizedBox(width: AppStyle.spaceS),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(title, style: AppStyle.bodyXS1(color: AppStyle.black400)),
//               SizedBox(height: AppStyle.spaceXS),
//               Row(
//                 children: [
//                   Text(
//                     location,
//                     style: AppStyle.bodySM2(color: AppStyle.black500),
//                   ),
//                   SizedBox(width: AppStyle.spaceXS),
//                   Text(
//                     time,
//                     style: AppStyle.bodySM2(color: AppStyle.black400),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildInfoRow({
//     required IconData icon,
//     required String title,
//     required String value,
//   }) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Icon(icon, color: AppStyle.black300, size: AppStyle.iconS),
//         SizedBox(width: AppStyle.spaceS),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(title, style: AppStyle.bodyXS1(color: AppStyle.black400)),
//               SizedBox(height: AppStyle.spaceXS),
//               Text(value, style: AppStyle.bodySM2(color: AppStyle.black500)),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// Widget _buildPaymentRow({
//   required IconData icon,
//   required Color iconColor,
//   required String title,
//   required String subtitle,
//   required Color textColor,
//   Color? subtitleColor,
// }) {
//   return Row(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Icon(icon, color: iconColor, size: AppStyle.iconS),
//       SizedBox(width: AppStyle.spaceS),
//       Expanded(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(title, style: AppStyle.bodyXS1(color: textColor)),
//             SizedBox(height: AppStyle.spaceXS),
//             Text(
//               subtitle,
//               style: AppStyle.bodySM2(
//                 color: subtitleColor ?? AppStyle.black500,
//               ),
//             ),
//           ],
//         ),
//       ),
//     ],
//   );
// }
}
