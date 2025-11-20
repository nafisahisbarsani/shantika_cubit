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

      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: black00,
          boxShadow: [
            BoxShadow(
              color: black200.withOpacity(0.2),
              blurRadius: 6,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
            const SizedBox(height: 12),
            CustomButton(
              onPressed: () {},
              width: double.infinity,
              height: 40,
              child: Text(
                "Bayar",
                style: smMedium.copyWith(color: black00),
              ),
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            _buildBusTypes(),
            _buildTravelInformation(),
            const SizedBox(height: 8),
            _buildCustomerData(),
            const SizedBox(height: 8),
            _buildTravelPayment(),
            const SizedBox(height: 8),
            _buildPaymentMethod(),
            const SizedBox(height: 20),
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
      padding: const EdgeInsets.all(20),
      child: CustomCard(
        borderSide: BorderSide(width: 1, color: black50),
        borderRadius: BorderRadius.circular(borderRadius300),
        shadow: [BoxShadow(color: black100, blurRadius: 2)],
        height: 74,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        statusColor: borderSurfacePrimary,
        statusText: "2 Penumpang",
        statusTextColor: textPrimary,
        statusIcon: "assets/images/seat.svg",
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/images/bus.svg", height: 40, width: 40),
            const SizedBox(width: 20),
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
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: CustomCard(
        borderSide: BorderSide(width: 1, color: black50),
        borderRadius: BorderRadius.circular(borderRadius300),
        shadow: [BoxShadow(color: black100, blurRadius: 2)],
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Informasi Perjalanan", style: smSemiBold),
            const SizedBox(height: 16),

            _buildLocationRow(
              iconColor: iconDisabled,
              title: "Agen Keberangkatan",
              location: "Krapyak - Semarang",
              time: "• 18:30",
              svgAsset: 'assets/images/ic_maps.svg',
            ),

            const SizedBox(height: 16),

            _buildLocationRow(
              iconColor: iconDisabled,
              title: "Agen Tujuan",
              location: "Gejayan - Sieman",
              time: "• 18:30",
              svgAsset: 'assets/images/ic_maps.svg',
            ),

            const SizedBox(height: 16),

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

  Widget _buildCustomerData() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: CustomCard(
        borderSide: BorderSide(width: 1, color: black50),
        borderRadius: BorderRadius.circular(borderRadius300),
        shadow: [BoxShadow(color: black100, blurRadius: 2)],
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Data Pemesanan", style: smSemiBold),
            const SizedBox(height: 10),
            _buildData(
              name: "test",
              phone: "12345",
              seat: "Jumlah Seat (2)",
              seatNumber: "21, 22",
              textColor: black950,
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildTravelPayment() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: CustomCard(
        borderSide: BorderSide(width: 1, color: black50),
        borderRadius: BorderRadius.circular(borderRadius300),
        shadow: [BoxShadow(color: black100, blurRadius: 2)],
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Informasi Pembayaran", style: smSemiBold),
            const SizedBox(height: 10),
            _buildPaymentRow(
              iconColor: iconDisabled,
              title: "Total Harga Tiket",
              subtitle: "Rp400.000",
              textColor: textDarkSecondary,
              svgAsset: 'assets/images/ic_money.svg',
              subtitleColor: black950,
              iconSize: 12,
            ),
            const SizedBox(height: 10),
            _buildPaymentRow(
              iconColor: iconDisabled,
              title: "ID Membership",
              subtitle: "SHNTK00127",
              textColor: textDarkSecondary,
              svgAsset: 'assets/images/profile.svg',
              subtitleColor: black950,
            ),
            const SizedBox(height: 10),
            _buildPaymentRow(
              iconColor: iconDisabled,
              title: "Potongan Membership 5%",
              subtitle: "Rp20.000",
              textColor: textDarkSecondary,
              svgAsset: 'assets/images/ic_percent.svg',
              subtitleColor: black950,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentMethod() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: CustomCard(
        borderSide: BorderSide(width: 1, color: black50),
        borderRadius: BorderRadius.circular(borderRadius300),
        shadow: [BoxShadow(color: black100, blurRadius: 2)],
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Metode Pembayaran", style: smSemiBold),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Pilih Metode Pembayaran",
                  style: smRegular.copyWith(color: primaryColor),
                ),
                Icon(Icons.keyboard_arrow_right_rounded,
                    color: iconDarkSecondary),
              ],
            ),
          ],
        ),
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
        SvgPicture.asset(svgAsset, width: 16, height: 16, color: iconColor),
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
        SvgPicture.asset(svgAsset, width: 16, height: 16, color: iconDisabled),
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
              Text(
                subtitle,
                style: smMedium.copyWith(color: subtitleColor ?? textColor),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildData({
    required String name,
    required String phone,
    required String seat,
    required String seatNumber,
    required Color textColor,
    Color? subtitleColor,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: smMedium.copyWith(color: subtitleColor ?? textColor),
            ),
            const SizedBox(height: 4),
            Text(phone, style: xsRegular.copyWith(color: textDarkSecondary)),
            const SizedBox(height: 16),
            Text(
              seat,
              style: smMedium.copyWith(color: subtitleColor ?? textColor),
            ),
            const SizedBox(height: 4),
            Text(
              seatNumber,
              style: xsRegular.copyWith(color: textDarkSecondary),
            ),
          ],
        ),
      ],
    );
  }
}
