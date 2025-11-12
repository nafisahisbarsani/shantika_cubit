// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
// import 'package:security_guards/config/service_locator.dart';
// import 'package:security_guards/model/article_detail_model.dart';
// import 'package:security_guards/model/response/api_response.dart';
// import 'package:security_guards/model/response/article_detail_response.dart';
// import 'package:security_guards/repository/article_repository.dart';
// import 'package:security_guards/utility/extensions/dio_exception_extensions.dart';
// import 'package:security_guards/utility/resource/data_state.dart';
//
// part 'article_state.dart';
//
// class ArticleCubit extends Cubit<ArticleState> {
//   ArticleCubit() : super(ArticleInitial());
//
//   late ArticleRepository _repository;
//   List<ArticleModel> articles = [];
//   List<ArticleCategoryModel> articleCategory = [];
//
//   String? _sortBy;
//   String? _categoryId;
//
//   init() {
//     _repository = ArticleRepository(serviceLocator.get());
//     articles = [];
//     _sortBy = null;
//     _categoryId = null;
//     articleCategory = [];
//   }
//
//   article() async {
//     emit(ArticleStateLoading());
//
//     DataState<ApiResponse<ArticleResponse>> dataState = await _repository.articles(
//       categoryId: _categoryId,
//       sort_by: _sortBy,
//     );
//
//     switch (dataState) {
//       case DataStateSuccess<ApiResponse<ArticleResponse>>():
//         {
//           articles = dataState.data?.data?.articles ?? [];
//           articleCategory = dataState.data?.data?.article_categories ?? [];
//
//           emit(
//             ArticleStateSuccess(
//               articles: articles,
//               sortBy: _sortBy,
//               categoryId: _categoryId,
//               articleCategory: articleCategory,
//             ),
//           );
//         }
//       case DataStateError<ApiResponse<ArticleResponse>>():
//         {
//           emit(ArticleStateError(message: dataState.exception?.parseMessage() ?? ""));
//         }
//     }
//   }
//
//   setCategory(String? categoryId) {
//     _categoryId = categoryId;
//     article();
//   }
//
//   sortBy(String? sortBy) {
//     _sortBy = sortBy;
//     article();
//   }
// }
