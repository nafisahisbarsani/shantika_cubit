part of 'info_agen_cubit.dart';

@immutable
sealed class InfoAgenState {}

class InfoAgenInitial extends InfoAgenState {}

class InfoAgenStateLoading extends InfoAgenState {}

class InfoAgenStateData extends InfoAgenState {
  final List<InfoAgenModel> list;
  final bool isLoadingMore;
  InfoAgenStateData(this.list, {this.isLoadingMore = false});
}

class InfoAgenStateEmpty extends InfoAgenState {}

class InfoAgenStateError extends InfoAgenState {
  final String message;
  InfoAgenStateError(this.message);
}

