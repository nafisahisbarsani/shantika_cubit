// part of 'article_cubit.dart';
//
// @immutable
// sealed class ArticleState {}
//
// final class ArticleInitial extends ArticleState {}
//
// final class ArticleStateLoading extends ArticleState {}
//
// // ignore: must_be_immutable
// final class ArticleStateSuccess extends ArticleState {
//   final List<ArticleModel> articles;
//   final List<ArticleCategoryModel> articleCategory;
//   String? sortBy;
//   String? categoryId;
//
//   ArticleStateSuccess({
//     required this.articles,
//     this.sortBy,
//     this.categoryId,
//     required this.articleCategory,
//   });
// }
//
// final class ArticleStateError extends ArticleState {
//   final String message;
//
//   ArticleStateError({required this.message});
// }
