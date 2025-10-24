// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:shantika_pkl/widgets/app_style.dart';
// import 'package:shantika_pkl/widgets/custom_text_field.dart';
// import '../../widgets/custom_arrow.dart';
// import '../../widgets/custom_button.dart';
//
// class PersonalInfo extends StatelessWidget {
//   const PersonalInfo({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppStyle.background,
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(AppStyle.paddingL),
//         child: Column(
//           children: [_buildHeader(), _buildProfileHeader(), _buildInput(),_buildButton()],
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
//             color: AppStyle.black200,
//             blurRadius: 8,
//             offset: const Offset(0, 3),
//           ),
//         ],
//       ),
//       child: CustomArrow(title: "Informasi Pribadi"),
//     );
//   }
//
//   Widget _buildProfileHeader() {
//     return Padding(
//       padding: EdgeInsets.only(
//         top: AppStyle.paddingL,
//         bottom: AppStyle.paddingL,
//         left: AppStyle.paddingXL,
//         right: AppStyle.paddingXL,
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Stack(
//             children: [
//               CircleAvatar(
//                 radius: AppStyle.radiusXXXL,
//                 backgroundColor: AppStyle.black300,
//                 child: Icon(
//                   Icons.person,
//                   size: AppStyle.iconXXL,
//                   color: AppStyle.background,
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(width: 24),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 "Anastasya Carolina",
//                 style: AppStyle.bodyXL(color: AppStyle.black500),
//               ),
//               SizedBox(height: AppStyle.spaceS),
//               Row(
//                 children: [
//                   Text(
//                     "Member New Shantika",
//                     style: AppStyle.bodySM1(color: AppStyle.black500),
//                   ),
//                   SizedBox(width: 4),
//                   Icon(Icons.check_circle, size: 14, color: AppStyle.black500),
//                 ],
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildInput() {
//     return Padding(
//       padding: EdgeInsets.only(
//         top: AppStyle.paddingXL,
//         left: AppStyle.paddingXL,
//         right: AppStyle.paddingXL,
//         bottom: AppStyle.paddingL,
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           CustomTextField(
//             isObsecure: false,
//             title: "Nama Lengkap",
//             hintText: "Anastasya Carolina",
//             width: 348,
//             height: 36,
//           ),
//           SizedBox(height: 16),
//           CustomTextField(
//             isObsecure: false,
//             title: "Nomor Telepon",
//             hintText: "083745552724",
//             width: 348,
//             height: 36,
//           ),
//           SizedBox(height: 16),
//           CustomTextField(
//             isObsecure: false,
//             title: "Email",
//             hintText: "anastasyacarolina@gmail.com",
//             width: 348,
//             height: 36,
//           ),
//           SizedBox(height: 16),
//           Row(
//             children: [
//               CustomTextField(
//                 isObsecure: false,
//                 title: "Tempat Lahir",
//                 hintText: "Semarang",
//                 width: 137,
//                 height: 36,
//               ),
//               SizedBox(width: 12),
//               CustomTextField(
//                 isObsecure: false,
//                 title: "Tempat Lahir",
//                 hintText: "03 Oktober 2006",
//                 width: 137,
//                 height: 36,
//               ),
//             ],
//           ),
//           SizedBox(height: 16),
//           _buildGender(),
//           SizedBox(height: 16),
//           CustomTextField(
//             isObsecure: false,
//             title: "Alamat Lengkap",
//             hintText: "Jl Sentiyaki Raya No 48, Semarang Utara",
//             width: 348,
//             height: 104,
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// Widget _buildGender() {
//   return Container(
//     width: 372,
//     child: Column(
//       mainAxisSize: MainAxisSize.min,
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'Gender',
//           style: GoogleFonts.poppins(
//             color: const Color(0xFF111827),
//             fontSize: 14,
//             fontWeight: FontWeight.w500,
//             height: 1.43,
//           ),
//         ),
//         const SizedBox(height: 6),
//         Container(
//           width: double.infinity,
//           height: 48,
//           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//           clipBehavior: Clip.antiAlias,
//           decoration: ShapeDecoration(
//             color: Colors.white,
//             shape: RoundedRectangleBorder(
//               side: const BorderSide(
//                 width: 1,
//                 color: Color(0x1E030712),
//               ),
//               borderRadius: BorderRadius.circular(10),
//             ),
//           ),
//           child: Row(
//             mainAxisSize: MainAxisSize.min,
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Row(
//                 mainAxisSize: MainAxisSize.min,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   _buildGenderOption('Pria', 'male'),
//                   const SizedBox(width: 32),
//                   _buildGenderOption('Wanita', 'female'),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ],
//     ),
//   );
// }
//
// Widget _buildGenderOption(String label, String value) {
//   return GestureDetector(
//     onTap: () {
//       // Handle gender selection here
//       print('Selected: $value');
//     },
//     child: Row(
//       mainAxisSize: MainAxisSize.min,
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Container(
//           width: 20,
//           height: 20,
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             border: Border.all(
//               color: const Color(0xFFD1D5DB),
//               width: 2,
//             ),
//           ),
//           child: Container(
//             margin: const EdgeInsets.all(2),
//             decoration: const BoxDecoration(
//               shape: BoxShape.circle,
//               color: Colors.transparent,
//             ),
//           ),
//         ),
//         const SizedBox(width: 8),
//         Text(
//           label,
//           style: GoogleFonts.poppins(
//             color: const Color(0xFF6B7280),
//             fontSize: 16,
//             fontWeight: FontWeight.w400,
//             height: 1.50,
//           ),
//         ),
//       ],
//     ),
//   );
// }
//
// Widget _buildButton() {
//   return Padding(
//     padding: EdgeInsets.only(
//       top: AppStyle.paddingM,
//       left: AppStyle.paddingXL,
//       right: AppStyle.paddingXL,
//     ),
//     child: Center(
//       child: CustomButton(
//         text: "Simpan",
//         onPressed: (){},
//         color: AppStyle.primary200,
//         width: 372,
//         fontSize: 16,
//         height: 48,
//       ),
//     ),
//   );
// }
//
