import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shantika_cubit/ui/color.dart';
import 'package:shantika_cubit/ui/typography.dart';
import '../article/artikel_page.dart';
import '../notif/notification_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black00,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Image.asset(
                  'assets/images/bg_home.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                Container(height: 800, color: Colors.transparent),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 36),
                _buildHeaderView(context),
                //_buildSearchTicketBusView(),
                SizedBox(height: 20),
                //  _buildCarouselView(),
                SizedBox(height: 20),
                // _buildMenuView(),
                // _buildHowYourTrip(),
                // _buildHistoryView(),
                // _buildPromoView(),
                // _buildArticleView(),
                // _buildTestimoniView(context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: MediaQuery.of(context).size.width * 0.05),
          Image.asset(
            'assets/images/logo_shantika.png',
            // height: 42,
          ),
          // IconButton(
          //   onPressed: () => Get.to(() => NotificationPage()),
          //   icon: Icon(Icons.notifications, color: AppStyle.background),
          // ),
        ],
      ),
    );
  }

  //Widget _buildSearchTicketBusView() {
  // return Padding(
  //   padding: const EdgeInsets.all(20),
  //   child: Column(
  //     children: [
  //       CustomCardContainer(
  //         borderRadius: 20,
  //         padding: EdgeInsets.all(16),
  //         child: Column(
  //           children: [
  //             Center(child: Text("Cari Tiket Bus", style: smRegular)),
  //             SizedBox(height: 28),
  //             Stack(
  //               children: [
  //                 Column(
  //                   children: [
  //                     Row(
  //                       children: [
  //                         Icon(
  //                           Icons.location_on_outlined,
  //                           color: black600,
  //                           size: 20,
  //                         ),
  //                         SizedBox(width: 8),
  //                         Expanded(
  //                           child: Column(
  //                             crossAxisAlignment: CrossAxisAlignment.start,
  //                             children: [
  //                               Text("Keberangkatan", style: xsRegular),
  //                               SizedBox(height: 4),
  //                               Text("Pilih Keberangkatan", style: smRegular),
  //                             ],
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                     Container(
  //                       height: 1,
  //                       color: black300,
  //                       margin: EdgeInsets.symmetric(
  //                         vertical: 9.5,
  //                         horizontal: 40,
  //                       ),
  //                     ),
  //                     Row(
  //                       children: [
  //                         Icon(
  //                           Icons.location_on_outlined,
  //                           color: black600,
  //                           size: 20,
  //                         ),
  //                         SizedBox(width: 8),
  //                         Expanded(
  //                           child: Column(
  //                             crossAxisAlignment: CrossAxisAlignment.start,
  //                             children: [
  //                               Text("Tujuan", style: xsRegular),
  //                               SizedBox(height: 4),
  //
  //                               Text(
  //                                 "Pilih Tujuan",
  //                                 style: smRegular
  //                               ),
  //                             ],
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ],
  //                 ),
  //                 // Positioned(
  //                 //   right: 0,
  //                 //   top: 0,
  //                 //   bottom: 0,
  //                 //   child: Center(
  //                 //     child: Icon(
  //                 //       IconlyLight.swap,
  //                 //       color: AppStyle.black600,
  //                 //       size: AppStyle.iconM,
  //                 //     ),
  //                 //   ),
  //                 // ),
  //               ],
  //             ),
  //             SizedBox(height: 28),
  //           ],
  //         ),
  //       ),
  //     ],
  //   ),
  // );
}

// Widget _buildCarouselView() {
//   return CarouselSlider(
//     options: CarouselOptions(
//       autoPlay: true,
//       // enlargeCenterPage: true,
//       viewportFraction: 0.9,
//       aspectRatio: 1.6,
//     ),
//     items: carouselItems.map((item) {
//       return Builder(
//         builder: (BuildContext context) {
//           return CustomCarouselCard(
//             imagePath: item['image']!,
//             title: "",
//             subtitle: "",
//           );
//         },
//       );
//     }).toList(),
//   );
// }

