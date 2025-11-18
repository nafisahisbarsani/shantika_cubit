import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shantika_cubit/ui/typography.dart';
import '../../model/info_agen_model.dart';
import '../../ui/color.dart';
import '../../ui/dimension.dart';
import '../../ui/shared_widget/custom_arrow.dart';
import '../../ui/shared_widget/custom_card.dart';
import '../../ui/shared_widget/custom_textfield.dart';
import 'cubit/info_agen_cubit.dart';

class InfoAgenPage extends StatelessWidget {
  final int cityId;

  const InfoAgenPage({super.key, required this.cityId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => InfoAgenCubit()
        ..init()
        ..loadAgen(cityId),
      child: Scaffold(
        backgroundColor: black00,
        body: Column(
          children: [
            _buildHeader(),
            _buildSearchBar(),
            Expanded(child: _buildAgenList()),
          ],
        ),
      ),
    );
  }
}

Widget _buildHeader() {
  return Container(
    decoration: BoxDecoration(
      color: black00,
    ),
    child: const CustomArrow(title: "Informasi Agen"),
  );
}

Widget _buildSearchBar() {
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20, top: 12),
    child: BlocBuilder<InfoAgenCubit, InfoAgenState>(
      builder: (context, state) {
        return CustomTextField(
          prefixIcon: const Icon(Icons.search_outlined),
          hintText: "Cari Nama Agen",
          borderRadius: 20,
          hintColor: bgForm,
          bgColor: agen,
          borderColor: agen,
          focusedBorderColor: agen,
          onChanged: (value) {
            context.read<InfoAgenCubit>().searchAgen(value);
          },
        );
      },
    ),
  );
}

Widget _buildAgenList() {
  return BlocBuilder<InfoAgenCubit, InfoAgenState>(
    builder: (context, state) {
      if (state is InfoAgenStateLoading) {
        return const Center(child: CircularProgressIndicator());
      }

      if (state is InfoAgenStateError) {
        return Center(
          child: Text(
            state.message,
            style: smRegular.copyWith(color: black950),
          ),
        );
      }

      if (state is InfoAgenStateEmpty) {
        return Center(
          child: Text(
            "Agen tidak ditemukan",
            style: smRegular.copyWith(color: black950),
          ),
        );
      }

      if (state is InfoAgenStateData) {
        final items = state.list;

        return ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          itemCount: items.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final agen = items[index];

            return CustomCard(
              borderSide: BorderSide(width: 2, color: black50),
              borderRadius: BorderRadius.circular(borderRadius300),
              shadow: [
                BoxShadow(
                  color: black100,
                  blurRadius: 3,
                  offset: const Offset(0, 2),
                ),
              ],
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: black50,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(Icons.business, color: black400, size: 20),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            agen.agencyName ?? "",
                            style: mdSemiBold.copyWith(color: black950),
                          ),
                          const SizedBox(height: space300),
                          Text(
                            agen.cityName ?? "",
                            style: smRegular.copyWith(color: black400),
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () => showAgenDetailBottomSheet(context, agen),
                      child: Text(
                        "Detail",
                        style: xsSemiBold.copyWith(color: textButtonOutlined),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }
      return const SizedBox.shrink();
    },
  );
}

void showAgenDetailBottomSheet(BuildContext context, InfoAgenModel agen) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    isDismissible: true,
    enableDrag: true,
    builder: (_) {
      return DraggableScrollableSheet(
        initialChildSize: 0.4,
        minChildSize: 0.4,
        maxChildSize: 0.85,
        builder: (_, scrollController) {
          return Container(
            decoration: const BoxDecoration(color: black00),
            child: Column(
              children: [
                // Drag handle
                Center(
                  child: Container(
                    width: 50,
                    height: 4,
                    margin: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: black300,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    controller: scrollController,
                    padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 22,
                            backgroundColor: black300,
                            child: Icon(Icons.person, color: black00, size: 22),
                          ),
                          SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  agen.agencyName ?? "-",
                                  style: mdSemiBold,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  agen.cityName ?? "-",
                                  style: xsRegular.copyWith(
                                    color: iconDisabled,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 24),
                      _buildDetailItem(
                        title: "Alamat Agen",
                        value: agen.agencyAddress ?? "-",
                        icon: Icons.location_pin,
                        iconColor: jacarta800,
                      ),
                      SizedBox(height: 20),
                      _buildScheduleItem(
                        title: "Jam Berangkat",
                        morningTime: agen.morningTime,
                        nightTime: agen.nightTime,
                      ),
                      SizedBox(height: 20),
                      _buildDetailItem(
                        title: "Nomor Telepon",
                        value: agen.agencyPhone ?? "-",
                        icon: Icons.perm_phone_msg_rounded,
                        iconColor: jacarta800,
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}

Widget _buildDetailItem({
  required String title,
  required String value,
  required IconData icon,
  required Color iconColor,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: smSemiBold),
          Icon(icon, color: iconColor, size: 25),
        ],
      ),
      const SizedBox(height: 6),
      Text(value, style: smRegular.copyWith(color: iconDisabled)),
    ],
  );
}

Widget _buildScheduleItem({
  required String title,
  String? morningTime,
  String? afternoonTime,
  String? nightTime,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title, style: smSemiBold),
      const SizedBox(height: 6),
      if (morningTime != null && morningTime.isNotEmpty)
        Padding(
          padding: const EdgeInsets.only(bottom: 3),
          child: Text(
            "$morningTime",
            style: smRegular.copyWith(color: iconDisabled),
          ),
        ),
      if (nightTime != null && nightTime.isNotEmpty)
        Text("$nightTime", style: smRegular.copyWith(color: iconDisabled)),
      if ((morningTime == null || morningTime.isEmpty) &&
          (afternoonTime == null || afternoonTime.isEmpty) &&
          (nightTime == null || nightTime.isEmpty))
        Text("-", style: smRegular.copyWith(color: iconDisabled)),
    ],
  );
}