import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shantika_cubit/ui/color.dart';
import 'package:shantika_cubit/ui/dimension.dart';
import 'package:shantika_cubit/ui/shared_widget/custom_card.dart';
import 'package:shantika_cubit/ui/typography.dart';
import '../../features/chat/cubit/chat_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChatCubit()
        ..init()
        ..fetchChats(),
      child: Scaffold(
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
        body: BlocBuilder<ChatCubit, ChatState>(
          builder: (context, state) {
            if (state is ChatLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ChatError) {
              return Center(child: Text(state.message));
            } else if (state is ChatEmpty) {
              return const Center(child: Text("No chat available"));
            } else if (state is ChatStateData) {
              return ListView.builder(
                padding: const EdgeInsets.only(top: spacing4, bottom: spacing4),
                itemCount: state.chatList.length,
                itemBuilder: (context, index) {
                  final chat = state.chatList[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: spacing6,
                      vertical: spacing3,
                    ),
                    child: CustomCard(
                      onTap: () async {
                        final link = chat.value ?? chat.value;
                        if (link != null && link.isNotEmpty) {
                          final Uri url = Uri.parse(link);
                          if (await canLaunchUrl(url)) {
                            await launchUrl(
                              url,
                              mode: LaunchMode.externalApplication,
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Tidak dapat membuka link'),
                              ),
                            );
                          }
                        }
                      },
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
                            SvgPicture.asset(
                              'assets/images/whatsapp.svg',
                              width: 35,
                              height: 35,
                            ),
                            SizedBox(width: spacing4),
                            Expanded(
                              child: Text(chat.name ?? '-', style: sRegular),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
