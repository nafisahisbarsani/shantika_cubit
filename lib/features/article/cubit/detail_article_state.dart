part of 'detail_article_cubit.dart';

@immutable
sealed class DetailArticleState {}

final class DetailArticleInitial extends DetailArticleState {}

final class DetailArticleStateLoading extends DetailArticleState {}

final class DetailArticleStateSuccess extends DetailArticleState {
  final ArticleDetailModel data;
  final bool? isLiked;

  DetailArticleStateSuccess({required this.data, this.isLiked});
}

final class DetailArticleStateError extends DetailArticleState {
  final String message;

  DetailArticleStateError({required this.message});
}
