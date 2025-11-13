part of 'article_cubit.dart';

@immutable
sealed class ArticleState {}

final class ArticleInitial extends ArticleState {}

final class ArticleStateLoading extends ArticleState {}

final class ArticleStateSuccess extends ArticleState {
  final List<ArtikelModel> articles;

  ArticleStateSuccess({required this.articles});
}

final class ArticleStateError extends ArticleState {
  final String message;

  ArticleStateError({required this.message});
}
