import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shantika_cubit/features/order/detail_pesan_page.dart';
import 'package:shantika_cubit/ui/color.dart';
import 'package:shantika_cubit/ui/dimension.dart';
import 'package:shantika_cubit/ui/shared_widget/custom_button.dart';
import 'package:shantika_cubit/ui/typography.dart';
import '../../ui/shared_widget/custom_text_form_field.dart';
import '../../ui/shared_widget/custom_textfield.dart';

class SeatSelectionPage extends StatefulWidget {
  const SeatSelectionPage({super.key});

  @override
  State<SeatSelectionPage> createState() => _SeatSelectionPageState();
}

class _SeatSelectionPageState extends State<SeatSelectionPage> {
  Set<String> selectedSeats = {};
  int seatPriceRegular = 125000;
  bool isExpanded = false;
  bool isLowerSelected = true;

  // TEXT FIELD CONTROLLERS
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  int get totalPrice => selectedSeats.length * seatPriceRegular;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgSurfaceNeutralLight,

      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(context),
            _buildSeatType(),
            _buildSeatPlan(),
            const SizedBox(height: 20),
          ],
        ),
      ),

      bottomNavigationBar: selectedSeats.isEmpty
          ? _buildNormalBottomButton()
          : _buildPriceBottomPanel(),
    );
  }

  // ---------------------------------------------------------
  // HEADER
  // ---------------------------------------------------------
  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 16),
      color: black00,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(Icons.arrow_back, color: black950, size: 24),
              ),
              const SizedBox(width: 12),
              Text("Pilih Kursi", style: xlMedium),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius200),
              color: black00,
              border: Border.all(color: jacarta800, width: 1),
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => setState(() => isLowerSelected = true),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    decoration: BoxDecoration(
                      color: isLowerSelected ? jacarta800 : Colors.transparent,
                      borderRadius: BorderRadius.circular(borderRadius150),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/images/ic_arrow_down.svg",
                          colorFilter: ColorFilter.mode(
                            isLowerSelected ? black00 : black950,
                            BlendMode.srcIn,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text("Bawah",
                            style: xsMedium.copyWith(
                                color: isLowerSelected ? black00 : black950)),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => setState(() => isLowerSelected = false),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    decoration: BoxDecoration(
                      color: !isLowerSelected ? jacarta800 : Colors.transparent,
                      borderRadius: BorderRadius.circular(borderRadius150),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/images/ic_arrow_up.svg",
                          colorFilter: ColorFilter.mode(
                            !isLowerSelected ? black00 : black950,
                            BlendMode.srcIn,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text("Atas",
                            style: xsMedium.copyWith(
                                color: !isLowerSelected ? black00 : black950)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------
  // SEAT TYPE LEGEND
  // ---------------------------------------------------------
  Widget _buildSeatType() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: const BoxDecoration(color: black00),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset("assets/images/ic_warning.svg"),
              const SizedBox(width: 8),
              Text("Tipe Kursi", style: smMedium),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _seatTypeItem("assets/images/ic_seat_unavailable.svg", "Tidak", "Tersedia"),
              _seatTypeItem("assets/images/ic_seat_selected.svg", "Sudah", "Dipilih"),
              _seatTypeItem("assets/images/ic_seat_regular.svg", "Reguler", "Rp125.000"),
              _seatTypeItem("assets/images/ic_seat_vip.svg", "First Class", "Rp205.000"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _seatTypeItem(String icon, String title, String subtitle) {
    return Row(
      children: [
        SvgPicture.asset(icon),
        const SizedBox(width: 6),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: xxsRegular),
            Text(subtitle, style: xxsRegular),
          ],
        ),
      ],
    );
  }

  // ---------------------------------------------------------
  // SEAT PLAN (GRID)
  // ---------------------------------------------------------
  Widget _buildSeatPlan() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: black00,
        borderRadius: BorderRadius.circular(borderRadius750),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset("assets/images/ic_door.svg"),
                SvgPicture.asset("assets/images/ic_wheel.svg"),
              ],
            ),
          ),
          const SizedBox(height: 24),

          _buildSeatGrid(),

          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.only(left: 0, right: 140),
            child: Row(
              children: [
                SvgPicture.asset("assets/images/ic_door_behind.svg"),
                const SizedBox(width: 12),
                SvgPicture.asset("assets/images/ic_toilet.svg"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSeatGrid() {
    return Column(
      children: [
        _buildSeatRow(['1', '2', '', '3', '4']),
        const SizedBox(height: 16),
        _buildSeatRow(['5', '6', '', '7', '8']),
        const SizedBox(height: 16),
        _buildSeatRow(['9', '10', '', '11', '12']),
        const SizedBox(height: 16),
        _buildSeatRow(['13', '14', '', '15', '16']),
        const SizedBox(height: 16),
        _buildSeatRow(['17', '18', '', '19', '20']),
        const SizedBox(height: 16),
        _buildSeatRow(['21', '22', '', '23', '24']),
        const SizedBox(height: 16),
        _buildSeatRow(['X', 'X', '', '27', 'X']),
      ],
    );
  }

  Widget _buildSeatRow(List<String> seats) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSeat(seats[0]),
        const SizedBox(width: 12),
        _buildSeat(seats[1]),
        const SizedBox(width: 10),
        _buildSeat(seats[2]),
        const SizedBox(width: 12),
        _buildSeat(seats[3]),
        const SizedBox(width: 12),
        _buildSeat(seats[4]),
      ],
    );
  }

  Widget _buildSeat(String seatNumber) {
    if (seatNumber.isEmpty) {
      return const SizedBox(width: 48, height: 60);
    }

    bool isUnavailable = seatNumber == 'X';
    bool isSelected = selectedSeats.contains(seatNumber);

    String assetPath;
    if (isUnavailable) {
      assetPath = "assets/images/ic_seat_unavailable.svg";
    } else if (isSelected) {
      assetPath = "assets/images/ic_seat_selected.svg";
    } else {
      assetPath = "assets/images/ic_seat_regular.svg";
    }

    return GestureDetector(
      onTap: isUnavailable
          ? null
          : () {
        setState(() {
          if (isSelected) {
            selectedSeats.remove(seatNumber);
          } else {
            selectedSeats.add(seatNumber);
          }
        });
      },
      child: SizedBox(
        width: 48,
        child: Column(
          children: [
            SvgPicture.asset(assetPath, width: 44, height: 44),
            const SizedBox(height: 4),
            if (!isUnavailable) Text(seatNumber, style: xxsRegular),
          ],
        ),
      ),
    );
  }

  // ---------------------------------------------------------
  // NORMAL BOTTOM BUTTON
  // ---------------------------------------------------------
  Widget _buildNormalBottomButton() {
    return Container(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: MediaQuery.of(context).padding.bottom + 16,
        top: 12,
      ),
      color: black00,
      child: CustomButton(
        onPressed: null,
        child: Text("Pesan", style: mdMedium.copyWith(color: black00)),
      ),
    );
  }

  // ---------------------------------------------------------
  // PRICE PANEL WITH DETAIL
  // ---------------------------------------------------------
  Widget _buildPriceBottomPanel() {
    return Container(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: MediaQuery.of(context).padding.bottom + 16,
        top: 12,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () => setState(() => isExpanded = !isExpanded),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Detail Harga",
                    style: smRegular.copyWith(color: textDarkTertiary)),
                Row(
                  children: [
                    Text("Rp$totalPrice",
                        style: smSemiBold.copyWith(color: jacarta800)),
                    const SizedBox(width: 6),
                    Icon(
                      isExpanded
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: jacarta800,
                    ),
                  ],
                ),
              ],
            ),
          ),

          if (isExpanded) ...[
            const SizedBox(height: 10),

            // jumlah kursi x harga
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${selectedSeats.length}x Default",
                    style: xsRegular.copyWith(color: textDarkTertiary)),
                Text("Rp${seatPriceRegular * selectedSeats.length}",
                    style: smSemiBold.copyWith(color: jacarta800)),
              ],
            ),

            const SizedBox(height: 12),

            // Total harga
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total Harga",
                    style: xsRegular.copyWith(color: textDarkTertiary)),
                Text("Rp$totalPrice",
                    style: smSemiBold.copyWith(color: jacarta800)),
              ],
            ),

            const SizedBox(height: 20),
          ],

          const SizedBox(height: 20),

          // PESAN BUTTON → OPEN BOOKING FORM
          CustomButton(
            onPressed: _showBookingForm,
            child: Text("Pesan", style: mdMedium.copyWith(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------
  // BOOKING FORM BOTTOM SHEET
  // ---------------------------------------------------------
  void _showBookingForm() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: _buildBookingForm(),
        );
      },
    );
  }

  Widget _buildBookingForm() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: bgSurfaceNeutralDark,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
           SizedBox(height: 16),

          Text("Data Pemesanan", style: mdMedium),
           SizedBox(height: 12),

          CustomTextFormField(
            titleSection: 'Nama Lengkap',
            maxLines: 1,
            controller: nameController,
          ),
           SizedBox(height: 16),

          CustomTextFormField(
            titleSection: 'Nomor Telepon',
            keyboardType: TextInputType.phone,
            maxLines: 1,
            controller: phoneController,
          ),
           SizedBox(height: 16),

          CustomTextFormField(
            titleSection: 'Email',
            maxLines: 1,
            controller: emailController,
          ),
           SizedBox(height: 24),

          CustomButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DetailPesanPage()),
              );
            },
            child: Text("Pesan", style: mdMedium.copyWith(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
