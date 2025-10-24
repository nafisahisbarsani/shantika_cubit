import 'package:dio/dio.dart';
import 'package:shantika_cubit/utility/extensions/date_time_extensions.dart';
import '../data/api/api_service.dart';
import '../model/response/api_response.dart';
import '../model/response/auth_response.dart';
import '../model/user_model.dart';
import '../utility/resource/data_state.dart';
import 'base/base_repository.dart';

class ProfileRepository extends BaseRepository {
  final ApiService _apiService;

  ProfileRepository(this._apiService);

  Future<DataState<ApiResponse<UserModel>>> profile() async {
    DataState<ApiResponse<UserModel>> dataStateAuthResponse = await getStateOf<ApiResponse<UserModel>>(
      request: () => _apiService.profile(),
    );

    if (dataStateAuthResponse is DataStateSuccess) {
      return DataStateSuccess(dataStateAuthResponse.data!);
    } else {
      return DataStateError(dataStateAuthResponse.exception!);
    }
  }

  Future<DataState<AuthResponse>> updateProfile({
    required String name,
    required String gender,
    required String email,
    List<MultipartFile>? avatar,
    String? birth,
    String? birthPlace,
    String? phone,
    String? address,
  }) async {
    String? numberWithoutPrefix = phone?.replaceFirst(RegExp(r'^\+62'), '');

    DataState<AuthResponse> dataStateAuthResponse =
    await getStateOf<AuthResponse>(
      request: () => _apiService.updateProfile(
        name: name,
        gender: gender,
        email: email,
        avatar: avatar,
        birth: birth,
        birth_place: birthPlace,
        phone: numberWithoutPrefix != null ? '+62$numberWithoutPrefix' : null,
        address: address,
      ),
    );

    if (dataStateAuthResponse is DataStateSuccess) {
      print('=== REPOSITORY SUCCESS ===');
      print('User: ${dataStateAuthResponse.data?.user?.name}');
      print('=========================');
      return DataStateSuccess(dataStateAuthResponse.data!);
    } else {
      return DataStateError(dataStateAuthResponse.exception!);
    }
  }
}
