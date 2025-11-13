part of 'privacy_policy_cubit.dart';

sealed class PrivacyPolicyState extends Equatable {
  const PrivacyPolicyState();

  @override
  List<Object> get props => [];
}

final class PrivacyPolicyInitial extends PrivacyPolicyState {}

final class PrivacyPolicyLoading extends PrivacyPolicyState {}

final class PrivacyPolicyEmpty extends PrivacyPolicyState {}

final class PrivacyPolicyError extends PrivacyPolicyState {
  final String message;
  PrivacyPolicyError({required this.message});
}

// ignore: must_be_immutable
final class PrivacyPolicyStateData extends PrivacyPolicyState {
  PrivacyPolicyModel privacyPolicyModel;
  PrivacyPolicyStateData({required this.privacyPolicyModel});
}