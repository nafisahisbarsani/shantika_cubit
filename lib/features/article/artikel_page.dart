import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shantika_cubit/features/article/artikel_detail_page.dart';
import 'package:shantika_cubit/features/article/cubit/article_cubit.dart';
import 'package:shantika_cubit/ui/color.dart';
import 'package:shantika_cubit/ui/dimension.dart';
import 'package:shantika_cubit/ui/shared_widget/custom_arrow.dart';
import 'package:shantika_cubit/ui/shared_widget/custom_card.dart';
import 'package:shantika_cubit/ui/shared_widget/custom_text_form_field.dart';
import 'package:shantika_cubit/ui/shared_widget/custom_textfield.dart';
import 'package:shantika_cubit/ui/typography.dart';
import '../../model/home_model.dart';

class ArtikelPage extends StatelessWidget {
  const ArtikelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ArticleCubit()
        ..init()
        ..fetchArticles(),
      child: Scaffold(
        backgroundColor: black00,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomArrow(title: "Artikel"),
              _buildSearchBar(),
              BlocBuilder<ArticleCubit, ArticleState>(
                builder: (context, state) {
                  if (state is ArticleStateLoading) {
                    return const Padding(
                      padding: EdgeInsets.all(40),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else if (state is ArticleStateSuccess) {
                    final articles = state.articles;
                    if (articles.isEmpty) {
                      return const Padding(
                        padding: EdgeInsets.all(40),
                        child: Text("Tidak ada artikel ditemukan."),
                      );
                    }
                    return _buildListArtikel(context, articles);
                  } else if (state is ArticleStateError) {
                    return Padding(
                      padding: const EdgeInsets.all(40),
                      child: Text(
                        state.message.isNotEmpty
                            ? state.message
                            : "Gagal memuat artikel",
                        style: smRegular.copyWith(color: errorColor),
                      ),
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildSearchBar() {
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20, top: 12),
    child: CustomTextField(
      suffixIcon: Icon(Icons.search_outlined),
      hintText: "Cari Artikel",
      borderRadius: 20,
      hintColor: bgForm,
      borderColor: borderNeutral,
    ),
  );
}

Widget _buildListArtikel(BuildContext context, List<ArtikelModel> articles) {
  return ListView.builder(
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount: articles.length,
    itemBuilder: (context, index) {
      final article = articles[index];
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: CustomCard(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ArtikelDetailPage(id: article.id.toString()),
              ),
            );
          },
          borderRadius: BorderRadius.circular(borderRadius300),
          borderSide: BorderSide(width: 1, color: borderarticle),
          padding: EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                child: Image.network(
                  article.image ?? "",
                  width: double.infinity,
                  height: 160,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: double.infinity,
                    height: 160,
                    color: Colors.grey[300],
                    child: const Icon(Icons.article),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  article.name ?? "Artikel",
                  style: smRegular,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
