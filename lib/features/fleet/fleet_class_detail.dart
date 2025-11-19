import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shantika_cubit/ui/color.dart';
import 'package:shantika_cubit/ui/typography.dart';
import '../../model/fleet_class_detail_model.dart';
import '../../ui/shared_widget/custom_arrow.dart';
import '../../ui/shared_widget/custom_section_divider.dart';
import 'cubit/fleet_class_detail_cubit.dart';

class FleetClassDetail extends StatelessWidget {
  final int fleetClassId;

  const FleetClassDetail({super.key, required this.fleetClassId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FleetClassDetailCubit()
        ..init()
        ..loadFleetClassDetail(fleetClassId),
      child: Scaffold(
        backgroundColor: black00,
        body: SingleChildScrollView(
          child: Column(
            children: [
              _buildHeader(),
              _buildFleetDetail(),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildHeader() {
  return Container(
    decoration: BoxDecoration(color: black00),
    child: const CustomArrow(title: "Informasi Armada"),
  );
}

Widget _buildFleetDetail() {
  return BlocBuilder<FleetClassDetailCubit, FleetClassDetailState>(
    builder: (context, state) {
      if (state is FleetClassDetailStateLoading) {
        return const SizedBox(
          height: 400,
          child: Center(child: CircularProgressIndicator(color: primaryColor)),
        );
      }

      if (state is FleetClassDetailStateError) {
        return SizedBox(height: 400, child: Center(child: Text(state.message)));
      }

      if (state is FleetClassDetailStateEmpty) {
        return const SizedBox(
          height: 400,
          child: Center(child: Text("Tidak ada data")),
        );
      }

      if (state is FleetClassDetailStateData) {
        return _buildContent(state.fleet);
      }

      return const SizedBox();
    },
  );
}

Widget _buildContent(FleetClassDetailModel fleet) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _buildFleetTitle(fleet),
      _buildMainImage(fleet),
      _buildFacilities(fleet),
      _buildPhotoGallery(fleet),
    ],
  );
}

Widget _buildFleetTitle(FleetClassDetailModel fleet) {
  return Padding(
    padding: const EdgeInsets.only(left: 25, right: 20, top: 12),
    child: Text(fleet.name ?? "", style: xlBold),
  );
}

Widget _buildMainImage(FleetClassDetailModel fleet) {
  String? mainImageUrl;
  if (fleet.images != null && fleet.images!.isNotEmpty) {
    mainImageUrl = fleet.images!.first;
  } else if (fleet.image != null && fleet.image!.isNotEmpty) {
    mainImageUrl = fleet.image;
  }

  return Padding(
    padding: const EdgeInsets.only(left: 25, right: 20, top: 12),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: AspectRatio(
        aspectRatio: 16 / 14,
        child: mainImageUrl != null
            ? Image.network(
                mainImageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: const Color(0xFF1A1D2E),
                    child: const Icon(
                      Icons.directions_bus,
                      size: 60,
                      color: black300,
                    ),
                  );
                },
              )
            : Container(
                color: const Color(0xFF1A1D2E),
                child: const Icon(
                  Icons.directions_bus,
                  size: 60,
                  color: black300,
                ),
              ),
      ),
    ),
  );
}

Widget _buildFacilities(FleetClassDetailModel fleet) {
  final facilities = fleet.facilities ?? [];

  if (facilities.isEmpty) {
    return const SizedBox.shrink();
  }

  final topFacilities = facilities.length >= 4
      ? facilities.sublist(0, 4)
      : facilities;

  final bottomFacilities = facilities.length > 4
      ? facilities.sublist(4, facilities.length)
      : [];

  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20, top: 12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomSectionDivider(
          text: "Fasilitas",
          lineColor: textButtonOutlined,
          textStyle: mdBold,
        ),
        const SizedBox(height: 12),
        Row(
          children: topFacilities.map((facility) {
            return Expanded(
              child: _buildFacilityItem(
                imageUrl: facility.image,
                label: facility.name ?? '',
              ),
            );
          }).toList(),
        ),
        if (bottomFacilities.isNotEmpty) const SizedBox(height: 12),
        if (bottomFacilities.isNotEmpty)
          Row(
            children: bottomFacilities.map((facility) {
              return Expanded(
                child: _buildFacilityItem(
                  imageUrl: facility.image,
                  label: facility.name ?? '',
                ),
              );
            }).toList(),
          ),
      ],
    ),
  );
}

Widget _buildFacilityItem({String? imageUrl, required String label}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      SizedBox(
        width: 56,
        height: 56,
        child: imageUrl != null && imageUrl.isNotEmpty
            ? Image.network(
                imageUrl,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.check_circle_outline,
                    color: black00,
                    size: 28,
                  );
                },
              )
            : const Icon(Icons.check_circle_outline, color: black00, size: 28),
      ),
      const SizedBox(height: 8),
      Text(
        label,
        style: xsRegular.copyWith(color: textDarkSecondary),
        textAlign: TextAlign.center,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    ],
  );
}

Widget _buildPhotoGallery(FleetClassDetailModel fleet) {
  final images = fleet.images ?? [];

  if (images.isEmpty) {
    return const SizedBox.shrink();
  }

  return Padding(
    padding: EdgeInsets.only(left: 20, right: 20, top: 12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomSectionDivider(
          text: "Foto Armada",
          lineColor: textButtonOutlined,
          textStyle: mdBold,
        ),
        SizedBox(height: 12),
        SizedBox(
          height: 200,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: images.length,
            separatorBuilder: (context, index) => SizedBox(width: 12),
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: AspectRatio(
                  aspectRatio: 18 / 18,
                  child: Image.network(
                    images[index],
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: const Color(0xFF1A1D2E),
                        child: const Icon(
                          Icons.image,
                          size: 40,
                          color: Colors.grey,
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}
