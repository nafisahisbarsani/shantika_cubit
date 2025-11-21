import 'package:flutter/material.dart';
import '../color.dart';
import '../dimension.dart';
import '../typography.dart';

class PaymentMethodBottomSheet extends StatelessWidget {
  final VoidCallback onItemSelected;

  const PaymentMethodBottomSheet({
    Key? key,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: black00,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(borderRadius500),
          topRight: Radius.circular(borderRadius500),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 12),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: bgSurfaceNeutralDark,
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text("Pilih Metode Pembayaran", style: mdMedium),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 30),
            child: InkWell(
              onTap: onItemSelected,
              borderRadius: BorderRadius.circular(8),
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pembayaran otomatis",
                      style: smSemiBold,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "Lakukan pembayaran dengan berbagai bank hanya dengan klik saja tanpa bukti transfer",
                      style: xsRegular.copyWith(
                        color: textDarkTertiary,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}