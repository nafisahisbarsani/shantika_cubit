// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'terms_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TermsResponse _$TermsResponseFromJson(Map<String, dynamic> json) =>
    TermsResponse(
      terms: json['term_and_condition'] == null
          ? null
          : TermsModel.fromJson(
              json['term_and_condition'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$TermsResponseToJson(TermsResponse instance) =>
    <String, dynamic>{'term_and_condition': instance.terms};
