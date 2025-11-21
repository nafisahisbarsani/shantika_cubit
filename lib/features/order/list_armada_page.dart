import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shantika_cubit/features/order/seat_selection_page.dart';
import 'package:shantika_cubit/ui/shared_widget/custom_bottom.dart';
import '../../ui/color.dart';
import '../../ui/dimension.dart';
import '../../ui/shared_widget/custom_arrow.dart';
import '../../ui/shared_widget/custom_card.dart';
import '../../ui/shared_widget/sheet/custom_bottom_sheet.dart';
import '../../ui/typography.dart';

class ListArmadaPage extends StatelessWidget {
  const ListArmadaPage({super.key});

  final List<Map<String, dynamic>> armadaStops = const [
    {"city": "Semarang", "stop": "Krapyak", "time": "05:30", "isMain": true},
    {"city": "Semarang", "stop": "Ungaran", "time": "05:30", "isMain": false},
    {
      "city": "Semarang",
      "stop": "Terminal Bawen",
      "time": "05:30",
      "isMain": false,
    },
    {"city": "Magelang", "stop": "Muntilan", "time": "05:30", "isMain": false},
    {
      "city": "Magelang",
      "stop": "Terminal Magelang",
      "time": "05:30",
      "isMain": false,
    },
  ];
  final List<Map<String, dynamic>> fleetList = const [
    {
      'busName': 'Bus 10',
      'type': 'Executive',
      'route': 'Cikarang - Bekasi - Klari - Cibitung - Sumaregon',
      'departure': 'Cileunyi Didin',
      'departureCity': 'Bandung',
      'arrival': 'Batangan',
      'arrivalCity': 'Pati',
      'price': 'Rp230.000',
      'seatsLeft': 4,
    },
    {
      'busName': 'Bus 10',
      'type': 'Executive',
      'route': 'Cikarang - Bekasi - Klari - Cibitung - Sumaregon',
      'departure': 'Cileunyi Didin',
      'departureCity': 'Bandung',
      'arrival': 'Batangan',
      'arrivalCity': 'Pati',
      'price': 'Rp230.000',
      'seatsLeft': 4,
    },
    {
      'busName': 'Bus 10',
      'type': 'Executive',
      'route': 'Cikarang - Bekasi - Klari - Cibitung - Sumaregon',
      'departure': 'Cileunyi Didin',
      'departureCity': 'Bandung',
      'arrival': 'Batangan',
      'arrivalCity': 'Pati',
      'price': 'Rp230.000',
      'seatsLeft': 4,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black00,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            _buildRoutes(),
            _buildFilters(),
            ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              itemCount: fleetList.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return _buildListFleet(context, fleetList[index]);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      decoration: BoxDecoration(color: black00),
      child: const CustomArrow(title: "List Armada"),
    );
  }

  Widget _buildRoutes() {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 12, bottom: 6),
      child: Row(
        children: [
          SvgPicture.asset("assets/images/ic_maps.svg"),
          SizedBox(width: 4),
          Text("Amsilati - Jepara", style: smMedium),
        ],
      ),
    );
  }

  Widget _buildFilters() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildFilterItem("17 Januari"),
            SizedBox(width: 12),
            _buildFilterItem("Pagi 08:00 WIB"),
            SizedBox(width: 12),
            _buildFilterItem("Super Exe"),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterItem(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: borderNeutralLight),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Text(text, style: smRegular),
          SizedBox(width: 6),
          Icon(Icons.keyboard_arrow_down, size: 16, color: iconDarkTertiary),
        ],
      ),
    );
  }

  Widget _buildListFleet(BuildContext context, Map<String, dynamic> data) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16),

      child: CustomCard(
        borderSide: BorderSide(width: 2, color: black50),
        borderRadius: BorderRadius.circular(borderRadius300),
        shadow: [BoxShadow(color: black100, blurRadius: 2)],
        padding: EdgeInsets.all(16),
        statusColor: bgSurfaceDanger,
        statusText: "Sisa ${data['seatsLeft']}",
        statusTextColor: textDanger,
        statusIcon: "assets/images/seat.svg",
        onTap: () async {
          final selectedStop = await context.showArmadaStopPicker(
            title: "Pilih Armada",
            stops: armadaStops,
          );

          if (selectedStop != null) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => SeatSelectionPage()),
            );
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  "assets/images/bus.svg",
                  height: 40,
                  width: 40,
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(data['busName'], style: smMedium),
                          Text(" . ", style: smMedium),
                          Text(data['type'], style: smMedium),
                        ],
                      ),
                      SizedBox(height: 6),
                      Text(
                        data['route'],
                        style: xsRegular.copyWith(color: textDarkTertiary),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on_rounded,
                        color: primaryColor,
                        size: 20,
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(data['departure'], style: xsMedium),
                            SizedBox(height: 6),
                            Text(
                              data['departureCity'],
                              style: xxsRegular.copyWith(
                                color: textDarkTertiary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 40,
                  height: 1,
                  color: borderNeutralLight,
                  margin: EdgeInsets.symmetric(horizontal: 8),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on_rounded,
                        color: textDarkTertiary,
                        size: 20,
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(data['arrival'], style: xsMedium),
                            SizedBox(height: 6),
                            Text(
                              data['arrivalCity'],
                              style: xxsRegular.copyWith(
                                color: textDarkTertiary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Mulai Dari",
                  style: smRegular.copyWith(color: textDarkTertiary),
                ),
                Text(
                  data['price'],
                  style: mdSemiBold.copyWith(color: primaryColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
