import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_fraternity_of_information_technology/wall/message_bubble.dart';
import 'package:flutter/material.dart';

class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
    final authenticatedUser = FirebaseAuth.instance.currentUser!;
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('chat')
            .orderBy('createdAt', descending: true)
            .snapshots(),
        builder: (ctx, chatSnapshots) {
          if (chatSnapshots.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!chatSnapshots.hasData || chatSnapshots.data!.docs.isEmpty) {
            return Center(
              child: Text('No messages found'),
            );
          }
          if (chatSnapshots.hasError) {
            return Center(
              child: Text('Something went Wrong'),
            );
          }
          final loadedMessages = chatSnapshots.data!.docs;
          return ListView.builder(
              padding: EdgeInsets.only(bottom: 20, left: 13, right: 13),
              reverse: true,
              itemCount: loadedMessages.length,
              itemBuilder: (ctx, index) {
                final chatMessage = loadedMessages[index].data();
                final nextChatMessage = index + 1 < loadedMessages.length
                    ? loadedMessages[index + 1].data()
                    : null;
                final currentMessageUserId = chatMessage['userId'];
                final nextMessageUserId =
                    nextChatMessage != null ? nextChatMessage['userId'] : null;
                final nextUserIsSame =
                    nextMessageUserId == currentMessageUserId;

                if (nextUserIsSame) {
                  return MessageBubble.next(
                    message: chatMessage['text'],
                    isMe: authenticatedUser.uid == currentMessageUserId,
                  );
                } else {
                  return MessageBubble.first(
                      userImage:
                          'https://cdn-icons-png.flaticon.com/512/219/219986.png',
                      username: chatMessage['userName'],
                      message: chatMessage['text'],
                      isMe: authenticatedUser.uid == currentMessageUserId);
                }
              });
        });
  }
}
