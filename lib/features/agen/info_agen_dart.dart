import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shantika_cubit/ui/typography.dart';
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
      create: (_) => InfoAgenCubit()..init()..loadAgen(cityId),
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
      boxShadow: [
        BoxShadow(
          color: black200.withOpacity(0.3),
          blurRadius: 8,
          offset: const Offset(0, 3),
        ),
      ],
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
          borderColor: black00,
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
          child: Text(state.message, style: smRegular.copyWith(color: black950)),
        );
      }

      if (state is InfoAgenStateEmpty) {
        return Center(
          child: Text("Agen tidak ditemukan",
              style: smRegular.copyWith(color: black950)),
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
              borderSide: BorderSide(width: 2, color: black100),
              borderRadius: BorderRadius.circular(borderRadius300),
              shadow: [
                BoxShadow(color: black300, blurRadius: 3, offset: const Offset(0, 2)),
              ],
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Left side content
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            agen.agencyName ?? "",
                            style: mdSemiBold.copyWith(color: black950),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            agen.cityName ?? "",
                            style: smRegular.copyWith(color: black400),
                          ),
                        ],
                      ),
                    ),

                    // Detail button on the right
                    GestureDetector(
                      onTap: () {
                        // Navigate to detail page (implement later)
                      },
                      child: Text(
                        "Detail",
                        style: smSemiBold.copyWith(color: blue500),
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
