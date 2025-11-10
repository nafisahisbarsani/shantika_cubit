import '../data/api/api_service.dart';
import '../model/about_us_model.dart';
import '../model/faq_model.dart';
import '../model/policy_model.dart';
import '../model/response/about_us_response.dart';
import '../model/response/faq_response.dart';
import '../model/response/privacy_policy_response.dart';
import '../model/response/terms_response.dart';
import '../model/terms_model.dart';
import '../utility/resource/data_state.dart';
import 'base/base_repository.dart';

class AppSettingsRepository extends BaseRepository {
  final ApiService _apiService;

  AppSettingsRepository(this._apiService);

  Future<DataState<List<FaqModel>>> faq() async {
    DataState<FaqResponse> dataState = await getStateOf<FaqResponse>(
      request: () => _apiService.faq(),
    );

    if (dataState is DataStateSuccess) {
      return DataStateSuccess(dataState.data?.faqs ?? []);
    } else {
      return DataStateError(dataState.exception!);
    }
  }

  Future<DataState<AboutUsModel>> aboutUs() async {
    DataState<AboutUsResponse> dataState = await getStateOf<AboutUsResponse>(
      request: () => _apiService.about(),
    );

    if (dataState is DataStateSuccess) {
      return DataStateSuccess(dataState.data?.about ?? AboutUsModel());
    } else {
      return DataStateError(dataState.exception!);
    }
  }

  Future<DataState<PrivacyPolicyModel>> privacyPolicy() async {
    DataState<PrivacyPolicyResponse> dataState =
        await getStateOf<PrivacyPolicyResponse>(
          request: () => _apiService.privacyPolicy(),
        );

    if (dataState is DataStateSuccess) {
      return DataStateSuccess(
        dataState.data?.privacyPolicy ?? PrivacyPolicyModel(),
      );
    } else {
      return DataStateError(dataState.exception!);
    }
  }

  Future<DataState<TermsModel>> terms() async {
    DataState<TermsResponse> dataState = await getStateOf<TermsResponse>(
      request: () => _apiService.terms(),
    );

    if (dataState is DataStateSuccess) {
      return DataStateSuccess(dataState.data?.terms ?? TermsModel());
    } else {
      return DataStateError(dataState.exception!);
    }
  }


  //
  // Future<DataState<ApiResponse>> contactUs({
  //   required String name,
  //   required String email,
  //   required String company,
  //   required String message,
  // }) async {
  //   DataState<ApiResponse> dataState = await getStateOf<ApiResponse>(
  //       request: () => _apiService.contactUs(name: name, email: email, company: company, message: message));
  //
  //   if (dataState is DataStateSuccess) {
  //     return DataStateSuccess(dataState.data!);
  //   } else {
  //     return DataStateError(dataState.exception!);
  //   }
  // }
  //
  // Future<DataState<ApiResponse<ApplicationModel>>> informationApplication() async {
  //   DataState<ApiResponse<ApplicationModel>> dataState = await getStateOf<ApiResponse<ApplicationModel>>(
  //     request: () => _apiService.informationApplication(),
  //   );
  //
  //   if (dataState is DataStateSuccess) {
  //     return DataStateSuccess(dataState.data!);
  //   } else {
  //     return DataStateError(dataState.exception!);
  //   }
  // }
}
