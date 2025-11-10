part of 'faq_cubit.dart';

sealed class FaqState extends Equatable {
  const FaqState();

  @override
  List<Object> get props => [];
}

final class FaqInitial extends FaqState {}

final class FaqStateLoading extends FaqState {}

final class FaqStateEmpty extends FaqState {}

final class FaqStateData extends FaqState {
  final List<FaqModel> faqList;

  FaqStateData({required this.faqList});
}

final class FaqStateError extends FaqState {
  final String message;

  FaqStateError({required this.message}); 
}
