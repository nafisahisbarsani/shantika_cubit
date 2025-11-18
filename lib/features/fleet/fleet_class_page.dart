import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../ui/color.dart';
import '../../ui/dimension.dart';
import '../../ui/typography.dart';
import '../../ui/shared_widget/custom_arrow.dart';
import '../../ui/shared_widget/custom_card.dart';
import '../../ui/shared_widget/custom_textfield.dart';
import 'cubit/fleet_class_cubit.dart';

class FleetClassPage extends StatelessWidget {
  const FleetClassPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FleetClassCubit()
        ..init()
        ..loadFleetClasses(),
      child: Scaffold(
        backgroundColor: black00,
        body: Column(
          children: [
            _buildHeader(),
            _buildSearchBar(),
            Expanded(child: _buildFleetList()),
          ],
        ),
      ),
    );
  }
}

Widget _buildHeader() {
  return Container(
    decoration: BoxDecoration(color: black00),
    child: const CustomArrow(title: "Kelas Armada"),
  );
}

Widget _buildSearchBar() {
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20, top: 12),
    child: BlocBuilder<FleetClassCubit, FleetClassState>(
      builder: (context, state) {
        return CustomTextField(
          prefixIcon: const Icon(Icons.search_outlined),
          hintText: "Cari Kelas Armada",
          borderRadius: 20,
          hintColor: bgForm,
          bgColor: agen,
          borderColor: agen,
          focusedBorderColor: agen,
          onChanged: (value) {
            context.read<FleetClassCubit>().searchFleet(value);
          },
        );
      },
    ),
  );
}

Widget _buildFleetList() {
  return BlocBuilder<FleetClassCubit, FleetClassState>(
    builder: (context, state) {
      if (state is FleetClassLoading) {
        return const Center(child: CircularProgressIndicator());
      }

      if (state is FleetClassError) {
        return Center(
          child: Text(
            state.message,
            style: smRegular.copyWith(color: black950),
          ),
        );
      }

      if (state is FleetClassEmpty) {
        return Center(
          child: Text(
            "Kelas Armada tidak ditemukan",
            style: smRegular.copyWith(color: black950),
          ),
        );
      }

      if (state is FleetClassData) {
        final items = state.list;

        return ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          itemCount: items.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final fleet = items[index];

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
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            fleet.name ?? "",
                            style: mdSemiBold.copyWith(color: black950),
                          ),
                          const SizedBox(height: space300),
                          Text(
                            "Kapasitas: ${fleet.seatCapacity ?? '-'} kursi",
                            style: smRegular.copyWith(color: black400),
                          ),
                        ],
                      ),
                    ),

                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Lihat Selengkapnya",
                        style: xsMedium.copyWith(color: black950),
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
