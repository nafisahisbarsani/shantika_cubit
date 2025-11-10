import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconly/iconly.dart';
import 'package:shantika_cubit/features/article/artikel_detail_page.dart';
import 'package:shantika_cubit/features/article/artikel_page.dart';
import 'package:shantika_cubit/ui/color.dart';
import 'package:shantika_cubit/ui/dimension.dart';
import '../../ui/shared_widget/CustomCarouselCard.dart';
import '../../ui/shared_widget/custom_button.dart';
import '../../ui/shared_widget/custom_card.dart';
import '../../ui/shared_widget/custom_section_divider.dart';
import '../../ui/typography.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, String>> carouselItems = const [
    {'image': 'assets/images/banner_shantika_1.png'},
    {'image': 'assets/images/banner_shantika_2.png'},
    {'image': 'assets/images/banner_shantika_3.png'},
  ];

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
                _buildSearchTicketBusView(),
                SizedBox(height: 20),
                _buildCarouselView(),
                SizedBox(height: 20),
                _buildMenuView(),
                _buildHowYourTrip(),
                _buildHistoryView(),
                _buildPromoView(),
                _buildArticleView(context),
                _buildTestimoniView(context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderView(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: MediaQuery.of(context).size.width * 0.09),
          Image.asset('assets/images/logo_shantika.png'),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications, color: black00),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchTicketBusView() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          CustomCard(
            color: black00,
            borderRadius: BorderRadius.circular(borderRadius500),
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Center(child: Text("Cari Tiket Bus", style: smSemiBold)),
                SizedBox(height: 28),
                Stack(
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: iconDarkTertiary,
                              size: 20,
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Keberangkatan",
                                    style: xsRegular.copyWith(
                                      color: textDarkSecondary,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text("Pilih Keberangkatan", style: smMedium),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 1,
                          color: black300,
                          margin: EdgeInsets.symmetric(
                            vertical: 9.5,
                            horizontal: 40,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: iconDarkTertiary,
                              size: 20,
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Tujuan",
                                    style: xsRegular.copyWith(
                                      color: textDarkSecondary,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text("Pilih Tujuan", style: smMedium),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      bottom: 0,
                      child: Center(
                        child: Icon(
                          IconlyLight.swap,
                          color: iconDarkSecondary,
                          size: 21,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 28),
                CustomButton(
                  onPressed: () {},
                  child: Text(
                    "Cari Tiket",
                    style: smMedium.copyWith(color: black00),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCarouselView() {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        // enlargeCenterPage: true,
        viewportFraction: 0.9,
        aspectRatio: 1.6,
      ),
      items: carouselItems.map((item) {
        return Builder(
          builder: (BuildContext context) {
            return CustomCarouselCard(
              imagePath: item['image']!,
              title: "",
              subtitle: "",
            );
          },
        );
      }).toList(),
    );
  }

  Widget _buildMenuView() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          CustomSectionDivider(text: "Menu Favorit"),
          GridView.count(
            crossAxisCount: 4,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 16,
            crossAxisSpacing: 21.33,
            children: [
              _buildMenuItem("assets/images/img_pesan.png", "Pesan Tiket"),
              _buildMenuItem(
                "assets/images/img_informasi.png",
                "Informasi Armada",
              ),
              _buildMenuItem(
                "assets/images/img_perusahaan.png",
                "Informasi Perusahaan",
              ),
              _buildMenuItem("assets/images/img_shop.png", "New Shantika Shop"),
              _buildMenuItem("assets/images/img_sosmed.png", "Sosial Media"),
              _buildMenuItem("assets/images/img_agen.png", "Informasi Agen"),
              _buildMenuItem(
                "assets/images/img_membership.png",
                "E-Membership",
              ),
              _buildMenuItem("assets/images/img_website.png", "Website"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHowYourTrip() {
    return Padding(
      padding: EdgeInsets.all(20),
      child: CustomCard(
        width: 340,
        height: 116,
        borderRadius: BorderRadius.circular(borderRadius300),
        color: jacarta800,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Bagaimana perjalananmu?",
                      style: xsSemiBold.copyWith(color: black00),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Berikan review untuk pengalaman perjalananmu bersama New Shantika",
                      style: xxsRegular.copyWith(color: black00),
                    ),
                    SizedBox(height: 12),
                    CustomButton(
                      child: Text(
                        "Beri Review",
                        style: xxsMedium.copyWith(color: black950),
                      ),
                      backgroundColor: Colors.white,
                      height: 28,
                      width: 89,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              SizedBox(width: 27.82),
              Image.asset('assets/images/star.png', height: 50.18, width: 48),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHistoryView() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomSectionDivider(text: "Riwayat"),
              Text("Lihat Semua", style: smMedium.copyWith(color: textPrimary)),
            ],
          ),
          SizedBox(height: space500,),
          CustomCard(
            borderRadius: BorderRadius.circular(borderRadius300),
            color: black00,
            padding: EdgeInsets.only(top: 16, left: 20, right: 20, bottom: 16),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Bus 10 • Executive Big Top", style: smMedium),
                        CustomButton(
                          width: 89,
                          height: 22,
                          onPressed: () {},
                          child: Text(
                            "Beri Review",
                            style: xsMedium.copyWith(color: black00),
                          ),
                          backgroundColor: textPrimaryPressed,
                        ),
                      ],
                    ),
                    Text(
                      "11 February 2025 • 20:30",
                      style: xsRegular.copyWith(color: textDarkTertiary),
                    ),
                    SizedBox(height: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: iconDarkSecondary,
                              size: 20,
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Krapyak – Semarang", style: xsMedium),
                                  Text(
                                    "05:30",
                                    style: xxsRegular.copyWith(
                                      color: textDarkTertiary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: iconPrimary,
                              size: 20,
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Gejayan – Sleman", style: xsMedium),
                                  Text(
                                    "09:30",
                                    style: xxsRegular.copyWith(
                                      color: textDarkTertiary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 12 ),
                  ],
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Text(
                    "Rp230.000",
                    style: mdSemiBold.copyWith(color: textPrimary),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPromoView() {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomSectionDivider(text: "Promo"),
              Text(
                "Lihat Semua",
                style: smMedium.copyWith(color: textPrimary),
              ),
            ],
          ),
          SizedBox(height: 20,),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 4),
              itemCount: 3,
              itemBuilder: (context, index) {
                return CustomCard(
                  color: black00,
                  width: 300,
                  margin: EdgeInsets.only(right: 10),
                  borderSide: BorderSide(width: 1, color: borderNeutralLight),
                  padding: EdgeInsets.zero,
                  borderRadius: BorderRadius.circular(borderRadius500),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(borderRadius500),
                        ),
                        child: Image.asset(
                          'assets/images/promo.png',
                          height: 116,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Promo Mudik 2024", style: smMedium),
                            SizedBox(height: 8),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Text(
                                    "Potongan hingga Rp50.000",
                                    style: xsRegular.copyWith(color: textPrimary),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                SizedBox(width: 60),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      IconlyLight.calendar,
                                      size: 20,
                                      color: iconDarkTertiary,
                                    ),
                                    SizedBox(width: 6),
                                    Text(
                                      "28 April 2025",
                                      style: xsRegular.copyWith(color: iconDarkTertiary),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildArticleView(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomSectionDivider(text: "Artikel"),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ArtikelPage()),
                  );
                },
                child: Text(
                  "Lihat Semua",
                  style: smSemiBold.copyWith(color: textPrimary),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CustomCard(
                  color: black00,
                  margin: EdgeInsets.only(right: 10),
                  padding: EdgeInsets.zero,
                  child: Column(
                    children: [
                      Image.asset("assets/images/artikel1.png"),
                      SizedBox(height: 4),
                      Text(
                        "PO New Shantika Tetap\nJalan Selama Larangan",
                        style: xsMedium,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTestimoniView(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomSectionDivider(text: "Testimoni"),
              Text(
                "Lihat Semua",
                style:smMedium.copyWith(color: textPrimary),
              ),
            ],
          ),
          SizedBox(height: 20,),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.30,
            child: ListView.separated(
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) {
                return SizedBox(width: 10);
              },
              itemBuilder: (BuildContext context, int index) {
                return CustomCard(
                  width: 320,
                  borderRadius: BorderRadius.circular(borderRadius300),
                  borderSide: BorderSide(color: borderNeutralLight, width: 1),
                  color: black00,
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Esther Howard",
                              style:smMedium,
                            ),
                            Text(
                              "13 Feb 2025",
                              style: xsRegular,
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Super Executive",
                          style:xsRegular,
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: yellow400,
                              size: 20,
                            ),
                            Icon(
                              Icons.star,
                              color: yellow400,
                              size: 20,
                            ),
                            Icon(
                              Icons.star,
                              color: yellow400,
                              size: 20,
                            ),
                            Icon(
                              Icons.star,
                              color: yellow400,
                              size: 20,
                            ),
                            Icon(
                              Icons.star,
                              color: yellow400,
                              size: 20,
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Sangat menyenangkan melakukan perjalanan bersama bus Shantika. Supirnya baik dan ramah, ACnya dingin, dan saya bisa tertidur pulas.",
                          style:smRegular,
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(
                              Icons.square_rounded,
                              color: black300,
                              size: 44,
                            ),
                            Icon(
                              Icons.square_rounded,
                              color: black300,
                              size: 44,
                            ),
                            Icon(
                              Icons.square_rounded,
                              color: black300,
                              size: 44,
                            ),
                            SizedBox(width: 4),
                            Align(alignment: Alignment.center, child: Text("+2")),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(String asset, String title) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipOval(child: Image.asset(asset, fit: BoxFit.cover)),
        SizedBox(height: 4),
        Text(
          title,
          style: xxsRegular,
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}