import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shantika_cubit/features/agen/info_agen_dart.dart';
import 'package:shantika_cubit/ui/color.dart';
import 'package:shantika_cubit/ui/dimension.dart';
import 'package:shantika_cubit/ui/typography.dart';

import '../../model/info_city_model.dart';
import '../../ui/shared_widget/custom_arrow.dart';
import '../../ui/shared_widget/custom_card.dart';
import '../../ui/shared_widget/custom_textfield.dart';
import 'cubit/info_city_cubit.dart';

class InfoAgenCityPage extends StatelessWidget {
  const InfoAgenCityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => InfoCityCubit()
        ..init()
        ..getCities(),
      child: Scaffold(
        backgroundColor: black00,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            _buildSearchBar(),
            Expanded(child: _buildCityList()),
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
    child: BlocBuilder<InfoCityCubit, InfoCityState>(
      buildWhen: (previous, current) {
        return previous != current;
      },
      builder: (context, state) {
        return CustomTextField(
          prefixIcon: const Icon(Icons.search_outlined),
          hintText: "Cari Kota",
          borderRadius: 20,
          hintColor: bgForm,
          bgColor: agen,
          borderColor: agen,

          onChanged: (value) {
            print('TextField onChanged called: $value'); // Debug
            context.read<InfoCityCubit>().searchCity(value);
          },
        );
      },
    ),
  );
}

Widget _buildCityList() {
  return BlocBuilder<InfoCityCubit, InfoCityState>(
    builder: (context, state) {
      if (state is InfoCityStateLoading) {
        return const Center(child: CircularProgressIndicator());
      }

      if (state is InfoCityStateError) {
        return Center(child: Text(state.message));
      }

      if (state is InfoCityStateEmpty) {
        return const Center(child: Text("Tidak ada data"));
      }

      if (state is InfoCityStateData) {
        return ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          itemCount: state.cityList.length,
          itemBuilder: (context, i) => _cityItem(context, state.cityList[i]),
        );
      }

      return const SizedBox();
    },
  );
}

Widget _cityItem(BuildContext context, InfoCityModel model) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: CustomCard(
      shadow: [
        BoxShadow(color: black100, blurRadius: 6, offset: const Offset(0, 3)),
      ],
      borderSide: BorderSide(width: 1, color: black50),
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text((model.name ?? ""), style: mdSemiBold),
                SizedBox(height: space300),
                Text(
                  "${model.areaId} Agen",
                  style: xsRegular.copyWith(color: textDisabled),
                ),
              ],
            ),

            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => InfoAgenPage(cityId: model.id!),
                  ),
                );
              },
              child: Text(
                "Lihat Selengkapnya",
                style: xsMedium.copyWith(color: black950),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
