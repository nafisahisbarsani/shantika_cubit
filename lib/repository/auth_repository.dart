import 'package:retrofit/dio.dart';
import '../data/api/api_service.dart';
import '../model/response/api_response.dart';
import '../model/response/auth_response.dart';
import '../utility/resource/data_state.dart';
import 'base/base_repository.dart';

class AuthRepository extends BaseRepository {
  final ApiService _apiService;

  AuthRepository(this._apiService);

  Future<DataState<AuthResponse>> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    String? appleId,
    String? firebaseUid,
    String? gender,
    String? phone,
    String? birthDate,
    String? birthPlace,
    String? uuid,
  }) async {
    DataState<AuthResponse> dataStateAuthResponse =
        await getStateOf<AuthResponse>(
          request: () => _apiService.register(
            name: name,
            email: email,
            password: password,
            confirmPassword: confirmPassword,
            appleId: appleId,
            firebaseUid: firebaseUid,
            gender: gender,
            phone: phone,
            birthDate: birthDate,
            birthPlace: birthPlace,
            uuid: uuid,
          ),
        );

    if (dataStateAuthResponse is DataStateSuccess) {
      return DataStateSuccess(dataStateAuthResponse.data!);
    } else {
      return DataStateError(dataStateAuthResponse.exception!);
    }
  }

  Future<DataState<AuthResponse>> loginByPhone({required String phone}) async {
    return await getStateOf<AuthResponse>(
      request: () async {
        final response = await _apiService.loginByPhone(phone: phone);

        final responseData = response.data as Map<String, dynamic>;

        final authResponse = AuthResponse.fromJson(responseData);

        return HttpResponse<AuthResponse>(authResponse, response.response);
      },
    );
  }
  Future<DataState<ApiResponse>> logout() async {
    DataState<ApiResponse> dataState = await getStateOf<ApiResponse>(
      request: () => _apiService.logout(),
    );

    if (dataState is DataStateSuccess) {
      return DataStateSuccess(dataState.data!);
    } else {
      return DataStateError(dataState.exception!);
    }
  }

  Future<DataState<ApiResponse>> updateFcmToken({
    required String fcmToken,
  }) async {
    DataState<ApiResponse> dataState = await getStateOf<ApiResponse>(
      request: () => _apiService.updateFcmToken(fcm_token: fcmToken),
    );

    if (dataState is DataStateSuccess) {
      return DataStateSuccess(dataState.data!);
    } else {
      return DataStateError(dataState.exception!);
    }
  }
}
