import 'package:flutter/material.dart';
import 'package:shantika_cubit/features/article/artikel_detail_page.dart';
import 'package:shantika_cubit/ui/color.dart';
import 'package:shantika_cubit/ui/dimension.dart';
import 'package:shantika_cubit/ui/shared_widget/custom_card.dart';
import 'package:shantika_cubit/ui/shared_widget/custom_textfield.dart';
import 'package:shantika_cubit/ui/typography.dart';

import '../../ui/shared_widget/custom_arrow.dart';


class ArtikelPage extends StatelessWidget {
  const ArtikelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black00,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomArrow(title: "Artikel"),
            _buildSearchBar(),
            _buildListArtikel(),
          ],
        ),
      ),
    );
  }
}

Widget _buildSearchBar() {
  return Padding(
    padding: const EdgeInsets.only(
      left: 20,
      right: 20,
      top: 12,
    ),
    child: CustomTextfield(isIcon: true, icon: Icons.search, text: "Cari Artikel",)
  );
}

Widget _buildListArtikel() {
  final List<Map<String, String>> artikelList = [
    {
      'title': 'Pengalaman terbaik dalam perjalanan selama pandemi',
      'image': 'assets/images/artikel_detail1.jpg',
    },
    {
      'title': 'Penerapan Protokol Kesehatan Dalam perjalanan',
      'image': 'assets/images/artikel_detail2.jpg',
    },
    {
      'title': 'Tips Aman Bepergian Bersama Keluarga',
      'image': 'assets/images/artikel_detail3.jpg',
    },
    {
      'title': 'Kenali Rute Perjalanan Favorit Penumpang',
      'image': 'assets/images/artikel_detail4.jpg',
    },
  ];

  return ListView.builder(
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount: artikelList.length,
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: CustomCard(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ArtikelDetailPage()),
            );
          },
          borderRadius: BorderRadius.circular(borderRadius300),
          borderSide: BorderSide(width: 1, color: borderNeutralLight),
          padding: EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                child: Image.asset(
                  artikelList[index]['image']!,
                  width: double.infinity,
                  height: 160,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  artikelList[index]['title']!,
                  style: smRegular
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
