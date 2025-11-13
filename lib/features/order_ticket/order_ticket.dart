import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shantika_cubit/model/city_model.dart';
import 'package:shantika_cubit/ui/color.dart';
import 'package:shantika_cubit/ui/typography.dart';
import 'package:shantika_cubit/utility/extensions/date_time_extensions.dart';
import '../../model/agency_model.dart';
import '../../ui/shared_widget/custom_arrow.dart';
import '../../ui/shared_widget/custom_button.dart';
import '../../ui/shared_widget/custom_date_picker.dart';
import '../../ui/shared_widget/custom_textfield.dart';
import '../../ui/shared_widget/sheet/custom_bottom_sheet.dart';
import 'cubit/order_ticket_cubit.dart';

class OrderTicket extends StatefulWidget {
  const OrderTicket({super.key});

  @override
  State<OrderTicket> createState() => _OrderTicketState();
}

class _OrderTicketState extends State<OrderTicket> {
  CityModel? selectedDepartureCity;
  CityModel? selectedDestinationCity;
  AgencyModel? selectedAgency;
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderTicketCubit(),
      child: Scaffold(
        backgroundColor: black00,
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 100),
          child: Column(children: [_buildHeader(), _buildInput()]),
        ),

        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(20),
          child: CustomButton(
            child: Text("Cari", style: mdMedium.copyWith(color: black00)),
            onPressed: () {},
            backgroundColor: bgButtonContainedDisabled,
          ),
        ),
      ),
    );
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
      child: const CustomArrow(title: "Pesan Tiket"),
    );
  }

  Widget _buildInput() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          CustomTextField(
            isObsecure: false,
            hintText: selectedDepartureCity?.name ?? "Pilih Kota ",
            hintColor: textDarkTertiary,
            title: "Kota Keberangkatan",
            titleColor: black950,
            prefixSvg: "assets/images/ic_city.svg",
            readOnly: true,
            onTap: () => _showCityBottomSheet(
              context: context,
              title: 'Pilih Kota',
              selectedCity: selectedDepartureCity,
              onSelected: (city) {
                setState(() {
                  selectedDepartureCity = city;
                  selectedAgency = null;
                });
              },
              isDeparture: true,
            ),
          ),
          const SizedBox(height: 20),
          CustomTextField(
            isObsecure: false,
            hintText: selectedAgency?.name ?? "Pilih Agen",
            hintColor: textDarkTertiary,
            title: "Agen Keberangkatan",
            titleColor: black950,
            prefixSvg: "assets/images/ic_agen.svg",
            readOnly: true,
            onTap: selectedDepartureCity != null
                ? () => _showAgencyBottomSheet(
                    context: context,
                    cityId: selectedDepartureCity!.id!,
                    selectedAgency: selectedAgency,
                    onSelected: (agency) {
                      setState(() {
                        selectedAgency = agency;
                      });
                    },
                  )
                : null,
          ),
          const SizedBox(height: 20),
          CustomTextField(
            isObsecure: false,
            hintText: selectedDestinationCity?.name ?? "Pilih Tempat Tujuan",
            hintColor: textDarkTertiary,
            title: "Kota Tujuan",
            titleColor: black950,
            prefixSvg: "assets/images/ic_maps.svg",
            readOnly: true,
            onTap: () => _showCityBottomSheet(
              context: context,
              title: 'Pilih Tempat Tujuan',
              selectedCity: selectedDestinationCity,
              onSelected: (city) {
                setState(() {
                  selectedDestinationCity = city;
                });
              },
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  isObsecure: false,
                  hintText: selectedDate != null
                      ? selectedDate!.convert()
                      : "Pilih Tanggal",
                  hintColor: textDarkTertiary,
                  title: "Tanggal Berangkat",
                  titleColor: black950,
                  prefixSvg: "assets/images/ic_date.svg",
                  readOnly: true,
                  onTap: () async {
                    final date = await CustomDatePicker.show(
                      context: context,
                      initialDate: selectedDate ?? DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 365)),
                      onChanged: (picked) {
                        setState(() {
                          selectedDate = picked;
                        });
                      },
                    );
                    if (date != null) {
                      setState(() {
                        selectedDate = date;
                      });
                    }
                  },
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: CustomTextField(
                  isObsecure: false,
                  hintText: "Pilih Waktu",
                  hintColor: textDarkTertiary,
                  title: "Waktu Berangkat",
                  titleColor: black950,
                  prefixSvg: "assets/images/ic_time.svg",
                  readOnly: true,
                  onTap: () {},
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          CustomTextField(
            isObsecure: false,
            hintText: "Pilih Kelas Armada",
            hintColor: textDarkTertiary,
            title: "Kelas Keberangkatan",
            titleColor: black950,
            prefixSvg: "assets/images/ic_bus.svg",
            readOnly: true,
            onTap: () {},
          ),
        ],
      ),
    );
  }

  void _showCityBottomSheet({
    required BuildContext context,
    required String title,
    required CityModel? selectedCity,
    required Function(CityModel) onSelected,
    bool isDeparture = false,
  }) {
    final cubit = context.read<OrderTicketCubit>();

    if (isDeparture) {
      cubit.fetchCityDepartures();
    } else {
      cubit.fetchCityDestinations();
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (bottomSheetContext) {
        return BlocBuilder<OrderTicketCubit, OrderTicketState>(
          builder: (context, state) {
            List<CityModel> cities = [];
            bool isLoading = false;
            String? errorMessage;

            if (state is OrderTicketLoading) {
              isLoading = true;
            } else if (state is OrderTicketError) {
              errorMessage = state.message;
            } else if (state is OrderTicketCityData) {
              cities = state.cities;
            }

            return SelectionBottomSheet<CityModel>(
              title: title,
              items: cities,
              selectedItem: selectedCity,
              onItemSelected: onSelected,
              getItemName: (city) => city.name ?? '',
              getItemId: (city) => city.id?.toString() ?? '',
              searchHint: 'Cari Kota',
              isLoading: isLoading,
              errorMessage: errorMessage,
              onRetry: () {
                if (isDeparture) {
                  cubit.fetchCityDepartures();
                } else {
                  cubit.fetchCityDestinations();
                }
              },
            );
          },
        );
      },
    );
  }

  void _showAgencyBottomSheet({
    required BuildContext context,
    required int cityId,
    required AgencyModel? selectedAgency,
    required Function(AgencyModel) onSelected,
  }) {
    final cubit = context.read<OrderTicketCubit>();
    cubit.fetchAgenciesByCity(cityId);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (bottomSheetContext) {
        return BlocBuilder<OrderTicketCubit, OrderTicketState>(
          builder: (context, state) {
            List<AgencyModel> agencies = [];
            bool isLoading = false;
            String? errorMessage;

            if (state is OrderTicketLoading) {
              isLoading = true;
            } else if (state is OrderTicketError) {
              errorMessage = state.message;
            } else if (state is OrderTicketAgencyData) {
              agencies = state.agencies;
            }

            return SelectionBottomSheet<AgencyModel>(
              title: "Pilih Agen Keberangkatan",
              items: agencies,
              selectedItem: selectedAgency,
              onItemSelected: onSelected,
              getItemName: (agency) => agency.name ?? '',
              getItemId: (agency) => agency.id?.toString() ?? '',
              searchHint: 'Cari Agen',
              isLoading: isLoading,
              errorMessage: errorMessage,
              onRetry: () => cubit.fetchAgenciesByCity(cityId),
            );
          },
        );
      },
    );
  }
}
