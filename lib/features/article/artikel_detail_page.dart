import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:shantika_cubit/ui/color.dart';
import 'package:shantika_cubit/ui/dimension.dart';
import 'package:shantika_cubit/ui/shared_widget/custom_arrow.dart';
import 'package:shantika_cubit/ui/typography.dart';
import 'cubit/detail_article_cubit.dart';

class ArtikelDetailPage extends StatefulWidget {
  final String id;

  const ArtikelDetailPage({super.key, required this.id});

  @override
  State<ArtikelDetailPage> createState() => _ArtikelDetailPageState();
}

class _ArtikelDetailPageState extends State<ArtikelDetailPage> {
  late DetailArticleCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = DetailArticleCubit()..init();
    _cubit.detailArticle(id: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: Scaffold(
        backgroundColor: black00,
        body: BlocBuilder<DetailArticleCubit, DetailArticleState>(
          builder: (context, state) {
            if (state is DetailArticleStateLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is DetailArticleStateError) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    state.message.isNotEmpty
                        ? state.message
                        : "Gagal memuat artikel.",
                    style: smRegular,
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            }

            if (state is DetailArticleStateSuccess) {
              final article = state.data;
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomArrow(
                      title: "Detail Artikel",
                      suffixIcon: const Icon(Icons.share_outlined, size: 20),
                    ),
                    _buildHeaderImage(article.image),
                    _buildArticleContent(
                      article.name ?? "-",
                      article.description ?? "",
                    ),
                  ],
                ),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Widget _buildHeaderImage(String? imageUrl) {
    return Padding(
      padding: const EdgeInsets.all(spacing6),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: imageUrl != null && imageUrl.isNotEmpty
            ? Image.network(
                imageUrl,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: double.infinity,
                    height: 200,
                    color: Colors.grey[300],
                    child: const Icon(Icons.broken_image, color: Colors.grey),
                  );
                },
              )
            : Container(
                width: double.infinity,
                height: 200,
                color: Colors.grey[300],
                child: const Icon(
                  Icons.image_not_supported,
                  color: Colors.grey,
                ),
              ),
      ),
    );
  }

  Widget _buildArticleContent(String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: mdMedium.copyWith(color: black950),
          ),
          SizedBox(height: 8),
          Html(
            data: description,
            style: {
              "body": Style(
                color: black950,
                fontSize: FontSize.small,
                textAlign: TextAlign.justify,
              ),
              "p": Style(margin: Margins.zero),
            },
          ),
        ],
      ),
    );
  }
}
