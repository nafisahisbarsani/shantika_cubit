import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:shantika_cubit/ui/color.dart';
import 'package:shantika_cubit/ui/shared_widget/custom_card.dart';
import 'package:shantika_cubit/ui/typography.dart';
import '../../model/order_list_model.dart';
import '../../ui/dimension.dart';
import '../../ui/shared_widget/custom_arrow.dart';
import 'cubit/order_history_cubit.dart';

class OrderHistoryPage extends StatelessWidget {
  const OrderHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderHistoryCubit()
        ..fetchOrderHistory(
          body: {
            "order_id[]": [117, 120],
          }, // insert your parameter
        ),
      child: Scaffold(
        backgroundColor: black00,
        body: Column(children: [_buildHeader(), _buildHistoryView()]),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      decoration: BoxDecoration(color: black00),
      child: const CustomArrow(title: "Riwayat"),
    );
  }
}

Widget _buildHistoryView() {
  return BlocBuilder<OrderHistoryCubit, OrderHistoryState>(
    builder: (context, state) {
      if (state is OrderHistoryLoading) {
        return const Center(child: CircularProgressIndicator());
      }

      if (state is OrderHistoryError) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 64, color: Colors.red),
              const SizedBox(height: 16),
              Text(
                state.message,
                style: mdRegular,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  context.read<OrderHistoryCubit>().fetchOrderHistory(body: {});
                },
                child: const Text('Retry'),
              ),
            ],
          ),
        );
      }

      if (state is OrderHistorySuccess) {
        if (state.orders.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.inbox_outlined, size: 64, color: black300),
                const SizedBox(height: 16),
                Text(
                  'Belum ada riwayat pesanan',
                  style: mdRegular.copyWith(color: textDarkSecondary),
                ),
              ],
            ),
          );
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView.builder(
            padding: const EdgeInsets.only(top: 1, bottom: 16),
            itemCount: state.orders.length,
            itemBuilder: (context, index) {
              return _buildOrderCard(state.orders[index]);
            },
          ),
        );
      }

      return const SizedBox.shrink();
    },
  );
}

Widget _buildOrderCard(OrderListModel order) {
  final formattedPrice = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp',
    decimalDigits: 0,
  ).format(order.price ?? 0);

  final formattedDate = order.createdAt != null
      ? DateFormat('dd MMMM yyyy', 'id_ID').format(order.createdAt!)
      : '-';

  Color statusColor = bgFillSuccess;
  if (order.status?.toLowerCase() == 'pending') {
    statusColor = bgFillWarning;
  } else if (order.status?.toLowerCase() == 'cancelled') {
    statusColor = errorColor;
  }

  final origin = order.checkpoints?.start?.agencyName ?? '-';
  final originCity = order.checkpoints?.start?.cityName ?? '';
  final originText = originCity.isNotEmpty ? '$origin – $originCity' : origin;

  final destination = order.checkpoints?.destination?.agencyName ?? '-';
  final destinationCity = order.checkpoints?.destination?.cityName ?? '';
  final destinationText = destinationCity.isNotEmpty
      ? '$destination – $destinationCity'
      : destination;

  return CustomCard(
    borderSide: BorderSide(width: 1, color: black50),
    borderRadius: BorderRadius.circular(borderRadius300),
    padding: const EdgeInsets.all(16),
    margin: const EdgeInsets.only(bottom: 10),
    statusText: order.status ?? '-',
    statusColor: statusColor,
    shadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.05),
        blurRadius: 4,
        offset: const Offset(0, 2),
      ),
    ],
    child: Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${order.nameFleet ?? '-'} • ${order.fleetClass ?? '-'}',
              style: smMedium,
            ),
            Text(
              '$formattedDate • ${order.departureAt ?? '-'}',
              style: xsRegular.copyWith(color: textDarkTertiary),
            ),
            const SizedBox(height: 8),

            Row(
              children: [
                Icon(Icons.location_on, color: iconDarkSecondary, size: 20),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(originText, style: xsMedium),
                      Text(
                        order.departureAt ?? '-',
                        style: xxsRegular.copyWith(color: textDarkTertiary),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            Row(
              children: [
                Icon(Icons.location_on, color: iconPrimary, size: 20),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(destinationText, style: xsMedium),
                      Text(order.departureAt ?? '-', style: xsRegular),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
          ],
        ),

        Positioned(
          right: 0,
          bottom: 0,
          child: Text(
            formattedPrice,
            style: mdSemiBold.copyWith(color: textPrimary),
          ),
        ),
      ],
    ),
  );
}
