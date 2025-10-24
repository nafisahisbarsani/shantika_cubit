import 'package:flutter/material.dart';
import 'package:shantika_cubit/ui/color.dart';
import 'package:shantika_cubit/ui/dimension.dart';
import 'package:shantika_cubit/ui/shared_widget/custom_card.dart';
import 'package:shantika_cubit/ui/typography.dart';


class ArtikelDetailPage extends StatelessWidget {
  const ArtikelDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black00,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildHeaderImage(),
            _buildArticleContent(),
            _buildTipsList(),
            _buildListArtikel(),
          ],
        ),
      ),
    );
  }
}

Widget _buildHeaderImage() {
  return Padding(
    padding: const EdgeInsets.all(spacing6),
    child: Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            'assets/images/artikel_detail1.jpg',
            width: 372,
            height: 120,
            fit: BoxFit.cover,
          ),
        ),
      ],
    ),
  );
}

Widget _buildArticleContent() {
  return Padding(
    padding: const EdgeInsets.only(
      left: 20,
      right: 20,
      top: 10,
    ),
    child: Column(
      children: [
        Text(
          "Pengalaman terbaik dalam perjalanan selama pandemi",
          style: mdRegular,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8),
        Text(
          "Perjalanan selama pandemi menghadirkan tantangan tersendiri, tetapi juga memberikan pengalaman berharga yang sulit dilupakan. Salah satu momen terbaik adalah ketika saya melakukan perjalanan ke daerah terpencil dengan protokol kesehatan yang ketat.",
          style: xsRegular,
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}

Widget _buildTipsList() {
  final List<Map<String, dynamic>> tipsList = [
    {
      'number': '1.',
      'title': 'Penerapan Protokol Kesehatan',
      'image': 'assets/images/doctor.png',
      'description':
          'Mengutamakan kesehatan dengan masker, hand sanitizer, dan menjaga jarak, memberikan rasa aman selama perjalanan.',
    },
    {
      'number': '2.',
      'title': 'Menemukan Keindahan Baru',
      'image': 'assets/images/doctor.png',
      'description':
          'Mengeksplorasi tempat-tempat tersembunyi yang sebelumnya jarang dikunjungi.',
    },
    {
      'number': '3.',
      'title': 'Destinasi Lebih Sepi',
      'image': 'assets/images/doctor.png',
      'description':
          'Wisata yang biasanya ramai menjadi lebih tenang, memungkinkan pengalaman yang lebih intim dengan alam.',
    },
  ];

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: tipsList.length,
      itemBuilder: (context, index) {
        return _buildTipItem(
          number: tipsList[index]['number']!,
          title: tipsList[index]['title']!,
          image: tipsList[index]['image']!,
          description: tipsList[index]['description']!,
        );
      },
    ),
  );
}

Widget _buildTipItem({
  required String number,
  required String title,
  required String description,
  required String image,
}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4.0, bottom: 6),
          child: Text(
            "$number $title",
            style: smRegular,
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            image,
            width: 150,
            height: 116,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 6.0),
          child: Text(
            description,
            style: xsRegular,
          ),
        ),
      ],
    ),
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
      'title': 'Pengalaman terbaik dalam perjalanan selama pandemi',
      'image': 'assets/images/artikel_detail3.jpg',
    },
    {
      'title': 'Pengalaman terbaik dalam perjalanan selama pandemi',
      'image': 'assets/images/artikel_detail4.jpg',
    },
  ];

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Baca Artikel Lainnya",
              style: smSemiBold,
            ),
            Row(
              children: [
                Text(
                  "Selengkapnya",
                  style:smRegular,
                ),
                SizedBox(width: 2),
                Icon(Icons.arrow_forward, size: 16, color: red700,)
              ],
            ),
          ],
        ),
      ),
      ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: artikelList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical:8
            ),
            child: CustomCard(
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
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      artikelList[index]['title']!,
                      style: smRegular,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    ],
  );
}
