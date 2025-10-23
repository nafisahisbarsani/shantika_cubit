// import 'package:flutter/material.dart';
// import 'package:get/get_rx/src/rx_types/rx_types.dart';
// import 'package:shantika_pkl/widgets/app_style.dart';
// import '../../widgets/custom_arrow.dart';
// import '../../widgets/custom_toggle_switch.dart';
//
// class Notification extends StatelessWidget {
//   const Notification({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppStyle.background,
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             _buildHeader(),
//             _buildActivity(),
//             _buildSpecial(),
//             _buildReminder(),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// Widget _buildHeader() {
//   return Container(
//     decoration: BoxDecoration(
//       color: AppStyle.background,
//       boxShadow: [
//         BoxShadow(
//           color: AppStyle.black200,
//           blurRadius: 8,
//           offset: const Offset(0, 3),
//         ),
//       ],
//     ),
//     child: const CustomArrow(title: "Notifikasi"),
//   );
// }
//
// Widget _buildActivity() {
//   final RxBool isPushOn = false.obs;
//   return Padding(
//     padding: EdgeInsets.only(
//       top: 20,
//       left: AppStyle.paddingXL,
//       right: AppStyle.paddingXL,
//     ),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text("Aktivitas", style: AppStyle.bodySM1(color: AppStyle.black500)),
//         SizedBox(height: 6),
//         Text(
//           "Pastikan akunmu aman dengan memantau aktivitas login, register hingga notiikasi OTP.",
//           style: AppStyle.bodySM1(color: AppStyle.black400),
//         ),
//         SizedBox(height: 6),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               "Push Notification",
//               style: AppStyle.bodySM1(color: AppStyle.black500),
//             ),
//             CustomToggleSwitch(
//               value: isPushOn,
//               onChanged: (val) {
//                 debugPrint("Push Notification: $val");
//               },
//             ),
//           ],
//         ),
//       ],
//     ),
//   );
// }
//
// Widget _buildSpecial() {
//   final RxBool isPushOn = false.obs;
//   return Padding(
//     padding: EdgeInsets.only(
//       top: 20,
//       left: AppStyle.paddingXL,
//       right: AppStyle.paddingXL,
//     ),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "Spesial Untukmu",
//           style: AppStyle.bodySM1(color: AppStyle.black500),
//         ),
//         SizedBox(height: 6),
//         Text(
//           "Kesempatan mendapatkan diskon terbatas , penawaran, tips, dan info fitur terbaru",
//           style: AppStyle.bodySM1(color: AppStyle.black400),
//         ),
//         SizedBox(height: 6),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               "Push Notification",
//               style: AppStyle.bodySM1(color: AppStyle.black500),
//             ),
//             CustomToggleSwitch(
//               value: isPushOn,
//               onChanged: (val) {
//                 debugPrint("Push Notification: $val");
//               },
//             ),
//           ],
//         ),
//       ],
//     ),
//   );
// }
//
// Widget _buildReminder() {
//   final RxBool isPushOn = false.obs;
//
//   return Padding(
//     padding: EdgeInsets.only(
//       top: 20,
//       left: AppStyle.paddingXL,
//       right: AppStyle.paddingXL,
//     ),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text("Pengingat", style: AppStyle.bodySM1(color: AppStyle.black500)),
//         SizedBox(height: 6),
//         Text(
//           "Dapatkan berita dan info perjalanan penting, pengingat pembayaran, booking, dan lainnya.",
//           style: AppStyle.bodySM1(color: AppStyle.black400),
//         ),
//         SizedBox(height: 6),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               "Push Notification",
//               style: AppStyle.bodySM1(color: AppStyle.black500),
//             ),
//             CustomToggleSwitch(
//               value: isPushOn,
//               onChanged: (val) {
//                 debugPrint("Push Notification: $val");
//               },
//             ),
//           ],
//         ),
//       ],
//     ),
//   );
// }
