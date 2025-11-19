import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shantika_cubit/ui/typography.dart';
import '../../model/social_media_model.dart';
import '../../ui/color.dart';
import '../../ui/dimension.dart';
import '../../ui/shared_widget/custom_arrow.dart';
import '../../ui/shared_widget/custom_card.dart';
import 'cubit/social_media_cubit.dart';

class SocialMediaPage extends StatelessWidget {
  const SocialMediaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SocialMediaCubit()
        ..init()
        ..fetchSocialMedia(),
      child: Scaffold(
        backgroundColor: black00,
        body: SingleChildScrollView(
          child: Column(children: [_buildHeader(), _buildSocialMediaList()]),
        ),
      ),
    );
  }
}

Widget _buildHeader() {
  return Container(
    decoration: BoxDecoration(color: black00),
    child: CustomArrow(title: "Sosial Media"),
  );
}

Widget _buildSocialMediaList() {
  return BlocBuilder<SocialMediaCubit, SocialMediaState>(
    builder: (context, state) {
      if (state is SocialMediaLoading) {
        return Center(
          child: Padding(
            padding: EdgeInsets.only(top: 50),
            child: CircularProgressIndicator(),
          ),
        );
      }

      if (state is SocialMediaError) {
        return Padding(padding: EdgeInsets.all(20), child: Text(state.message));
      }

      if (state is SocialMediaEmpty) {
        return Padding(
          padding: EdgeInsets.all(20),
          child: Text("Tidak ada data sosial media"),
        );
      }

      if (state is SocialMediaStateData) {
        return Column(
          children: state.items
              .map((item) => _buildItem(item, context))
              .toList(),
        );
      }

      return SizedBox.shrink();
    },
  );
}

Widget _buildItem(SocialMediaModel item, BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(left: 20, right: 20, top: 8),
    child: CustomCard(
      onTap: () async {
        final value = item.value;
        if (value == null || value.isEmpty) return;
        Uri uri;
        if (value.contains("@")) {
          uri = Uri.parse("mailto:$value");
        } else {
          uri = Uri.parse(value);
        }
        if (await canLaunchUrl(uri)) {
          await launchUrl(
            uri,
            mode: LaunchMode.externalApplication,
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Tidak dapat membuka link')),
          );
        }
      },      shadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 4,
          offset: Offset(0, 2),
        ),
      ],
      borderRadius: BorderRadius.circular(borderRadius300),
      child: Padding(
        padding: EdgeInsets.all(14),
        child: Row(
          children: [
            if (item.icon != null && item.icon!.isNotEmpty)
              Image.network(
                item.icon!,
                width: 35,
                height: 35,
                errorBuilder: (_, __, ___) => Icon(Icons.link),
              )
            else Icon(Icons.link),
            SizedBox(width: spacing4),
            Expanded(child: Text(item.name ?? "Social Media", style: sRegular)),
          ],
        ),
      ),
    ),
  );
}
