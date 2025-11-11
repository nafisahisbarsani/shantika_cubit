import 'package:flutter/material.dart';
import 'package:shantika_cubit/ui/color.dart';
import '../../ui/dimension.dart';
import '../../ui/shared_widget/custom_arrow.dart';
import '../../ui/shared_widget/custom_card.dart';
import '../../ui/typography.dart';

class TestimoniPage extends StatelessWidget {
  const TestimoniPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black00,
      body: SingleChildScrollView(
        child: Column(children: [_buildHeader(), _buildTestimoni()]),
      ),
    );
  }
}

Widget _buildHeader() {
  return Container(
    decoration: BoxDecoration(
      color: black00,
      boxShadow: [
        BoxShadow(
          color: black200.withOpacity(0.3),
          blurRadius: 8,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: CustomArrow(title: "Testimoni"),
  );
}

Widget _buildTestimoni() {
  return Padding(
    padding: EdgeInsets.all(20),
    child: CustomCard(
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
                Text("Esther Howard", style: smMedium),
                Text("13 Feb 2025", style: xsRegular),
              ],
            ),
            SizedBox(height: 8),
            Text("Super Executive", style: xsRegular),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.star, color: yellow400, size: 20),
                Icon(Icons.star, color: yellow400, size: 20),
                Icon(Icons.star, color: yellow400, size: 20),
                Icon(Icons.star, color: yellow400, size: 20),
                Icon(Icons.star, color: yellow400, size: 20),
              ],
            ),
            SizedBox(height: 8),
            Text(
              "Sangat menyenangkan melakukan perjalanan bersama bus Shantika. Supirnya baik dan ramah, ACnya dingin, dan saya bisa tertidur pulas.",
              style: smRegular,
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.square_rounded, color: black300, size: 44),
                Icon(Icons.square_rounded, color: black300, size: 44),
                Icon(Icons.square_rounded, color: black300, size: 44),
                SizedBox(width: 4),
                Align(alignment: Alignment.center, child: Text("+2")),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
