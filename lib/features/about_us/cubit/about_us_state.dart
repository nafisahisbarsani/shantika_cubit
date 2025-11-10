part of 'about_us_cubit.dart';

abstract class AboutUsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AboutUsInitial extends AboutUsState {}

class AboutUsLoading extends AboutUsState {}

class AboutUsLoaded extends AboutUsState {
  final AboutUsModel about;

  AboutUsLoaded({required this.about});

  @override
  List<Object?> get props => [about];
}

class AboutUsEmpty extends AboutUsState {}

class AboutUsError extends AboutUsState {
  final String message;

  AboutUsError({required this.message});

  @override
  List<Object?> get props => [message];
}
