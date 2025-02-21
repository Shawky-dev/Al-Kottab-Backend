import 'package:flutter/material.dart';
import 'chat_bubble.dart'; // Ensure this import points to your ChatBubble widget

class ChatScreen extends StatelessWidget {
  final String teacherName;
  final String teacherImage;

  const ChatScreen({
    super.key,
    required this.teacherName,
    required this.teacherImage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            // Teacher's Image on the very left
            CircleAvatar(
              backgroundImage: AssetImage(teacherImage),
              radius: 20,
            ),
            const SizedBox(width: 10), // Spacing between image and name
            // Teacher's Name to the right of the image
            Text(teacherName),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: const [
                // Sample messages
                ChatBubble(
                  message: "مرحبًا! كيف يمكنني مساعدتك؟",
                  isMe: false,
                ),
                ChatBubble(
                  message: "أريد حجز جلسة لتعليم اللغة العربية.",
                  isMe: true,
                ),
                ChatBubble(
                  message: "بالطبع! ما هو الوقت المناسب لك؟",
                  isMe: false,
                ),
                ChatBubble(
                  message: "هل يوم الخميس الساعة 10 صباحًا مناسب؟",
                  isMe: true,
                ),
                ChatBubble(
                  message: "نعم، هذا الوقت مناسب. سأرسل لك تفاصيل الحجز.",
                  isMe: false,
                ),
              ],
            ),
          ),
          // Message input field
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "اكتب رسالة...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    // Implement send message functionality
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}