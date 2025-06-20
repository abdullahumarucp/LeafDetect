import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'assets_manager.dart'; // Update the path if necessary
import 'text_widget.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({
    super.key,
    required this.msg,
    required this.chatIndex,
  });

  final String msg;
  final int chatIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: chatIndex == 0 ? Colors.grey[850] : Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  chatIndex == 0
                      ? AssetsManager.imagePath
                      : AssetsManager.botImage,
                  height: 30,
                  width: 30,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: chatIndex == 0
                      ? TextWidget(
                          label: msg,
                        )
                      : DefaultTextStyle(
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                          child: AnimatedTextKit(
                            animatedTexts: [
                              TyperAnimatedText(msg.trim()),
                            ],
                            isRepeatingAnimation: false,
                            displayFullTextOnTap: true,
                          ),
                        ),
                ),
                if (chatIndex != 0)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.thumb_up_alt_outlined, color: Colors.white),
                      SizedBox(width: 5),
                      Icon(Icons.thumb_down_alt_outlined, color: Colors.white),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
