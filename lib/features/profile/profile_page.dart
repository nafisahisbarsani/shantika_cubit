// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:shantika_pkl/pages/profile/logout_pop_up.dart';
// import 'package:shantika_pkl/widgets/custom_button.dart';
// import 'package:shantika_pkl/widgets/custom_card.dart';
// import '../../widgets/app_style.dart';
//
// class ProfilePage extends StatelessWidget {
//   const ProfilePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppStyle.background,
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(kToolbarHeight),
//         child: Container(
//           decoration: BoxDecoration(
//             color: AppStyle.background,
//             boxShadow: [
//               BoxShadow(
//                 color: AppStyle.black200,
//                 offset: Offset(0, 2),
//                 blurRadius: 4,
//               ),
//             ],
//           ),
//           child: AppBar(
//             backgroundColor: Colors.transparent,
//             elevation: 0,
//             title: Center(
//               child: Text(
//                 "Profil",
//                 style: AppStyle.bodyXL(color: AppStyle.black500),
//               ),
//             ),
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [_buildPersonalData(), _buildListProfile(), _buildButton()],
//         ),
//       ),
//     );
//   }
// }
//
// Widget _buildPersonalData() {
//   return Padding(
//     padding: EdgeInsets.only(
//       top: AppStyle.paddingL,
//       bottom: AppStyle.paddingM,
//       left: AppStyle.paddingXL,
//       right: AppStyle.paddingXL,
//     ),
//     child: Center(
//       child: Column(
//         children: [
//           CircleAvatar(
//             radius: AppStyle.radiusXXXL,
//             backgroundColor: AppStyle.black300,
//             child: Icon(
//               Icons.person,
//               size: AppStyle.iconXXL,
//               color: AppStyle.background,
//             ),
//           ),
//           SizedBox(height: AppStyle.paddingL),
//           Text(
//             "Anastasya Carolina",
//             style: AppStyle.bodyMD1(color: AppStyle.black500),
//           ),
//           Text("087374543899", style: AppStyle.bodySM1(color: AppStyle.black500)),
//         ],
//       ),
//     ),
//   );
// }
//
// Widget _buildListProfile() {
//   final List<Map<String, dynamic>> menuItems = [
//     {
//       'icon': "assets/images/profile.svg",
//       'title': "Informasi Pribadi",
//       'route': '/informasi_pribadi',
//     },
//     {
//       'icon': "assets/images/notif.svg",
//       'title': "Notifikasi",
//       'route': '/notifikasi',
//     },
//     {
//       'icon': "assets/images/info.svg",
//       'title': "Tentang Kami",
//       'route': '/tentang_kami',
//     },
//     {
//       'icon': "assets/images/policy.svg",
//       'title': "Kebijakan Privasi",
//       'route': '/kebijakan',
//     },
//     {
//       'icon': "assets/images/list.svg",
//       'title': "Syarat dan Ketentuan",
//       'route': '/syarat',
//     },
//     {'icon': "assets/images/faq.svg", 'title': "FAQ", 'route': '/faq'},
//     {
//       'icon': "assets/images/fav.svg",
//       'title': "Beri Nilai App Kami",
//       'route': '/rating',
//       'additionalText': "Versi 1.20.5",
//     },
//   ];
//
//   return ListView.separated(
//     padding: EdgeInsets.only(
//       top: 10,
//       bottom: AppStyle.paddingM,
//       left: AppStyle.paddingXL,
//       right: AppStyle.paddingXL,
//     ),
//     itemCount: menuItems.length,
//     shrinkWrap: true,
//     physics: const NeverScrollableScrollPhysics(),
//     separatorBuilder: (context, index) => SizedBox(height: AppStyle.paddingM),
//     itemBuilder: (context, index) {
//       final item = menuItems[index];
//       return GestureDetector(
//         onTap: () {
//           Get.toNamed(item['route']);
//         },
//         child: CustomCardContainer(
//           height: 56,
//           backgroundColor: AppStyle.bg50,
//           child: Row(
//             children: [
//               SvgPicture.asset(
//                 item['icon'],
//                 color: AppStyle.black500,
//                 width: 24,
//                 height: 24,
//               ),
//               SizedBox(width: AppStyle.paddingM),
//               Expanded(
//                 child: Text(
//                   item['title'],
//                   style: AppStyle.bodySM1(color: AppStyle.black500),
//                 ),
//               ),
//               if (item['additionalText'] != null) ...[
//                 Text(
//                   item['additionalText'],
//                   style: AppStyle.bodyxxs2(color: AppStyle.black400),
//                 ),
//                 SizedBox(width: AppStyle.paddingS),
//               ],
//               SvgPicture.asset(
//                 "assets/images/arrow.svg",
//                 color: AppStyle.black500,
//               ),
//             ],
//           ),
//         ),
//       );
//     },
//   );
// }
// Widget _buildButton() {
//   return Padding(
//     padding: EdgeInsets.only(
//       top: AppStyle.paddingM,
//       left: AppStyle.paddingXL,
//       right: AppStyle.paddingXL,
//     ),
//     child: Center(
//       child: CustomButton(
//         text: "Keluar",
//         onPressed: () {showLogoutDialog();},
//         color: AppStyle.danger,
//         width: 372,
//         fontSize: 16,
//         height: 48,
//       ),
//     ),
//   );
// }
