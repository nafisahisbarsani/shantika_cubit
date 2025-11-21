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

class DetailPesanPage extends StatefulWidget {
  const DetailPesanPage({super.key});

  @override
  State<DetailPesanPage> createState() => _DetailPesanPageState();
}

class _DetailPesanPageState extends State<DetailPesanPage> {
  String? selectedPaymentMethod;

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
    // Your existing implementation
    return Container();
  }

  Widget _buildCustomerData() {
    // Your existing implementation
    return Container();
  }

  Widget _buildTravelPayment() {
    // Your existing implementation
    return Container();
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Pilih Metode Pembayaran",
                        style: smRegular.copyWith(color: primaryColor),
                      ),
                      if (selectedPaymentMethod != null) ...[
                        const SizedBox(height: 4),
                        Text(
                          selectedPaymentMethod!,
                          style: xsRegular.copyWith(color: textDarkTertiary),
                        ),
                      ],
                    ],
                  ),
                ),
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
}