// Widget _buildMenuView() {
//   return Padding(
//     padding: EdgeInsets.symmetric(horizontal: 20),
//     child: Column(
//       children: [
//         CustomSectionDivider(text: "Menu Favorit"),
//         Wrap(
//           spacing: 21,
//           runSpacing: 16,
//           alignment: WrapAlignment.center,
//           children: [
//             CustomCircleItem(icon: IconlyLight.ticket, label: "Pesan Tiket"),
//             CustomCircleItem(
//               icon: FontAwesome.bus_solid,
//               label: "Info Kelas Armada",
//             ),
//             CustomCircleItem(
//               icon: Bootstrap.building,
//               label: "Informasi Perusahaan",
//             ),
//             CustomCircleItem(
//               icon: Bootstrap.cart3,
//               label: "New Shantika Shop",
//             ),
//             CustomCircleItem(
//               icon: BoxIcons.bxl_instagram,
//               label: "Sosial Media",
//             ),
//             CustomCircleItem(icon: Bootstrap.shop, label: "Informasi Agen"),
//             CustomCircleItem(
//               icon: Bootstrap.credit_card,
//               label: "E-Membership",
//             ),
//             CustomCircleItem(icon: Icons.web_rounded, label: "Website"),
//           ],
//         ),
//       ],
//     ),
//   );
// }
//
// Widget _buildHowYourTrip() {
//   return Padding(
//     padding: EdgeInsets.all(AppStyle.paddingXL),
//     child: CustomCardContainer(
//       width: 340,
//       borderRadius: AppStyle.radiusL,
//       backgroundColor: AppStyle.primary500,
//       child: Row(
//         children: [
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Bagaimana perjalananmu?",
//                   style: AppStyle.bodyXS2(color: AppStyle.background),
//                 ),
//                 SizedBox(height: AppStyle.spaceL),
//                 Text(
//                   "Berikan review untuk pengalaman perjalananmu bersama New Shantika",
//                   style: AppStyle.bodyxxs1(color: AppStyle.background),
//                 ),
//                 SizedBox(height: AppStyle.spaceS),
//                 CustomButton(
//                   text: "Beri Review",
//                   onPressed: () {},
//                   color: AppStyle.background,
//                   textColor: AppStyle.black950,
//                   borderColor: AppStyle.black200,
//                   fontWeight: FontWeight.w500,
//                   fontSize: 10,
//                   borderRadius: 10,
//                   padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(width: 27.82),
//           Image.asset('assets/images/star.png', height: 50.18, width: 48),
//         ],
//       ),
//     ),
//   );
// }
//
// Widget _buildHistoryView() {
//   return Padding(
//     padding: EdgeInsets.symmetric(horizontal: 20),
//     child: Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             CustomSectionDivider(text: "Riwayat"),
//             Text(
//               "Lihat Semua",
//               style: AppStyle.bodySM2(color: AppStyle.primary600),
//             ),
//           ],
//         ),
//         CustomCardContainer(
//           padding: EdgeInsets.all(AppStyle.paddingM),
//           margin: EdgeInsets.only(bottom: AppStyle.spaceS),
//           borderColor: AppStyle.black200,
//           child: Stack(
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         "Bus 10 • Executive Big Top",
//                         style: AppStyle.bodySM2(color: AppStyle.black950),
//                       ),
//                       CustomButton(
//                         text: "Beri Review",
//                         onPressed: () {},
//                         color: AppStyle.primary500,
//                         fontWeight: FontWeight.w500,
//                         fontSize: 10,
//                         borderRadius: 10,
//                         padding: EdgeInsets.symmetric(
//                           horizontal: 16,
//                           vertical: 8,
//                         ),
//                       ),
//                     ],
//                   ),
//                   Transform.translate(
//                     offset: Offset(0, -6),
//                     child: Text(
//                       "11 February 2025 • 20:30",
//                       style: AppStyle.bodyXS2(color: AppStyle.black500),
//                     ),
//                   ),
//                   SizedBox(height: AppStyle.spaceS),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           Icon(
//                             Icons.location_on,
//                             color: AppStyle.black600,
//                             size: 20,
//                           ),
//                           SizedBox(width: AppStyle.spaceS),
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   "Krapyak – Semarang",
//                                   style: AppStyle.bodyXS2(
//                                     color: AppStyle.black950,
//                                   ),
//                                 ),
//                                 Text(
//                                   "05:30",
//                                   style: AppStyle.bodyxxs2(
//                                     color: AppStyle.black500,
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
//                             color: AppStyle.primary600,
//                             size: 20,
//                           ),
//                           SizedBox(width: AppStyle.spaceS),
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   "Gejayan – Sleman",
//                                   style: AppStyle.bodyXS2(
//                                     color: AppStyle.black950,
//                                   ),
//                                 ),
//                                 Text(
//                                   "09:30",
//                                   style: AppStyle.bodyxxs2(
//                                     color: AppStyle.black500,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: AppStyle.spaceXXL),
//                 ],
//               ),
//               Positioned(
//                 right: 0,
//                 bottom: 0,
//                 child: Text(
//                   "Rp230.000",
//                   style: AppStyle.bodyMD2(color: AppStyle.primary600),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     ),
//   );
// }
//
// Widget _buildPromoView() {
//   return Padding(
//     padding: EdgeInsets.symmetric(horizontal: 20),
//     child: Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             CustomSectionDivider(text: "Promo"),
//             Text(
//               "Lihat Semua",
//               style: AppStyle.bodySM2(color: AppStyle.primary600),
//             ),
//           ],
//         ),
//         SizedBox(
//           height: 200,
//           child: ListView.builder(
//             scrollDirection: Axis.horizontal,
//             padding: EdgeInsets.symmetric(horizontal: AppStyle.paddingXS),
//             itemCount: 3,
//             itemBuilder: (context, index) {
//               return CustomCardContainer(
//                 width: 300,
//                 margin: EdgeInsets.only(right: AppStyle.spaceM),
//                 borderColor: AppStyle.black200,
//                 borderRadius: AppStyle.radiusL,
//                 padding: EdgeInsets.zero,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       height: 116,
//                       width: double.infinity,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(AppStyle.radiusL),
//                           topRight: Radius.circular(AppStyle.radiusL),
//                         ),
//                         image: DecorationImage(
//                           image: AssetImage('assets/images/promo.png'),
//                           fit: BoxFit.contain,
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.all(AppStyle.paddingM),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "Promo Mudik 2024",
//                             style: AppStyle.bodySM2(color: AppStyle.black950),
//                           ),
//                           SizedBox(height: AppStyle.spaceS),
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Expanded(
//                                 child: Text(
//                                   "Potongan hingga Rp50.000",
//                                   style: AppStyle.bodyXS1(
//                                     color: AppStyle.primary600,
//                                   ),
//                                   overflow: TextOverflow.ellipsis,
//                                 ),
//                               ),
//                               SizedBox(width: 60),
//                               Flexible(
//                                 fit: FlexFit.loose,
//                                 child: Row(
//                                   mainAxisSize: MainAxisSize.min,
//                                   children: [
//                                     Icon(
//                                       IconlyLight.calendar,
//                                       size: AppStyle.iconM,
//                                       color: AppStyle.black500,
//                                     ),
//                                     SizedBox(width: AppStyle.spaceL),
//                                     Flexible(
//                                       child: Text(
//                                         "28 April 2025",
//                                         style: AppStyle.bodyXS1(
//                                           color: AppStyle.black500,
//                                         ),
//                                         overflow: TextOverflow.ellipsis,
//                                         softWrap: false,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             },
//           ),
//         ),
//       ],
//     ),
//   );
// }
//
// Widget _buildArticleView() {
//   return Padding(
//     padding: EdgeInsets.symmetric(horizontal: 20),
//     child: Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             CustomSectionDivider(text: "Artikel"),
//             TextButton(
//               onPressed: () => Get.to(() => ArtikelPage()),
//               child: Text(
//                 "Lihat Semua",
//                 style: AppStyle.bodySM2(color: AppStyle.primary100),
//               ),
//             ),
//           ],
//         ),
//         SizedBox(
//           height: 200,
//           child: ListView.builder(
//             itemCount: 3,
//             scrollDirection: Axis.horizontal,
//             itemBuilder: (context, index) {
//               return CustomCardContainer(
//                 // width: 300,
//                 // borderRadius: AppStyle.radiusL,
//                 // borderColor: AppStyle.black200,
//                 margin: EdgeInsets.only(right: AppStyle.spaceM),
//                 padding: EdgeInsets.zero,
//                 child: Column(
//                   children: [
//                     Image.asset("assets/images/artikel1.png"),
//                     SizedBox(height: AppStyle.spaceXS),
//                     Text(
//                       "PO New Shantika Tetap\nJalan Selama Larangan",
//                       style: AppStyle.bodyXS2(color: AppStyle.black500),
//                     ),
//                   ],
//                 ),
//               );
//             },
//           ),
//         ),
//       ],
//     ),
//   );
// }
//
// Widget _buildTestimoniView(BuildContext context) {
//   return Padding(
//     padding: EdgeInsets.symmetric(horizontal: 20),
//     child: Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             CustomSectionDivider(text: "Testimoni"),
//             Text(
//               "Lihat Semua",
//               style: AppStyle.bodySM2(color: AppStyle.primary100),
//             ),
//           ],
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.37,
//           child: ListView.separated(
//             itemCount: 3,
//             scrollDirection: Axis.horizontal,
//             separatorBuilder: (context, index) {
//               return SizedBox(width: AppStyle.spaceM);
//             },
//             itemBuilder: (BuildContext context, int index) {
//               return CustomCardContainer(
//                 width: 320,
//                 margin: EdgeInsets.only(bottom: AppStyle.spaceM),
//                 borderColor: AppStyle.black200,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           "Esther Howard",
//                           style: AppStyle.bodySM3(color: AppStyle.black500),
//                         ),
//                         Text(
//                           "13 Feb 2025",
//                           style: AppStyle.bodyXS1(color: AppStyle.black400),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: AppStyle.spaceS),
//                     Text(
//                       "Super Executive",
//                       style: AppStyle.bodyXS1(color: AppStyle.black500),
//                     ),
//                     SizedBox(height: AppStyle.spaceS),
//                     Row(
//                       children: [
//                         Icon(
//                           Icons.star,
//                           color: AppStyle.rate,
//                           size: AppStyle.iconM,
//                         ),
//                         Icon(
//                           Icons.star,
//                           color: AppStyle.rate,
//                           size: AppStyle.iconM,
//                         ),
//                         Icon(
//                           Icons.star,
//                           color: AppStyle.rate,
//                           size: AppStyle.iconM,
//                         ),
//                         Icon(
//                           Icons.star,
//                           color: AppStyle.rate,
//                           size: AppStyle.iconM,
//                         ),
//                         Icon(
//                           Icons.star,
//                           color: AppStyle.rate,
//                           size: AppStyle.iconM,
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: AppStyle.spaceS),
//                     Text(
//                       "Sangat menyenangkan melakukan perjalanan bersama bus Shantika. Supirnya baik dan ramah, ACnya dingin, dan saya bisa tertidur pulas.",
//                       style: AppStyle.bodySM1(color: AppStyle.black500),
//                     ),
//                     SizedBox(height: AppStyle.spaceS),
//                     Row(
//                       children: [
//                         Icon(
//                           Icons.square_rounded,
//                           color: AppStyle.black300,
//                           size: 44,
//                         ),
//                         Icon(
//                           Icons.square_rounded,
//                           color: AppStyle.black300,
//                           size: 44,
//                         ),
//                         Icon(
//                           Icons.square_rounded,
//                           color: AppStyle.black300,
//                           size: 44,
//                         ),
//                         SizedBox(width: AppStyle.spaceXS),
//                         Align(alignment: Alignment.center, child: Text("+2")),
//                       ],
//                     ),
//                   ],
//                 ),
//               );
//             },
//           ),
//         ),
//       ],
//     ),
//   );
// }
