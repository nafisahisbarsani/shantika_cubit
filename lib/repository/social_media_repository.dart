import '../data/api/api_service.dart';
import '../model/response/social_media_response.dart';
import '../model/social_media_model.dart';
import '../utility/resource/data_state.dart';
import 'base/base_repository.dart';

class SocialMediaRepository extends BaseRepository {
  final ApiService _apiService;

  SocialMediaRepository(this._apiService);

  Future<DataState<List<SocialMediaModel>>> fetchSocialMedia() async {
    final DataState<SocialMediaResponse> dataState =
        await getStateOf<SocialMediaResponse>(
          request: () => _apiService.getSocialMedia(),
        );

    if (dataState is DataStateSuccess) {
      return DataStateSuccess(dataState.data?.socialMedias ?? []);
    } else {
      return DataStateError(dataState.exception!);
    }
  }
}
