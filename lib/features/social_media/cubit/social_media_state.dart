part of 'social_media_cubit.dart';

sealed class SocialMediaState extends Equatable {
  const SocialMediaState();

  @override
  List<Object> get props => [];
}

final class SocialMediaInitial extends SocialMediaState {}

final class SocialMediaLoading extends SocialMediaState {}

final class SocialMediaEmpty extends SocialMediaState {}

final class SocialMediaError extends SocialMediaState {
  final String message;
  const SocialMediaError({required this.message});
}

// ignore: must_be_immutable
final class SocialMediaStateData extends SocialMediaState {
  List<SocialMediaModel> items;
  SocialMediaStateData({required this.items});
}
