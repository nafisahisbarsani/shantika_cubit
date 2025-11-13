import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shantika_cubit/config/service_locator.dart';
import 'package:shantika_cubit/model/home_model.dart';
import 'package:shantika_cubit/repository/home_repository.dart';
import 'package:shantika_cubit/utility/extensions/dio_exception_extensions.dart';
import 'package:shantika_cubit/utility/resource/data_state.dart';

part 'article_state.dart';

class ArticleCubit extends Cubit<ArticleState> {
  ArticleCubit() : super(ArticleInitial());

  late HomeRepository _repository;

  init() {
    _repository = HomeRepository(serviceLocator.get());
  }

  Future<void> fetchArticles() async {
    print("🔹 Fetching articles...");
    emit(ArticleStateLoading());

    final dataState = await _repository.home();

    switch (dataState) {
      case DataStateSuccess<HomeModel>():
        final articles = dataState.data?.artikel ?? [];
        print("Articles fetched successfully: ${articles.length} items");
        emit(ArticleStateSuccess(articles: articles));

      case DataStateError<HomeModel>():
        print("Failed to fetch articles: ${dataState.exception}");
        emit(
          ArticleStateError(message: dataState.exception?.parseMessage() ?? ""),
        );
    }
  }
}
