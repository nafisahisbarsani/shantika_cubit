import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../config/service_locator.dart';
import 'package:shantika_cubit/model/order_list_model.dart';
import '../../../model/response/order_list_response.dart';
import '../../../repository/order_list_repository.dart';
import '../../../utility/resource/data_state.dart';

part 'order_history_state.dart';

class OrderHistoryCubit extends Cubit<OrderHistoryState> {
  OrderHistoryCubit() : super(OrderHistoryInitial()) {
    _repository = OrderListRepository(serviceLocator.get());
  }

  late final OrderListRepository _repository;

  fetchOrderHistory({required Map<String, dynamic> body}) async {
    emit(OrderHistoryLoading());

    try {
      final DataState<OrderListResponse> dataState = await _repository
          .getOrderHistory(body: body);

      if (dataState is DataStateSuccess<OrderListResponse>) {
        final orderData = dataState.data;

        if (orderData?.success == true && orderData?.order != null) {
          emit(OrderHistorySuccess(orders: orderData!.order!));
        } else {
          emit(
            OrderHistoryError(
              message: orderData?.message ?? 'Failed to fetch order history',
            ),
          );
        }
      } else if (dataState is DataStateError<OrderListResponse>) {
        emit(
          OrderHistoryError(
            message: dataState.exception?.toString() ?? 'Unknown error',
          ),
        );
      }
    } catch (e, stackTrace) {
      emit(OrderHistoryError(message: e.toString()));
    }
  }
}
