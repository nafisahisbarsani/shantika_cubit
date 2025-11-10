import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:html/parser.dart' as html_parser;
import '../../../model/terms_model.dart';
import '../../ui/color.dart';
import '../../ui/shared_widget/custom_arrow.dart';
import '../../ui/typography.dart';
import 'cubit/terms_conditions_cubit.dart';

class TermConditionPage extends StatelessWidget {
  const TermConditionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TermsConditionsCubit()
        ..init()
        ..termsConditions(),
      child: Scaffold(
        backgroundColor: black00,
        body: BlocBuilder<TermsConditionsCubit, TermsConditionsState>(
          builder: (context, state) {
            Widget body;

            if (state is TermsConditionsLoading) {
              body = const Center(child: CircularProgressIndicator());
            } else if (state is TermsConditionsError) {
              body = Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    state.message,
                    style: xsMedium.copyWith(color: Colors.redAccent),
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            } else if (state is TermsConditionStateData) {
              final TermsModel data = state.termsConditionModel;

              // Parsing HTML content menjadi plain text
              final document = html_parser.parse(data.content ?? "");
              final String parsedText =
                  document.body?.text.trim() ?? "Tidak ada konten tersedia.";

              body = SingleChildScrollView(
                padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.name ?? "Syarat & Ketentuan",
                      style: sSemiBold,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      parsedText,
                      style: xsRegular.copyWith(color: textDarkSecondary),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              );
            } else {
              body = const SizedBox.shrink();
            }

            return Column(
              children: [
                _buildHeader(),
                Expanded(child: body),
              ],
            );
          },
        ),
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
      child: const CustomArrow(title: "Syarat & Ketentuan"),
    );
  }
}
