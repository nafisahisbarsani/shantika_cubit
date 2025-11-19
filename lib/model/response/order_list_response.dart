import 'package:json_annotation/json_annotation.dart';
import 'package:shantika_cubit/model/order_list_model.dart';

part 'order_list_response.g.dart';

@JsonSerializable()
class OrderListResponse {
  @JsonKey(name: "code")
  int? code;
  @JsonKey(name: "success")
  bool? success;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "order")
  List<OrderListModel>? order;

  OrderListResponse({this.code, this.success, this.message, this.order});

  factory OrderListResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OrderListResponseToJson(this);
}
