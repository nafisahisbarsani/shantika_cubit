import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shantika_cubit/ui/color.dart';
import 'package:shantika_cubit/ui/typography.dart';
import '../../ui/shared_widget/custom_arrow.dart';
import '../../features/faq/cubit/faq_cubit.dart';

class FaqPage extends StatelessWidget {
  const FaqPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FaqCubit()..init()..getFaq(),
      child: const _FaqView(),
    );
  }
}

class _FaqView extends StatelessWidget {
  const _FaqView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black00,
      body: Column(
        children: [
          _buildHeader(),
          Expanded(
            child: BlocBuilder<FaqCubit, FaqState>(
              builder: (context, state) {
                if (state is FaqStateLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is FaqStateError) {
                  return Center(
                    child: Text(
                      state.message,
                      style: smRegular.copyWith(color: textDarkSecondary),
                    ),
                  );
                } else if (state is FaqStateEmpty) {
                  return Center(
                    child: Text(
                      'Tidak ada FAQ tersedia',
                      style: smRegular.copyWith(color: textDarkSecondary),
                    ),
                  );
                } else if (state is FaqStateData) {
                  final faqs = state.faqList;
                  return SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    child: Column(
                      children: faqs
                          .map((faq) => _buildFaqItem(
                        faq.question ?? "-",
                        faq.answer ?? "-",
                      ))
                          .toList(),
                    ),
                  );
                }

                // default (initial)
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      decoration: BoxDecoration(
        color: black00,
        boxShadow: [
          BoxShadow(
            color: black200.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: CustomArrow(title: "FAQ"),
    );
  }

  Widget _buildFaqItem(String question, String answer) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: bgSurfacePrimary,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: black100.withOpacity(0.2),
            offset: const Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: Theme(
        data: ThemeData().copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          title: Text(question, style: smRegular),
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          children: [
            Text(answer, style: smRegular.copyWith(color: textDarkSecondary)),
          ],
        ),
      ),
    );
  }
}
