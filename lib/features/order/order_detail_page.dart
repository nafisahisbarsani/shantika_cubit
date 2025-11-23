import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shantika_cubit/ui/color.dart';
import 'package:shantika_cubit/ui/dimension.dart';
import 'package:shantika_cubit/ui/typography.dart';
import '../../ui/shared_widget/custom_arrow.dart';
import '../../ui/shared_widget/custom_button.dart';
import '../../ui/shared_widget/custom_card.dart';
import '../../ui/shared_widget/payment_method_bottom_sheet.dart';
import '../../ui/shared_widget/sheet/custom_bottom_sheet.dart';

class OrderDetailPage extends StatefulWidget {
  const OrderDetailPage({super.key});

  @override
  State<OrderDetailPage> createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  String? selectedPaymentMethod;
  String? selectedPaymentDescription;
  bool isCustomerDataExpanded = false;

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
              child: Text("Bayar", style: smMedium.copyWith(color: black00)),
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
            Text("Data Pemesan", style: smSemiBold),
            const SizedBox(height: 12),

            // Name
            Text(
              "Anastasia Caroline",
              style: smMedium.copyWith(color: black950),
            ),
            const SizedBox(height: 4),

            // Phone
            Text(
              "+628881819291",
              style: xsRegular.copyWith(color: textDarkTertiary),
            ),
            const SizedBox(height: 12),

            GestureDetector(
              onTap: () {
                setState(() {
                  isCustomerDataExpanded = !isCustomerDataExpanded;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "Jumlah Seat (2)",
                        style: smMedium.copyWith(color: black950),
                      ),
                      SizedBox(width: 6),
                      SvgPicture.asset('assets/images/ic_export.svg'),
                    ],
                  ),
                  Icon(
                    isCustomerDataExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: iconDarkSecondary,
                  ),
                ],
              ),
            ),

            if (!isCustomerDataExpanded) ...[
              const SizedBox(height: 4),
              Text(
                "12, 23",
                style: xsRegular.copyWith(color: textDarkTertiary),
              ),
            ],

            if (isCustomerDataExpanded) ...[
              SizedBox(height: 12),

              _buildSeatDetail("Rp120.000", "x1 Default"),
              SizedBox(height: 8),
              _buildSeatDetail("Rp200.000", "x1 First Class"),
            ],
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
        onTap: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (bottomSheetContext) {
              return PaymentMethodBottomSheet(
                onItemSelected: () {
                  setState(() {
                    selectedPaymentMethod = 'Pembayaran otomatis';
                    selectedPaymentDescription =
                        'Lakukan pembayaran dengan berbagai bank hanya dengan satu klik saja tanpa ribet';
                  });
                  Navigator.pop(bottomSheetContext);
                },
              );
            },
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Metode Pembayaran", style: smSemiBold),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: selectedPaymentMethod == null
                      ? Text(
                          "Pilih Metode Pembayaran",
                          style: smRegular.copyWith(color: primaryColor),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              selectedPaymentMethod!,
                              style: smMedium.copyWith(color: black950),
                            ),
                            if (selectedPaymentDescription != null) ...[
                              const SizedBox(height: 4),
                              Text(
                                selectedPaymentDescription!,
                                style: xsRegular.copyWith(
                                  color: textDarkTertiary,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ],
                        ),
                ),
                const SizedBox(width: 8),
                Icon(
                  Icons.keyboard_arrow_right_rounded,
                  color: iconDarkSecondary,
                ),
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

  Widget _buildSeatDetail(String price, String seatType) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(price, style: smMedium.copyWith(color: black950)),
        Text(seatType, style: xsRegular.copyWith(color: textDarkTertiary)),
      ],
    );
  }
}
