import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:shantika_cubit/features/order/seat_selection_page.dart';
import '../../model/available_routes_model.dart';
import '../../ui/color.dart';
import '../../ui/dimension.dart';
import '../../ui/shared_widget/custom_arrow.dart';
import '../../ui/shared_widget/custom_card.dart';
import '../../ui/typography.dart';
import '../../utility/number_format.dart';

class ListFleetPage extends StatelessWidget {
  final List<AvailableRoutesModel> routes;
  final DateTime selectedDate;

  const ListFleetPage({
    super.key,
    required this.routes,
    required this.selectedDate,
  });

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
              itemCount: routes.take(3).length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final limitedRoutes = routes.take(5).toList();
                return _buildListFleet(context, limitedRoutes[index]);
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
    if (routes.isEmpty) return const SizedBox.shrink();
    final first = routes.first;
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 12, bottom: 6),
      child: Row(
        children: [
          SvgPicture.asset("assets/images/ic_maps.svg"),
          const SizedBox(width: 4),
          Text("${first.departure} - ${first.arrival}", style: smMedium),
        ],
      ),
    );
  }

  Widget _buildFilters() {
    if (routes.isEmpty) return const SizedBox.shrink();
    final first = routes.first;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildFilterItem(
              "${DateFormat('dd MMMM', 'id_ID').format(selectedDate)}",
            ),
            const SizedBox(width: 12),
            _buildFilterItem("${first.timeStart}"),
            const SizedBox(width: 12),
            _buildFilterItem(first.fleetClassName),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterItem(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: borderNeutralLight),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Text(text, style: smRegular),
          const SizedBox(width: 6),
          const Icon(
            Icons.keyboard_arrow_down,
            size: 16,
            color: iconDarkTertiary,
          ),
        ],
      ),
    );
  }

  Widget _buildListFleet(BuildContext context, AvailableRoutesModel route) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: CustomCard(
        borderSide: BorderSide(width: 2, color: black50),
        borderRadius: BorderRadius.circular(borderRadius300),
        shadow: [BoxShadow(color: black100, blurRadius: 2)],
        padding: const EdgeInsets.all(16),
        statusColor: bgSurfaceDanger,
        statusText: "Sisa ${route.seatsLeft}",
        statusTextColor: textDanger,
        statusIcon: "assets/images/seat.svg",
        onTap: () async {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => SeatSelectionPage()),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  "assets/images/bus.svg",
                  height: 40,
                  width: 40,
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(route.busName, style: smMedium),
                          Text(" . ", style: smMedium),
                          Text(route.fleetClassName, style: smMedium),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                        route.shortRoute,
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(route.departure, style: xsMedium),
                      const SizedBox(height: 6),
                      Text(
                        route.departureCity,
                        style: xxsRegular.copyWith(color: textDarkTertiary),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 40,
                  height: 2,
                  color: borderNeutralLight,
                  margin: EdgeInsets.symmetric(horizontal: 8),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(route.arrival, style: xsMedium),
                      SizedBox(height: 6),
                      Text(
                        route.arrivalCity,
                        style: xxsRegular.copyWith(color: textDarkTertiary),
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
                  NumberFormatter.rupiah(route.price),
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
