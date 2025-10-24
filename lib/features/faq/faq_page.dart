// import 'package:flutter/material.dart';
// //
//
// class FaqPage extends StatelessWidget {
//   const FaqPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             _buildHeader(),
//             _buildFaqItems(),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildHeader() {
//     return Container(
//       decoration: BoxDecoration(
//         color: AppStyle.background,
//         boxShadow: [
//           BoxShadow(
//             color: AppStyle.black200.withOpacity(0.3),
//             blurRadius: 8,
//             offset: const Offset(0, 3),
//           ),
//         ],
//       ),
//       child: const CustomArrow(title: "FAQ"),
//     );
//   }
//
//   Widget _buildFaqItems() {
//     final faqs = [
//       {
//         'q': 'Bagaimana cara pemesanan tiket armada New Shantika melalui aplikasi?',
//         'a': 'Caranya mudah, Anda bisa melakukan pemesanan tiket dimana saja dan kapan saja. Cukup klik menu pesan tiket, lengkapi data, lekukan pembayaran. Setelah itu, Anda dapat melakukan perjalanan yang aman dan nyaman',
//       },
//       {
//         'q': 'Bagaimana cara pemesanan tiket armada New Shantika melalui aplikasi?',
//         'a': 'Caranya mudah, Anda bisa melakukan pemesanan tiket dimana saja dan kapan saja. Cukup klik menu pesan tiket, lengkapi data, lekukan pembayaran. Setelah itu, Anda dapat melakukan perjalanan yang aman dan nyaman',
//       },
//       {
//         'q': 'Bagaimana cara pemesanan tiket armada New Shantika melalui aplikasi?',
//         'a': 'Caranya mudah, Anda bisa melakukan pemesanan tiket dimana saja dan kapan saja. Cukup klik menu pesan tiket, lengkapi data, lekukan pembayaran. Setelah itu, Anda dapat melakukan perjalanan yang aman dan nyaman',
//       },
//       {
//         'q': 'Bagaimana cara pemesanan tiket armada New Shantika melalui aplikasi?',
//         'a': 'Caranya mudah, Anda bisa melakukan pemesanan tiket dimana saja dan kapan saja. Cukup klik menu pesan tiket, lengkapi data, lekukan pembayaran. Setelah itu, Anda dapat melakukan perjalanan yang aman dan nyaman',
//       },
//       {
//         'q': 'Bagaimana cara pemesanan tiket armada New Shantika melalui aplikasi?',
//         'a': 'Caranya mudah, Anda bisa melakukan pemesanan tiket dimana saja dan kapan saja. Cukup klik menu pesan tiket, lengkapi data, lekukan pembayaran. Setelah itu, Anda dapat melakukan perjalanan yang aman dan nyaman',
//       },
//       {
//         'q': 'Bagaimana cara pemesanan tiket armada New Shantika melalui aplikasi?',
//         'a': 'Caranya mudah, Anda bisa melakukan pemesanan tiket dimana saja dan kapan saja. Cukup klik menu pesan tiket, lengkapi data, lekukan pembayaran. Setelah itu, Anda dapat melakukan perjalanan yang aman dan nyaman',
//       },
//     ];
//
//     return Padding(
//       padding: const EdgeInsets.symmetric(
//         horizontal: AppStyle.paddingXL,
//         vertical: AppStyle.paddingL,
//       ),
//       child: Column(
//         children: faqs
//             .map((item) => _buildFaqItem(item['q']!, item['a']!))
//             .toList(),
//       ),
//     );
//   }
//
//   Widget _buildFaqItem(String question, String answer) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: AppStyle.spaceM),
//       decoration: BoxDecoration(
//         color: AppStyle.primary50,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: AppStyle.black200.withOpacity(0.2),
//             offset: const Offset(0, 2),
//             blurRadius: 4,
//           ),
//         ],
//       ),
//       child: Theme(
//         data: ThemeData().copyWith(dividerColor: Colors.transparent),
//         child: ExpansionTile(
//           tilePadding: const EdgeInsets.symmetric(
//             horizontal: AppStyle.paddingL,
//             vertical: AppStyle.paddingM,
//           ),
//           title: Text(
//             question,
//             style: AppStyle.bodySM1(color: AppStyle.black500),
//           ),
//           childrenPadding: const EdgeInsets.fromLTRB(
//             AppStyle.paddingL,
//             0,
//             AppStyle.paddingL,
//             AppStyle.paddingL,
//           ),
//           children: [
//             Text(
//               answer,
//               style: AppStyle.bodySM1(color: AppStyle.black400),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
