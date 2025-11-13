import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shantika_cubit/model/article_model.dart';
import 'package:shantika_cubit/utility/extensions/dio_exception_extensions.dart';
import '../../../config/service_locator.dart';
import '../../../model/response/api_response.dart';
import '../../../model/response/article_detail_response.dart';
import '../../../repository/article_repository.dart';
import '../../../utility/resource/data_state.dart';

part 'detail_article_state.dart';

class DetailArticleCubit extends Cubit<DetailArticleState> {
  DetailArticleCubit() : super(DetailArticleInitial());

  late ArticleRepository _repository;

  init() {
    _repository = ArticleRepository(serviceLocator.get());
  }

  detailArticle({required String id}) async {
    print("🔹 Fetching article detail for ID: $id");
    emit(DetailArticleStateLoading());

    final dataState = await _repository.detailArticle(id: id);

    switch (dataState) {
      case DataStateSuccess<ArticleDetailResponse>():
        print("Article fetched successfully: ${dataState.data?.article}");
        emit(
          DetailArticleStateSuccess(
            data: dataState.data?.article ?? ArticleModel(),
          ),
        );
      case DataStateError<ArticleDetailResponse>():
        print("Failed to fetch article: ${dataState.exception}");
        emit(
          DetailArticleStateError(
            message: dataState.exception?.parseMessage() ?? "",
          ),
        );
    }
  }
}
