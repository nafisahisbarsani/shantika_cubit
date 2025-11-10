import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shantika_cubit/ui/color.dart';
import 'package:shantika_cubit/ui/dimension.dart';
import 'package:shantika_cubit/ui/shared_widget/custom_card.dart';
import 'package:shantika_cubit/ui/typography.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black00,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(
            color: black00,
            boxShadow: [
              BoxShadow(color: black200, offset: Offset(0, 2), blurRadius: 4),
            ],
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Center(child: Text("Chat", style: xlMedium)),
          ),
        ),
      ),
      body: _buildChatList(),
    );
  }

  Widget _buildChatList() {
    final List<ChatItem> chatItems = [
      ChatItem(
        title: "Chat CS Pusat New Shantika",
        svgAsset: 'assets/images/telepon.svg',
      ),
      ChatItem(
        title: "Whatsapp Agen Semarang",
        svgAsset: 'assets/images/whatsapp.svg',
      ),
      ChatItem(
        title: "Whatsapp Agen Jepara",
        svgAsset: 'assets/images/whatsapp.svg',
      ),
      ChatItem(
        title: "Whatsapp Agen Kudus",
        svgAsset: 'assets/images/whatsapp.svg',
      ),
      ChatItem(
        title: "Facebook Agen Semarang",
        svgAsset: 'assets/images/facebook.svg',
      ),
      ChatItem(
        title: "Facebook Agen Jepara",
        svgAsset: 'assets/images/facebook.svg',
      ),
      ChatItem(
        title: "Facebook Agen Kudus",
        svgAsset: 'assets/images/facebook.svg',
      ),
    ];

    return ListView.builder(
      padding: const EdgeInsets.only(top: spacing4, bottom: spacing4),
      itemCount: chatItems.length,
      itemBuilder: (context, index) {
        final item = chatItems[index];
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: spacing6,
            vertical: spacing3,
          ),
          child: CustomCard(
            shadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
            borderRadius: BorderRadius.circular(borderRadius300),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  SvgPicture.asset(item.svgAsset, width: 35, height: 35),
                  SizedBox(width: spacing4),
                  Expanded(child: Text(item.title, style: sRegular)),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class ChatItem {
  final String title;
  final String svgAsset;

  ChatItem({required this.title, required this.svgAsset});
}
