import '../data/api/api_service.dart';
import '../model/response/api_response.dart';
import '../model/response/article_detail_response.dart';
import '../utility/resource/data_state.dart';
import 'base/base_repository.dart';
import 'package:dio/dio.dart';

class ArticleRepository extends BaseRepository {
  final ApiService _apiService;

  ArticleRepository(this._apiService);

  Future<DataState<ArticleDetailResponse>> detailArticle({
    required String id,
  }) async {
    try {
      final response = await _apiService.detailArticle(id: id);
      return DataStateSuccess(
        response.data,
      ); // response.data is ArticleDetailResponse
    } on DioException catch (e) {
      return DataStateError<ArticleDetailResponse>(e);
    }
  }
}
