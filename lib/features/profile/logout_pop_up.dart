// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shantika_pkl/widgets/app_style.dart';
// import 'package:shantika_pkl/widgets/custom_button.dart';
//
// void showLogoutDialog() {
//   Get.dialog(
//     Dialog(
//       backgroundColor: Colors.transparent,
//       insetPadding: EdgeInsets.all(20),
//       child: Container(
//         width: 372,
//         height: 229,
//         clipBehavior: Clip.antiAlias,
//         decoration: ShapeDecoration(
//           color: AppStyle.background,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(AppStyle.radiusM),
//           ),
//           shadows: [
//             BoxShadow(
//               color: Color(0x1E101828),
//               blurRadius: 15,
//               offset: Offset(0, 5),
//               spreadRadius: 0,
//             )
//           ],
//         ),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             // Header Content
//             Container(
//               padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     width: 48,
//                     height: 48,
//                     decoration: ShapeDecoration(
//                       color: const Color(0xFFFEE3E1),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(28),
//                       ),
//                     ),
//                     child: Icon(
//                       Icons.logout,
//                       color: AppStyle.danger,
//                       size: 24,
//                     ),
//                   ),
//                   SizedBox(height: 16),
//                   Column(
//                     mainAxisSize: MainAxisSize.min,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Keluar Akun',
//                         style: AppStyle.bodyXL(color: AppStyle.black500)
//                       ),
//                       SizedBox(height: 4),
//                       Text(
//                         'Yakin Anda akan keluar akun Anastasya Carolina',
//                         style: AppStyle.bodySM1(color: AppStyle.black500)
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 CustomButton(text: "Batal", onPressed: (){}, borderColor: AppStyle.black200, color: AppStyle.background,width: 150, height: 38, textColor: AppStyle.black500,),
//                 CustomButton(text: "Keluar", onPressed: (){},color: AppStyle.danger,width: 150, height: 38,),
//               ],
//             )
//           ],
//         ),
//       ),
//     ),
//     barrierDismissible: true,
//   );
// }