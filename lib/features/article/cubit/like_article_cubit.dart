// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
// import 'package:security_guards/config/service_locator.dart';
// import 'package:security_guards/model/response/api_response.dart';
// import 'package:security_guards/repository/article_repository.dart';
// import 'package:security_guards/utility/extensions/dio_exception_extensions.dart';
// import 'package:security_guards/utility/resource/data_state.dart';
//
// part 'like_article_state.dart';
//
// class LikeArticleCubit extends Cubit<LikeArticleState> {
//   LikeArticleCubit() : super(LikeArticleInitial());
//   late ArticleRepository _repository;
//
//   init() {
//     _repository = ArticleRepository(serviceLocator.get());
//   }
//
//   giveLike({required String slug, required isLiked}) async {
//     emit(LikeArticleStateLoading());
//
//     DataState<ApiResponse> dataState = await _repository.giveLike(slug: slug, isLike: !isLiked);
//
//     switch (dataState) {
//       case DataStateSuccess<ApiResponse>():
//         {
//           emit(LikeArticleStateSuccess());
//           // DetailArticleStateSuccess(
//           //   data: dataState.data?.data?.article ?? ArticleModel(),
//           //   isLiked: dataState.data?.data?.likes_article,
//           // );
//         }
//       case DataStateError<ApiResponse>():
//         {
//           emit(LikeArticleStateError(message: dataState.exception?.parseMessage() ?? ""));
//         }
//     }
//   }
// }
