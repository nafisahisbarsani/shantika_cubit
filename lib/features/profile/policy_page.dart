// import 'package:flutter/material.dart';
// import 'package:shantika_pkl/widgets/app_style.dart';
// import '../../widgets/custom_arrow.dart';
//
// class PolicyPage extends StatelessWidget {
//   const PolicyPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppStyle.background,
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             _buildHeader(),
//             _buildDescription(),
//             _buildFirstSection(),
//             _buildSecondSection(),
//             _buildThirdSection(),
//             _buildFourthSection(),
//             SizedBox(height: AppStyle.spaceS,)
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
//     child: CustomArrow(title: "Kebijakan Privasi"),
//   );
// }
//
// Widget _buildDescription() {
//   return Padding(
//     padding: EdgeInsets.only(
//       top: 24,
//       left: AppStyle.paddingXL,
//       right: AppStyle.paddingXL,
//     ),
//     child: Column(
//       children: [
//         Text(
//           'New Shantika ("Kami" atau "Aplikasi") berkomitmen untuk melindungi privasi Anda. Kebijakan Privasi ini menjelaskan bagaimana Kami mengumpulkan, menggunakan, dan melindungi informasi pribadi yang Anda berikan ketika menggunakan Aplikasi New Shantika. Dengan menggunakan Aplikasi ini, Anda setuju dengan ketentuan Kebijakan Privasi ini.',
//           style: AppStyle.bodySM1(color: AppStyle.black500),
//         ),
//       ],
//     ),
//   );
// }
//
// Widget _buildFirstSection() {
//   return Padding(
//     padding: EdgeInsets.only(
//       top: 16,
//       left: AppStyle.paddingXL,
//       right: AppStyle.paddingXL,
//     ),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "1. Informasi yang Kami Kumpulkan",
//           style: AppStyle.bodyXS2(color: AppStyle.black500),
//         ),
//         SizedBox(height: 12),
//         Text(
//           "Kami dapat mengumpulkan informasi pribadi yang mencakup namun tidak terbatas pada:",
//           style: AppStyle.bodyXS2(color: AppStyle.black500),
//         ),
//         SizedBox(height: 12),
//         RichText(
//           text: TextSpan(
//             children: [
//               TextSpan(
//                 text: "• Informasi Identitas: ",
//                 style: AppStyle.bodyXS2(color: AppStyle.black500),
//               ),
//               TextSpan(
//                 text:
//                     "Nama, alamat email, nomor telepon, dan informasi lain yang Anda berikan saat mendaftar.",
//                 style: AppStyle.bodyXS1(color: AppStyle.black500),
//               ),
//             ],
//           ),
//         ),
//         SizedBox(height: 12),
//         RichText(
//           text: TextSpan(
//             children: [
//               TextSpan(
//                 text: "• Informasi Identitas: ",
//                 style: AppStyle.bodyXS2(color: AppStyle.black500),
//               ),
//               TextSpan(
//                 text:
//                     "Nama, alamat email, nomor telepon, dan informasi lain yang Anda berikan saat mendaftar.",
//                 style: AppStyle.bodyXS1(color: AppStyle.black500),
//               ),
//             ],
//           ),
//         ),
//       ],
//     ),
//   );
// }
//
// Widget _buildSecondSection() {
//   return Padding(
//     padding: EdgeInsets.only(
//       top: 16,
//       left: AppStyle.paddingXL,
//       right: AppStyle.paddingXL,
//     ),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "2. Informasi yang Kami Kumpulkan",
//           style: AppStyle.bodyXS2(color: AppStyle.black500),
//         ),
//         SizedBox(height: 12),
//         Text(
//           "Kami dapat mengumpulkan informasi pribadi yang mencakup namun tidak terbatas pada:",
//           style: AppStyle.bodyXS2(color: AppStyle.black500),
//         ),
//         SizedBox(height: 12),
//         RichText(
//           text: TextSpan(
//             children: [
//               TextSpan(
//                 text: "• Informasi Identitas: ",
//                 style: AppStyle.bodyXS2(color: AppStyle.black500),
//               ),
//               TextSpan(
//                 text:
//                     "Nama, alamat email, nomor telepon, dan informasi lain yang Anda berikan saat mendaftar.",
//                 style: AppStyle.bodyXS1(color: AppStyle.black500),
//               ),
//             ],
//           ),
//         ),
//         SizedBox(height: 12),
//         RichText(
//           text: TextSpan(
//             children: [
//               TextSpan(
//                 text: "• Informasi Identitas: ",
//                 style: AppStyle.bodyXS2(color: AppStyle.black500),
//               ),
//               TextSpan(
//                 text:
//                     "Nama, alamat email, nomor telepon, dan informasi lain yang Anda berikan saat mendaftar.",
//                 style: AppStyle.bodyXS1(color: AppStyle.black500),
//               ),
//             ],
//           ),
//         ),
//       ],
//     ),
//   );
// }
//
// Widget _buildThirdSection() {
//   return Padding(
//     padding: EdgeInsets.only(
//       top: 16,
//       left: AppStyle.paddingXL,
//       right: AppStyle.paddingXL,
//     ),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "3. Informasi yang Kami Kumpulkan",
//           style: AppStyle.bodyXS2(color: AppStyle.black500),
//         ),
//         SizedBox(height: 12),
//         Text(
//           "Kami dapat mengumpulkan informasi pribadi yang mencakup namun tidak terbatas pada:",
//           style: AppStyle.bodyXS2(color: AppStyle.black500),
//         ),
//         SizedBox(height: 12),
//         RichText(
//           text: TextSpan(
//             children: [
//               TextSpan(
//                 text: "• Informasi Identitas: ",
//                 style: AppStyle.bodyXS2(color: AppStyle.black500),
//               ),
//               TextSpan(
//                 text:
//                     "Nama, alamat email, nomor telepon, dan informasi lain yang Anda berikan saat mendaftar.",
//                 style: AppStyle.bodyXS1(color: AppStyle.black500),
//               ),
//             ],
//           ),
//         ),
//         SizedBox(height: 12),
//         RichText(
//           text: TextSpan(
//             children: [
//               TextSpan(
//                 text: "• Informasi Identitas: ",
//                 style: AppStyle.bodyXS2(color: AppStyle.black500),
//               ),
//               TextSpan(
//                 text:
//                     "Nama, alamat email, nomor telepon, dan informasi lain yang Anda berikan saat mendaftar.",
//                 style: AppStyle.bodyXS1(color: AppStyle.black500),
//               ),
//             ],
//           ),
//         ),
//       ],
//     ),
//   );
// }
//
// Widget _buildFourthSection() {
//   return Padding(
//     padding: EdgeInsets.only(
//       top: 16,
//       left: AppStyle.paddingXL,
//       right: AppStyle.paddingXL,
//     ),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "4. Informasi yang Kami Kumpulkan",
//           style: AppStyle.bodyXS2(color: AppStyle.black500),
//         ),
//         SizedBox(height: 12),
//         Text(
//           "Kami dapat mengumpulkan informasi pribadi yang mencakup namun tidak terbatas pada:",
//           style: AppStyle.bodyXS2(color: AppStyle.black500),
//         ),
//         SizedBox(height: 12),
//         RichText(
//           text: TextSpan(
//             children: [
//               TextSpan(
//                 text: "• Informasi Identitas: ",
//                 style: AppStyle.bodyXS2(color: AppStyle.black500),
//               ),
//               TextSpan(
//                 text:
//                     "Nama, alamat email, nomor telepon, dan informasi lain yang Anda berikan saat mendaftar.",
//                 style: AppStyle.bodyXS1(color: AppStyle.black500),
//               ),
//             ],
//           ),
//         ),
//         SizedBox(height: 12),
//         RichText(
//           text: TextSpan(
//             children: [
//               TextSpan(
//                 text: "• Informasi Identitas: ",
//                 style: AppStyle.bodyXS2(color: AppStyle.black500),
//               ),
//               TextSpan(
//                 text:
//                     "Nama, alamat email, nomor telepon, dan informasi lain yang Anda berikan saat mendaftar.",
//                 style: AppStyle.bodyXS1(color: AppStyle.black500),
//               ),
//             ],
//           ),
//         ),
//       ],
//     ),
//   );
// }
