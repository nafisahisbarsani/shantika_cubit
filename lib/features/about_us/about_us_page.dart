import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../ui/color.dart';
import '../../ui/typography.dart';
import '../../ui/shared_widget/custom_arrow.dart';
import 'cubit/about_us_cubit.dart';
import '../../model/about_us_model.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AboutUsCubit()..init()..fetchAboutUs(),
      child: Scaffold(
        backgroundColor: black00,
        body: BlocBuilder<AboutUsCubit, AboutUsState>(
          builder: (context, state) {
            if (state is AboutUsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is AboutUsLoaded) {
              final AboutUsModel about = state.about;
              return SingleChildScrollView(
                child: Column(
                  children: [
                    _buildHeader(),
                    _buildImage(about.image),
                    _buildDescription(about.description),
                    _buildContact(about.address),
                    const SizedBox(height: 50),
                  ],
                ),
              );
            } else if (state is AboutUsError) {
              return Center(child: Text(state.message));
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
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
    child: CustomArrow(title: "Tentang Kami"),
  );
}

Widget _buildImage(String? imageUrl) {
  return Padding(
    padding: const EdgeInsets.only(top: 24, left: 20, right: 20),
    child: Column(
      children: [
        Text("NEW SHANTIKA", style: lgSemiBold),
        const SizedBox(height: 12),
        imageUrl != null
            ? Image.network(imageUrl)
            : Image.asset("assets/images/travel.png"),
      ],
    ),
  );
}

Widget _buildDescription(String? description) {
  return Padding(
    padding: const EdgeInsets.only(top: 24, left: 20, right: 20),
    child: Text(
      description ?? "Tidak ada deskripsi tersedia",
      style: smRegular,
      textAlign: TextAlign.center,
    ),
  );
}

Widget _buildContact(String? address) {
  return Padding(
    padding: const EdgeInsets.only(top: 24, left: 20, right: 20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/images/insta.svg"),
            const SizedBox(width: 32),
            SvgPicture.asset("assets/images/mail.svg"),
            const SizedBox(width: 32),
            SvgPicture.asset("assets/images/fb.svg"),
          ],
        ),
        const SizedBox(height: 24),
        Text(
          address ?? "-",
          style: mdMedium.copyWith(color: textDarkSecondary),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}
