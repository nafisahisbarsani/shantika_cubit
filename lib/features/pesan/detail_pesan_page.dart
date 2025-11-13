import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shantika_cubit/ui/color.dart';
import 'package:shantika_cubit/ui/dimension.dart';
import 'package:shantika_cubit/ui/typography.dart';
import '../../ui/shared_widget/custom_arrow.dart';
import '../../ui/shared_widget/custom_button.dart';
import '../../ui/shared_widget/custom_card.dart';

class DetailPesanPage extends StatelessWidget {
  const DetailPesanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black00,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            _buildBusTypes(),
            _buildTravelInformation(),
            SizedBox(height: 8),
            _buildTravelPayment(),
            SizedBox(height: 8),
            _buildBottomSection(),
          ],
        ),
      ),
    );
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
      child: const CustomArrow(title: "Detail Pesanan"),
    );
  }

  Widget _buildBusTypes() {
    return Padding(
      padding: EdgeInsets.all(20),
      child: CustomCard(
        borderSide: BorderSide(width: 2, color: black100),
        borderRadius: BorderRadius.circular(borderRadius300),
        shadow: [BoxShadow(color: black100, blurRadius: 2)],
        height: 74,
        padding: EdgeInsets.symmetric(horizontal: 12),
        statusColor: borderSurfacePrimary,
        statusText: "2 Penumpang",
        statusTextColor: textPrimary,
        statusIcon: "assets/images/seat.svg",
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/images/bus.svg", height: 40, width: 40),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Bus 10", style: smMedium),
                  Text(
                    "Executive",
                    style: xsRegular.copyWith(color: textDarkTertiary),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTravelInformation() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: CustomCard(
        borderSide: BorderSide(width: 2, color: black100),
        borderRadius: BorderRadius.circular(borderRadius300),
        shadow: [BoxShadow(color: black100, blurRadius: 2)],
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Informasi Perjalanan", style: smSemiBold),
            SizedBox(height: 16),

            _buildLocationRow(
              iconColor: iconDisabled,
              title: "Agen Keberangkatan",
              location: "Krapyak - Semarang",
              time: "• 18:30",
              svgAsset: 'assets/images/ic_maps.svg',
            ),

            SizedBox(height: 16),

            _buildLocationRow(
              iconColor: iconDisabled,
              title: "Agen Tujuan",
              location: "Gejayan - Sieman",
              time: "• 18:30",
              svgAsset: 'assets/images/ic_maps.svg',
            ),

            SizedBox(height: 16),

            _buildInfoRow(
              title: "Tanggal Keberangkatan",
              value: "20 Jan 2025 - 07:40",
              svgAsset: 'assets/images/ic_calender.svg',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTravelPayment() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: CustomCard(
        borderSide: BorderSide(width: 2, color: black100),
        borderRadius: BorderRadius.circular(borderRadius300),
        shadow: [BoxShadow(color: black100, blurRadius: 2)],
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Informasi Pembayaran", style: smSemiBold),
            SizedBox(height: 10),
            _buildPaymentRow(
              iconColor: iconDisabled,
              title: "Total Harga Tiket",
              subtitle: "Rp400.000",
              textColor: textDarkSecondary,
              svgAsset: 'assets/images/ic_money.svg',
              subtitleColor: black950,
              iconSize: 12
            ),
            SizedBox(height: 10),
            _buildPaymentRow(
              iconColor: iconDisabled,
              title: "ID Membership",
              subtitle: "SHNTK00127",
              textColor: textDarkSecondary,
              svgAsset: 'assets/images/profile.svg',
              subtitleColor: black950,

            ),
            SizedBox(height: 10),
            _buildPaymentRow(
              iconColor: iconDisabled,
              title: "Potongan Membership 5%",
              subtitle: "Rp20.000",
              textColor: textDarkSecondary,
              svgAsset: 'assets/images/ic_percent.svg',
              subtitleColor: black950,

            ),
            SizedBox(height: 10),
            _buildPaymentRow(
              iconColor: iconDisabled,
              title: "Metode Pembayaran",
              subtitle: "Pembayaran Instant",
              textColor: textDarkSecondary,
              svgAsset: 'assets/images/ic_wallet.svg',
              subtitleColor: black950,

            ),
            SizedBox(height: 10),
            _buildPaymentRow(
              iconColor: iconDisabled,
              title: "Status",
              subtitle: "Lunas",
              subtitleColor: textSuccess,
              textColor: textDarkSecondary,
              svgAsset: 'assets/images/ic_wallet.svg',
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomSection() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: black00,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(borderRadius500),
          topRight: Radius.circular(borderRadius500),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Pembayaran',
                      style: xsRegular.copyWith(color: textDarkSecondary),
                    ),
                    Text('Rp380.000', style: mdSemiBold),
                  ],
                ),
                SizedBox(height: 12),
                CustomButton(
                  onPressed: () {},
                  width: 372,
                  height: 40,
                  child: Text(
                    "Lihat Tiket",
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

  Widget _buildLocationRow({
    required String svgAsset,
    required Color iconColor,
    required String title,
    required String location,
    required String time,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          svgAsset,
          width: 16,
          height: 16,
          color: iconColor,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: xsRegular.copyWith(color: textDarkSecondary)),
              const SizedBox(height: 4),
              Row(
                children: [
                  Text(location, style: smMedium),
                  const SizedBox(width: 4),
                  Text(time, style: smMedium),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }


  Widget _buildInfoRow({
    required String svgAsset,
    required String title,
    required String value,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          svgAsset,
          width: 16,
          height: 16,
          color: iconDisabled,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: xsRegular.copyWith(color: textDarkSecondary)),
              const SizedBox(height: 4),
              Text(value, style: smMedium),
            ],
          ),
        ),
      ],
    );
  }

}

Widget _buildPaymentRow({
  required String svgAsset,
  required Color iconColor,
  required String title,
  required String subtitle,
  required Color textColor,
  Color? subtitleColor,
  double iconSize = 16,
}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SvgPicture.asset(
        svgAsset,
        width: iconSize,
        height: iconSize,
        color: iconColor,
      ),
      const SizedBox(width: 8),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: xsRegular.copyWith(color: textDarkSecondary)),
            const SizedBox(height: 4),
            Text(subtitle, style: smMedium.copyWith(color: subtitleColor ?? textColor)),
          ],
        ),
      ),
    ],
  );
}


