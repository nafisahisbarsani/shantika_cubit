import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shantika_cubit/ui/dimension.dart';

import '../color.dart';
import '../typography.dart';

class ArmadaStopBottomSheet extends StatefulWidget {
  final String title;
  final List<Map<String, dynamic>> stops;
  final Function(Map<String, dynamic>) onStopSelected;

  const ArmadaStopBottomSheet({
    super.key,
    required this.title,
    required this.stops,
    required this.onStopSelected,
  });

  @override
  State<ArmadaStopBottomSheet> createState() => _ArmadaStopBottomSheetState();
}

class _ArmadaStopBottomSheetState extends State<ArmadaStopBottomSheet> {
  late List<Map<String, dynamic>> filteredStops;
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredStops = widget.stops;
    searchController.addListener(_filterStops);
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void _filterStops() {
    final query = searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        filteredStops = widget.stops;
      } else {
        filteredStops = widget.stops.where((stop) {
          final city = stop['city'].toString().toLowerCase();
          final stopName = stop['stop'].toString().toLowerCase();
          return city.contains(query) || stopName.contains(query);
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.only(top: 12),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: bgSurfaceNeutralLight,
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              widget.title,
              style: mdMedium,
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Cari Armada',
                hintStyle: smRegular.copyWith(color: textDarkTertiary),
                prefixIcon: Icon(Icons.search, color: iconDarkTertiary),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
              ),
            ),
          ),

          SizedBox(height: 16),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Super Executive",
                style: smRegular
              ),
            ),
          ),
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              itemCount: filteredStops.length,
              itemBuilder: (context, index) {
                final stop = filteredStops[index];
                return _buildStopItem(stop);
              },
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildStopItem(Map<String, dynamic> stop) {
    final isMain = stop['isMain'] ?? false;

    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: () => widget.onStopSelected(stop),
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: BoxDecoration(
            color: bgSurfacePrimary,
            borderRadius: BorderRadius.circular(borderRadius200),
          ),
          child: Row(
            children: [
              Icon(
                Icons.location_pin,
                size: 24,
                color: isMain ? primaryColor :iconDarkTertiary,
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${stop['city']}",
                      style: smRegular,
                    ),
                    SizedBox(height: 2),
                    Text(
                      stop['stop'],
                      style: smSemiBold,
                    ),
                  ],
                ),
              ),
              Text(
                stop['time'],
                style: smRegular,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

extension ArmadaStopBottomSheetExtension on BuildContext {
  Future<Map<String, dynamic>?> showArmadaStopPicker({
    required String title,
    required List<Map<String, dynamic>> stops,
  }) {
    return showModalBottomSheet<Map<String, dynamic>>(
      context: this,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => ArmadaStopBottomSheet(
        title: title,
        stops: stops,
        onStopSelected: (stop) => Navigator.pop(context, stop),
      ),
    );
  }
}