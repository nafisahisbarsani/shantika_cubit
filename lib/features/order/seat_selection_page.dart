import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shantika_cubit/features/order/detail_pesan_page.dart';
import 'package:shantika_cubit/ui/color.dart';
import 'package:shantika_cubit/ui/dimension.dart';
import 'package:shantika_cubit/ui/shared_widget/custom_button.dart';
import 'package:shantika_cubit/ui/shared_widget/input_bottom_sheet.dart';
import 'package:shantika_cubit/ui/typography.dart';
import '../../ui/shared_widget/custom_text_form_field.dart';
import '../../ui/shared_widget/custom_textfield.dart';
import '../../utility/number_format.dart';

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
                    width: 80,
                    height: 35,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: isLowerSelected ? jacarta800 : Colors.transparent,
                      borderRadius: BorderRadius.circular(borderRadius150),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/images/ic_arrow_down.svg",
                          colorFilter: ColorFilter.mode(
                            isLowerSelected ? black00 : black950,
                            BlendMode.srcIn,
                          ),
                        ),
                        SizedBox(width: 4),
                        Text(
                          "Bawah",
                          style: xsMedium.copyWith(
                            color: isLowerSelected ? black00 : black950,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => setState(() => isLowerSelected = false),
                  child: Container(
                    width: 75,
                    height: 35,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: !isLowerSelected ? jacarta800 : Colors.transparent,
                      borderRadius: BorderRadius.circular(borderRadius150),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/images/ic_arrow_up.svg",
                          colorFilter: ColorFilter.mode(
                            !isLowerSelected ? black00 : black950,
                            BlendMode.srcIn,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          "Atas",
                          style: xsMedium.copyWith(
                            color: !isLowerSelected ? black00 : black950,
                          ),
                        ),
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
              _seatTypeItem(
                "assets/images/ic_seat_unavailable.svg",
                "Tidak",
                "Tersedia",
              ),
              _seatTypeItem(
                "assets/images/ic_seat_selected.svg",
                "Sudah",
                "Dipilih",
              ),
              _seatTypeItem(
                "assets/images/ic_seat_regular.svg",
                "Reguler",
                "Rp125.000",
              ),
              _seatTypeItem(
                "assets/images/ic_seat_vip.svg",
                "First Class",
                "Rp205.000",
              ),
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

  // Replace your _buildSeatPlan method with this:
  Widget _buildSeatPlan() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: black00,
        borderRadius: BorderRadius.circular(borderRadius750),
      ),
      child: isLowerSelected ? _buildLowerDeckSeats() : _buildUpperDeckSeats(),
    );
  }

  // Lower deck layout (existing)
  Widget _buildLowerDeckSeats() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset("assets/images/ic_door.svg"),
              SvgPicture.asset("assets/images/ic_wheel.svg"),
            ],
          ),
        ),
        SizedBox(height: 24),
        _buildLowerSeatGrid(),
        SizedBox(height: 12),
        Padding(
          padding: EdgeInsets.only(left: 0, right: 140),
          child: Row(
            children: [
              SvgPicture.asset("assets/images/ic_door_behind.svg"),
              SizedBox(width: 12),
              SvgPicture.asset("assets/images/ic_toilet.svg"),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildUpperDeckSeats() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset("assets/images/ic_door.svg"),
              SvgPicture.asset("assets/images/ic_wheel.svg"),
            ],
          ),
        ),
        SizedBox(height: 24),
        _buildUpperSeatGrid(),
        SizedBox(height: 12),
        Padding(
          padding: EdgeInsets.only(left: 0, right: 140),
          child: Row(
            children: [
              SvgPicture.asset("assets/images/ic_door_behind.svg"),
              SizedBox(width: 12),
              SvgPicture.asset("assets/images/ic_toilet.svg"),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLowerSeatGrid() {
    return Column(
      children: [
        _buildSeatRow(['1', '2', '', '3', '4']),
        SizedBox(height: 16),
        _buildSeatRow(['5', '6', '', '7', '8']),
        SizedBox(height: 16),
        _buildSeatRow(['9', '10', '', '11', '12']),
        SizedBox(height: 16),
        _buildSeatRow(['13', '14', '', '15', '16']),
        SizedBox(height: 16),
        _buildSeatRow(['17', '18', '', '19', '20']),
        SizedBox(height: 16),
        _buildSeatRow(['21', '22', '', '23', '24']),
        SizedBox(height: 16),
        _buildSeatRow(['X25', 'X26', '', '27', 'X28']),
      ],
    );
  }

  Widget _buildUpperSeatGrid() {
    return Column(
      children: [
        _buildUpperSeatRow('29', '30'),
        SizedBox(height: 16),
        _buildUpperSeatRow('31', '32'),
        SizedBox(height: 16),
        _buildUpperSeatRow('33', '34'),
        SizedBox(height: 16),
        _buildUpperSeatRow('35', '36'),
        SizedBox(height: 16),
        _buildUpperSeatRow('37', '38'),
        SizedBox(height: 16),
        _buildUpperSeatRow('39', '40'),
        SizedBox(height: 16),
        _buildUpperSeatRow('X41', 'X42'),
      ],
    );
  }

  Widget _buildUpperSeatRow(String leftSeat, String rightSeat) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSeat(leftSeat),
        SizedBox(width: 120),
        _buildSeat(rightSeat),
      ],
    );
  }

  Widget _buildSeatRow(List<String> seats) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSeat(seats[0]),
        SizedBox(width: 12),
        _buildSeat(seats[1]),
        SizedBox(width: 10),
        _buildSeat(seats[2]),
        SizedBox(width: 12),
        _buildSeat(seats[3]),
        SizedBox(width: 12),
        _buildSeat(seats[4]),
      ],
    );
  }

  Widget _buildSeat(String seatNumber) {
    if (seatNumber.isEmpty) {
      return SizedBox(width: 48, height: 60);
    }

    bool isUnavailable = seatNumber.startsWith('X');
    String displayNumber = isUnavailable ? seatNumber.substring(1) : seatNumber;
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
            SizedBox(height: 4),
            Text(
              displayNumber,
              style: xxsRegular.copyWith(
                color: isUnavailable ? textDarkTertiary : null,
              ),
            ),
          ],
        ),
      ),
    );
  }

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

  Widget _buildPriceBottomPanel() {
    return Container(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: MediaQuery.of(context).padding.bottom + 16,
        top: 12,
      ),
      decoration: BoxDecoration(
        color: black00,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () => setState(() => isExpanded = !isExpanded),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Detail Harga",
                  style: smRegular.copyWith(color: textDarkTertiary),
                ),

                Row(
                  children: [
                    Text(
                      NumberFormatter.rupiah(totalPrice),
                      style: smSemiBold.copyWith(color: jacarta800),
                    ),
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

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${selectedSeats.length}x Default",
                  style: xsRegular.copyWith(color: textDarkTertiary),
                ),
                Text(
                  NumberFormatter.rupiah(
                    seatPriceRegular * selectedSeats.length,
                  ),
                  style: smSemiBold.copyWith(color: jacarta800),
                ),
              ],
            ),

            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Harga",
                  style: xsRegular.copyWith(color: textDarkTertiary),
                ),
                Text(
                  NumberFormatter.rupiah(totalPrice),
                  style: smSemiBold.copyWith(color: jacarta800),
                ),
              ],
            ),

            const SizedBox(height: 20),
          ],

          const SizedBox(height: 20),

          CustomButton(
            onPressed: _showBookingForm,
            child: Text("Pesan", style: mdMedium.copyWith(color: black00)),
          ),
        ],
      ),
    );
  }

  void _showBookingForm() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: black00,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: InputBottomSheet(
            nameController: nameController,
            phoneController: phoneController,
            emailController: emailController,
            onSubmit: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => DetailPesanPage()),
              );
            },
          ),
        );
      },
    );
  }
}
